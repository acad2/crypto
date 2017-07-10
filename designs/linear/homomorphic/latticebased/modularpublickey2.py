import crypto.designs.homomorphic.latticebased.modular2 as modular
from crypto.utilities import random_integer

DIMENSION = 2
R_SIZE = 32

def generate_private_key(keygen_function=modular.generate_key):    
    """ usage: generate_private_key(keygen_function=modular.generate_key,
                                    p_size=P_SIZE, k_size=K_SIZE, n_size=N_SIZE) => private_key
                                    
        Returns 3 numbers, suitable for use as a private key. """
    return keygen_function()
        
def generate_public_key(private_key, dimension=DIMENSION, encryption_function=modular.encrypt):    
    """ usage: generate_public_key(private_key, dimension=2,
                                   encryption_function=modular.encrypt) => public_key
                                   
        Returns an encryption of 1, as well as encryptions of 0s.
        Increasing the dimension should increase the hardness of the public key encryption operation, but will also increase the size of the public key. """
    public_key = [encryption_function(1, private_key)]        
    for counter in range(dimension - 1):
        public_key.append(encryption_function(0, private_key))           
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    """ usage: generate_keypair(keygen_private=generate_private_key,
                                keygen_public=generate_public_key) => public_key, private_key
                                
        Returns a public key and a private key. """        
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def encrypt(message, public_key, r_size=R_SIZE, n=modular.N):
    """ usage: encrypt(message, public_key, r_size=R_SIZE) =>
        
        Returns a ciphertext.
        r_size determines the size of each randomly generated number. """      
    return ((public_key[0] * message) + sum(point * random_integer(r_size) for point in public_key[1:])) % n    
    
def decrypt(ciphertext, private_key, decryption_function=modular.decrypt):
    """ usage: decrypt(ciphertext, private_key,
                       decryption_function=modular.decrypt) => plaintext
                       
        Returns plaintext. """
    return decryption_function(ciphertext, private_key)
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("modularpublickey", generate_keypair, encrypt, decrypt, plaintext_size=32, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()        
        