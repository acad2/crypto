""" Modification of "regular" knapsack public key cryptosystem.
    Multiplies key terms randomly before addition.
    Effectively increases the size of the set that elements are pulled from, without having to store all of the elements of the set.
    Results in expressions of the form:
        
        (k_0 * r_0) + (k_1 * r_1) + (k_2 * r_3) + ... (k_n * r_n)

    where the k_i are randomly selected and r_i randomly generated.
    
    Since elements of the public key are 0, multiplication by the random value does not alter their plaintext value.
    Ideally, with N elements in the set, there would be (max_r * N) elements in the augmented set. 
    In practice, it's more like (log(r) * N) elements in the augmented set. <- need more information.
    
    Also uses an implementation for selecting random elements from the public key in a manner that should resist side channel leakage. """    
from os import urandom

import secretkey
import crypto.designs.secureshuffle as secureshuffle

def encrypt(message, public_key, ciphertext_count=16, 
            prng=lambda amount: bytearray(urandom(amount)),
            size_in_bytes=4):        
    key_material = public_key[:]    
    ciphertext = 0               
    for count in range(ciphertext_count):               
        secureshuffle.shuffle(key_material, 1200, prng) # bit size must be >= log2(public_key[i])  
        ciphertext += key_material[0] * secretkey.random_integer(size_in_bytes)
    return ciphertext + message
    
def decrypt(ciphertext, private_key, decryption_function=secretkey.decrypt):
    return decryption_function(ciphertext, private_key) 
    
def generate_public_key(encryption_function, key, key_size=16):  
    """ Generate a public key, given an encryption function and key that outputs ciphertexts that are partially homomorphic. 
        
        A public key consists of encryptions of 0, represented as integers. """        
    return [encryption_function(0, key) for count in range(key_size)]
           
def randomize_public_key(public_key, encryption_function):
    return generate_public_key(encryption_function, public_key)
    
def generate_private_key():
    """ Generates a private key. """
    return secretkey.generate_key()    
    
def generate_keypair(encryption_function=secretkey.encrypt, randomize_key=True):
    """ Generates a random 256-bit private key and random (256-bit * 256) = 655356 bit (8192 byte) public key. """
    private_key = generate_private_key()
    pre_public_key = generate_public_key(encryption_function, private_key)       
    if randomize_key:
        public_key = randomize_public_key(pre_public_key, encrypt)    
    return public_key, private_key
    
def test_encrypt_decrypt():    
    print "Generating keypair"
    public_key, private_key = generate_keypair()
    print "Done"
    m = 1
    ciphertext = encrypt(m, public_key)
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    