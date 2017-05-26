import crypto.designs.homomorphic.latticebased.modular as modular
from crypto.utilities import random_integer

DIMENSION = 3
P_SIZE = 66
K_SIZE = 66
N_SIZE = 133
R_SIZE = 32

def generate_private_key(keygen_function=modular.generate_key,
                         p_size=P_SIZE, k_size=K_SIZE, n_size=N_SIZE):                         
    return keygen_function(p_size, k_size, n_size)
        
def generate_public_key(private_key, dimension=DIMENSION, encryption_function=modular.encrypt):     
    public_key = [encryption_function(1, private_key)]        
    for counter in range(dimension - 1):
        public_key.append(encryption_function(0, private_key))           
    return public_key
    
def generate_keypair(keygen_private=generate_private_key,
                     keygen_public=generate_public_key):
    private_key = keygen_private()
    public_key = keygen_public(private_key)
    return public_key, private_key
    
def encrypt(message, public_key, r_size=R_SIZE):
    p1 = public_key[0]    
    ciphertext = (p1 * message) + sum(point * random_integer(r_size) for point in public_key[1:])    
    return ciphertext
    
def decrypt(ciphertext, private_key, decryption_function=modular.decrypt):
    return decryption_function(ciphertext, private_key)
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("modularpublickey", generate_keypair, encrypt, decrypt)
    
if __name__ == "__main__":
    test_encrypt_decrypt()        
        