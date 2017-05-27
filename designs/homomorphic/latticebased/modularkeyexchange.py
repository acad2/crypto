import crypto.designs.homomorphic.latticebased.modular as modular
from crypto.utilities import random_integer

def generate_private_key(keygen_function=modular.generate_key):
    """ usage: generate_private_key(keygen_function=secretkey.generate_key) => private_key
    
        Generates a private key, which is the key for a secret key homomorphic cipher. """                           
    return keygen_function(n_size=170)
        
def generate_public_key(private_key, encryption_function=modular.encrypt):    
    """ usage: generate_public_key(private_key,
                                   encryption_function=modular.encrypt) => public_key
                                   
        Returns two encryptions of 1, suitable for use as a public key. """
    public_key = (encryption_function(1, private_key),
                  encryption_function(1, private_key))
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    """ usage: generate_keypair(): => public_key, private_key
    
        Generates a public key and a private key. """                     
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def exchange_key(public_key, r_size=32):
    """ usage: exchange_key(public_key, r_size=32) => ciphertext, shared_secret
    
        Generates a ciphertext and shared secret.
        The ciphertext is delivered to the holder of the private key.
        shared_secret is the value they will obtain upon decrypting the ciphertext. """
    p1, p2 = public_key
    q1, q2 = random_integer(r_size), random_integer(r_size)
    ciphertext = (p1 * q1) + (p2 * q2)
    shared_secret = q1 + q2       
    return ciphertext, shared_secret
    
def recover_key(ciphertext, private_key, decryption_function=modular.decrypt):
    """ usage: recover_key(ciphertext, private_key,
                           decryption_function=modular.decrypt) => shared_secret
                           
        Returns a shared secret. """
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
    
    from crypto.utilities import size_in_bits
    public_sizes = [size_in_bits(item) for item in public_key]
    private_sizes = [size_in_bits(item) for item in private_key]
    print("Public key size: p1: {}; p2: {}; Total: {}".format(*public_sizes + [sum(public_sizes)]))
    print("Private key size: p: {}; k: {}; n: {}; Total: {}".format(*private_sizes + [sum(private_sizes)]))
    print("Ciphertext size : {}".format(size_in_bits(ciphertext3)))
    print("(sizes are in bits)")
    
if __name__ == "__main__":
    test_exchange_key_recover_key()        
        