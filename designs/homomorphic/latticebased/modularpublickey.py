import crypto.designs.homomorphic.latticebased.modular as modular
from crypto.utilities import random_integer

def generate_private_key(keygen_function=modular.generate_key):                         
    key = keygen_function(66, 66, 133)
    return key
    
def generate_public_key(private_key, encryption_function=modular.encrypt):    
    public_key = (encryption_function(1, private_key),
                  encryption_function(1, private_key))
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def exchange_key(public_key, r_size=32):
    p1, p2 = public_key
    q1, q2 = random_integer(r_size), random_integer(r_size)
    ciphertext = (p1 * q1) + (p2 * q2)
    shared_secret = q1 + q2       
    return ciphertext, shared_secret
    
def recover_key(ciphertext, private_key, decryption_function=modular.decrypt):
    return decryption_function(ciphertext, private_key)
    
def test_exchange_key_recover_key():
    print("Generating keypair...")
    public_key, private_key = generate_keypair()
    print("...done.")
    for count in range(1024):             
        ciphertext, secret = exchange_key(public_key)
        _secret = recover_key(ciphertext, private_key)
        assert _secret == secret, (_secret, secret)
    
    ciphertext1, secret1 = exchange_key(public_key)
    ciphertext2, secret2 = exchange_key(public_key)
    ciphertext3 = ciphertext1 + ciphertext2
    assert recover_key(ciphertext3, private_key) == secret1 + secret2
    assert recover_key(ciphertext3 + (public_key[0] * 1), private_key) == secret1 + 1 + secret2
    
if __name__ == "__main__":
    test_exchange_key_recover_key()        
        