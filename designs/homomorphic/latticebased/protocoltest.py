import hashlib

import keyexchange
import hmac as _hmac

from crypto.utilities import integer_to_bytes, xor_subroutine

STAGES = ["initiating exchange", "establishing shared secret", "waiting for confirmation code"]

def hash_function(data, algorithm="sha256"):
    return getattr(hashlib, algorithm.lower())(data).digest()
    
def hmac(data, key, algorithm="sha256"):
    return _hmac.HMAC(key, data, getattr(hashlib, algorithm.lower())).digest()

class Key_Exchange_Protocol(object):
    
    def __init__(self, public_key, private_key, hash_function=hash_function, secret_size=32):
        self.public_key = public_key
        self.private_key = private_key
        self.hash_function = hash_function
        self.secret_size = secret_size
        self.confirm_connection_string = "Good happy success :)"
        self.stages = iter(STAGES)
        
    def retrieve_public_key(self, identifier):
        raise NotImplementedError()
        
    def validate_public_key(self, identifier, others_public_key):
        raise NotImplementedError()
        
    def store_public_key(self, identifier, public_key):
        raise NotImplementedError
        
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
        return confirmation_code == self.confirmation_code
    
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
        messages_b = iter([str(hex(item)) for item in range(16)])
        
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
            
if __name__ == "__main__":
    Key_Exchange_Protocol.unit_test()   
    Replay_Attack_Countermeasure.unit_test()
    