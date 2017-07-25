from epqcrypto.utilities import random_integer, modular_inverse

P = (2 ** 772) - 545

POINT_COUNT = 4

def calculate_parameter_sizes(security_level):
    """ usage: calculate_parameters_sizes(security_level) => short_inverse size, r size, s size, e size, P size
    
        Given a target security level, designated in bytes, return appropriate parameter sizes for instantiating the trapdoor. """
    short_inverse_size = (security_level * 2)
    p_size = short_inverse_size + security_level + 1
    return short_inverse_size, security_level, security_level, security_level, p_size
    
def generate_private_key(short_inverse_size=64, p=P):
    """ usage: generate_private_key(short_inverse_size=65, p=P) => private_key
    
        Returns 1 integer, suitable for use as a private key. """
    short_inverse = (random_integer(short_inverse_size) << 1) | (random_integer(1) & 1)
    return short_inverse
    
def generate_public_key(private_key, r_size=32, p=P, point_count=POINT_COUNT): 
    """ usage: generate_public_key(private_key, r_size=32, p=P) => public_key
    
        Returns 1 integer, suitable for use as a public key. """
    random_number = modular_inverse(private_key, p) # selects a random integer with an appropriate sized inverse by selecting the inverse first
    public_key = []
    for count in range(point_count):
        point = (random_number * (random_integer(r_size) >> 1)) % p            
        public_key.append(point)
    return public_key
    
def generate_keypair():
    """ usage: generate_keypair() => public_key, private_key
    
        Generate a keypair; Returns 2 integers. """
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def exchange_key(public_key, s_size=32, e_size=32, p=P): 
    """ usage: exchange_key(public_key, s_size=32, e_size=32, p=P) => ciphertext, secret
    
        Returns a compressed ciphertext and a shared secret.
        The ciphertext should be delivered to the holder of the associated private key, so that they may recover the shared secret. """    
    c = 0
    for element in public_key:
        c += element * random_integer(s_size)
        
    c_high = c >> 772
    c = (c + c_high + (c_high << 5) + (c_high << 9)) % (2 ** 772)
    e = (-c) % (2 ** 256)
    c = (c >> 256) + 1    
    return c, e
        
def recover_key(ciphertext, private_key, p=P):
    """ usage: recover_key(ciphertext, private_key, p=P) => secret
    
        Returns a shared secret in the form of a random integer. """
    short_inverse = private_key
    sie_q = (short_inverse * ciphertext * (2 ** 256)) % p
    return sie_q / short_inverse  
    
def hash_public_key(hash_function, public_key):
    """ usage: hash_public_key(hash_function, public_key) => public_key_fingerprint
    
        Returns a hash of public key, suitable for use as an identifier. """
    return hash_function(serialize_public_key(public_key))
        
def serialize_public_key(public_key):
    """ usage: serialize_public_key(public_key) => serialized_public_key
        
        Returns a saved public key, in the form of bytes. """
    return save_data(public_key)
    
def deserialize_public_key(serialized_public_key):
    """ usage: deserialize_public_key(serialized_public_key) => public_key
        
        Loads a saved public key, as produced by serialize_public_key. """
    return load_data(serialized_public_key)
    
def test_serialized_public_key_deserialize_public_key():
    public_key, _ = generate_keypair()
    serialized = serialize_public_key(public_key)
    _public_key = deserialize_public_key(serialized)
    assert _public_key == public_key, (_public_key, public_key)
    
def test_exchange_key_recover_key():
    from epqcrypto.unittesting import test_key_exchange
    test_key_exchange("epqcryptokeyexchange", generate_keypair, exchange_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
           