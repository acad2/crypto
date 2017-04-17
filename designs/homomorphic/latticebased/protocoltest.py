import keyexchange
from hashing import hmac, hash_function

from crypto.utilities import integer_to_bytes, xor_subroutine, serialize_int, deserialize_int

class Key_Exchange_Protocol(object):

    STAGES = ["initiating exchange", "establishing shared secret", "waiting for confirmation code"]
    
    def __init__(self, public_key, private_key, hash_function=hash_function, secret_size=32):
        self.public_key = public_key
        self.private_key = private_key
        self.hash_function = hash_function
        self.secret_size = secret_size
        self.confirm_connection_string = "Good happy success :)"
        self.confirmation_code_size = len(hmac('', ''))
        self.stages = iter(Key_Exchange_Protocol.STAGES)
        self.stage = None
        
    def initiate_exchange(self, others_public_key):
        self.stage = next(self.stages)
        secret = self.secret_a = keyexchange.generate_random_secret(self.secret_size)
        return keyexchange.exchange_key(secret, others_public_key)
        
    def establish_secret(self, ciphertext):        
        self.stage = next(self.stages)
        secret_b = keyexchange.recover_key(ciphertext, self.private_key)
        self.shared_secret = self.hash_function(integer_to_bytes(self.secret_a ^ secret_b, self.secret_size))
        del self.secret_a
        
    def generate_confirmation_code(self):
        self.stage = next(self.stages)
        self.confirmation_code = hmac(self.confirm_connection_string, self.shared_secret)
        return self.confirmation_code
        
    def confirm_connection(self, confirmation_code):
        return confirmation_code == self.confirmation_code # change to constant time comparison
    
    @classmethod
    def generate_keypair(cls):
        return keyexchange.generate_keypair()
        
    @classmethod
    def unit_test(cls):
        pub1, priv1 = cls.generate_keypair()        
        pub2, priv2 = cls.generate_keypair()        
        
        peer_a = cls(pub1, priv1)
        peer_b = cls(pub2, priv2)
        
        ca = peer_a.initiate_exchange(peer_b.public_key)
        cb = peer_b.initiate_exchange(peer_a.public_key)
        assert ca != cb
        
        sa = peer_a.establish_secret(cb)
        sb = peer_b.establish_secret(ca)
        assert sa == sb
        
        hmac_a = peer_a.generate_confirmation_code()
        hmac_b = peer_b.generate_confirmation_code()
        assert hmac_a == hmac_b
        
        success_a = peer_a.confirm_connection(hmac_b)
        success_b = peer_b.confirm_connection(hmac_a)
        assert success_a and (success_a == success_b)
    
         
class Replay_Attack_Countermeasure(object):
            
    def __init__(self, nonce=0, hash_function=hash_function):
        self.nonce = nonce
        self.last_received_none = 0
        self.hash_function = hash_function
        self.hash_size = len(hash_function(''))
        self.state = bytearray(self.hash_size)
        
    def send(self, data):
        self.nonce += 1        
        nonce = str(self.nonce)                
        
        _hash = self.hash_function(nonce + self.state + data)        
        xor_subroutine(self.state, bytearray(_hash))                
        
        data = ' '.join((nonce, _hash, data))                
        return data
        
    def receive(self, data):
        nonce, data = data.split(' ', 1)
        nonce = int(nonce)                  
        if nonce <= self.last_received_none:
            raise ValueError("Invalid nonce")
        else:            
            self.last_received_none = nonce
            
        hash_size = self.hash_size
        _hash = data[:hash_size]        
        data = data[hash_size + 1:] # + 1 for the space         
        if self.hash_function(str(nonce) + self.state + data) != _hash:
            raise ValueError("Invalid hash")
            
        xor_subroutine(self.state, bytearray(_hash))   
        return data
        
    @classmethod
    def unit_test(cls):        
        messages_a = [str(item) for item in range(16)]
        messages_b = iter([str(hex(item)) * 200 for item in range(16)])
        
        peer_a = cls()
        peer_b = cls()
        
        for message_a in messages_a:            
            data = peer_a.send(message_a)
            _data = peer_b.receive(data)
            assert _data == message_a
            
            try:
                _data = peer_b.receive(data)
            except ValueError:
                pass
            else:
                raise ValueError("Accepted invalid nonce; Unit test failed") 
            
            message_b = next(messages_b)                    
            data = peer_b.send(message_b)
            _data = peer_a.receive(data)
            assert _data == message_b
            
            try:
                data2 = peer_a.receive(data)
            except ValueError:
                pass
            else:
                raise ValueError("Accepted invalid nonce; Unit test failed") 
            

class Basic_Connection(object):
                
    def __init__(self):        
        self.replay_attack_countermeasure = Replay_Attack_Countermeasure()                 
        
    def send(self, data):
        return self.replay_attack_countermeasure.send(data)
        
    def receive(self, data):
        return self.replay_attack_countermeasure.receive(data)
        
     
class Secure_Connection(Basic_Connection):
        
    def __init__(self, public_key, private_key, hash_function=hash_function, secret_size=32):
        super(Secure_Connection, self).__init__()
        self.key_exchange_protocol = Key_Exchange_Protocol(public_key, private_key, hash_function, secret_size)
        self.connection_confirmed = False
        
    def connect(self, peer_public_key):
        protocol = self.key_exchange_protocol
        public_key = keyexchange.serialize_public_key(protocol.public_key)
        
        packet = ' '.join([str(len(public_key)), public_key]) + serialize_int(protocol.initiate_exchange(peer_public_key))
        return self.send(packet)
        
    def accept(self, packet):                
        packet = super(Secure_Connection, self).receive(packet)
        key_size, packet = packet.split(' ', 1)
        key_size = int(key_size)
        
        peer_public_key = keyexchange.deserialize_public_key(packet[:key_size])
                
        protocol = self.key_exchange_protocol
        response = serialize_int(protocol.initiate_exchange(peer_public_key))
        protocol.establish_secret(deserialize_int(packet[key_size:]))
        code = protocol.generate_confirmation_code()
        
        return self.send(code + response)
    
    def initiator_confirm_connection(self, response):   
        response = super(Secure_Connection, self).receive(response)
        protocol = self.key_exchange_protocol
        code_size = protocol.confirmation_code_size
        code = response[:code_size]
        response = response[code_size:]
        
        protocol.establish_secret(deserialize_int(response))
        self_code = protocol.generate_confirmation_code()
        if protocol.confirm_connection(code):
            self.connection_confirmed = True
            return self.send(self_code)
                   
    def responder_confirm_connection(self, confirmation_code):  
        confirmation_code = super(Secure_Connection, self).receive(confirmation_code)
        if self.key_exchange_protocol.confirm_connection(confirmation_code):
            self.connection_confirmed = True
        
    def send(self, data):
        if self.connection_confirmed:
            data = self.secure_data(data)
        return super(Secure_Connection, self).send(data)
        
    def receive(self, data):
        data = super(Secure_Connection, self).receive(data)
        if self.connection_confirmed:
            data = self.access_secured_data(data)
        return data
        
    def secure_data(self, data): 
        raise NotImplementedError()        
        
    def access_secured_data(self, data):
        raise NotImplementedError()
        
    @classmethod
    def unit_test(cls):
        puba, priva = keyexchange.generate_keypair()
        pubb, privb = keyexchange.generate_keypair()
        
        peer_a = cls(puba, priva)
        peer_b = cls(pubb, privb)
        
        packet = peer_a.connect(pubb)
        response = peer_b.accept(packet)
        confirmation_code = peer_a.initiator_confirm_connection(response)
        peer_b.responder_confirm_connection(confirmation_code)
        
        assert peer_a.key_exchange_protocol.shared_secret == peer_b.key_exchange_protocol.shared_secret
        
       
    
if __name__ == "__main__":
    Key_Exchange_Protocol.unit_test()   
    Replay_Attack_Countermeasure.unit_test()
    Secure_Connection.unit_test()
    