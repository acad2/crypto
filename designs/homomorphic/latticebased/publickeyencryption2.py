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

from publickeyencryption import generate_keypair, decrypt
from secretkey import random_integer
import secureshuffle

def encrypt(message, public_key, ciphertext_count=16, 
            prng=lambda amount: bytearray(urandom(amount)),
            size_in_bytes=16):        
    key_material = public_key[:]    
    ciphertext = 0               
    for count in range(ciphertext_count):        
        secureshuffle.secure_shuffle(key_material, size_in_bytes * 8 * 9, prng) # bit size must be >= log2(public_key[i])  
        ciphertext += key_material[0] * random_integer(size_in_bytes)
    return ciphertext + message
    
def test_encrypt_decrypt():    
    public_key, private_key = generate_keypair()
    m = 1
    ciphertext = encrypt(m, public_key)
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    