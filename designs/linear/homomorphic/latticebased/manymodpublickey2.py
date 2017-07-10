import crypto.designs.homomorphic.latticebased.manymod2 as secretkey
from crypto.utilities import random_integer

R_SIZE = 32

def generate_private_key(keygen_function=secretkey.generate_key):    
    """ usage: generate_private_key(keygen_function=secretkey.generate_key,
                                    p_size=P_SIZE, k_size=K_SIZE, n_size=N_SIZE) => private_key
                                    
        Returns 3 numbers, suitable for use as a private key. """
    return keygen_function()
        
def generate_public_key(private_key, encryption_function=secretkey.encrypt):    
    """ usage: generate_public_key(private_key, dimension=2,
                                   encryption_function=secretkey.encrypt) => public_key
                                   
        Returns an encryption of o and 1. """
    public_key = [encryption_function(0, private_key), encryption_function(1, private_key)]            
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    """ usage: generate_keypair(keygen_private=generate_private_key,
                                keygen_public=generate_public_key) => public_key, private_key
                                
        Returns a public key and a private key. """        
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def encrypt(message, public_key, r_size=1, n=secretkey.N):
    """ usage: encrypt(message, public_key, r_size=R_SIZE) =>
        
        Returns a ciphertext.
        r_size determines the size of the randomly generated number. """      
    return ((public_key[0] * random_integer(r_size)) + (public_key[1] * message)) % n
    
def decrypt(ciphertext, private_key, decryption_function=secretkey.decrypt):
    """ usage: decrypt(ciphertext, private_key,
                       decryption_function=secretkey.decrypt) => plaintext
                       
        Returns plaintext. """
    return decryption_function(ciphertext, private_key)
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("manymodpublickey2", generate_keypair, encrypt, decrypt, plaintext_size=20, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()        
        