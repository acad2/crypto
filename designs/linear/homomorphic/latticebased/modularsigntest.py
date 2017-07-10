import crypto.designs.homomorphic.latticebased.modular as modular
from crypto.utilities import random_integer

def generate_private_key(keygen_function=modular.generate_key):                         
    key = keygen_function(66, 66, 133)
    return key
    
def generate_public_key(private_key, encryption_function=modular.encrypt):    
    public_key = (encryption_function(1, private_key),
                  encryption_function(0, private_key))
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def verify(public_key, r_size=32):
    p1, p2 = public_key
    q1, q2 = random_integer(r_size), random_integer(r_size)
    ciphertext = (p1 * q1) + (p2 * q2)
    shared_secret = q1 + q2       
    return ciphertext, shared_secret
    
def sign(data_hash, public_key private_key, decryption_function=modular.decrypt):
    p1, p2 = public_key
    q1 = decryption_function(data_hash, private_key)
    data_hash -= (p1 * q1)
    while True:        
        if not data_hash % p2:
            q2 = data_hash / p2
            break
        else:
            p2 *= 3