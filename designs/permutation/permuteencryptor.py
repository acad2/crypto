""" encrypted_iv, random_key0 = permutation(iv || encryption_key)
    ciphertext_0, random_key1 = permutation(plaintext_0 || random_key0)
    ciphertext_1, random_key2 = permutation(plaintext_1 || random_key1)
    ...
    ciphertext_n, decryption_key = permutation(plaintext_n || random_key_n+1)
    decryption_key = decryption_key XOR key_material
    output iv, ciphertext_0 ... ciphertext_n, decryption_key

    decryption_key = decryption_key XOR key_material
    plaintext_n, random_key_n-1 = invert_permutation(ciphertext_n || decryption_key)
    plaintext_n-1, random_key_n-2 = invert_permutation(ciphertext_n-1 || decryption_key_n-1)
    ...
    _iv, _encryption_key = invert_permutation(encrypted_iv || random_key_0)
    if _iv == iv and _encryption_key == encryption_key:
        output plaintext_0 ... plaintext_n
    else:
        output InvalidTag
        
    perks: single pass authenticated encryption
           would appear to be beneficial to security to use new keys for subsequent blocks
               - especially if you don't send the encrypted iv;
                    - adversaries never see plaintext:ciphertext pairs under the initial encryption key
                    - all the plaintext:ciphertext pairs they do see are encrypted under a random key that will most likely only ever be used once
           works with a permutation; no block cipher construction and mode of operation required
           does not require having all of the blocks available up front to start processing
           support for configurable rate/key size
           
    flaws: requires implementing the inverse of the permutation
           cannot process blocks in parallel (is this true of all one pass authenticated encryption schemes?)
           cannot validate tag before decrypting (is this true of all one pass authenticated encryption schemes?)
                      
    interesting: the encryption key is not sufficient to decrypt a cryptogram. 
                 the information that is output at the end is actually a decryption key, encrypted with the mac key.                    
                    - could encrypt the decryption key with the initial encryption key
                    - or could use a different key
                        
                 the iv is actually the authentication tag
                 could encrypt IV with yet another key"""           
              
import hashlib
              
from crypto.utilities import slide, xor_subroutine, bytes_to_integer 
from arxcalibur512 import permutation, invert_permutation

ROUNDS = 2

def bytes_to_word32(data):
    return [bytes_to_integer(bytearray(block)) for block in slide(data, 4)]
    
def hash_function(data):
    return bytes_to_word32(hashlib.sha256(data).digest())
    
def encrypt(data, iv, key, associated_data='', hash_function=hash_function):
    block_key = key              
    assert len(block_key) == 8    
    assert len(iv) == 8
    assert not len(data) % 8
    ciphertexts = []
    for block in slide(hash_function(associated_data) + iv + data, 8):
        state = block + block_key        
        for round in range(ROUNDS):                   
            state = permutation(*[round, ] + state)           
        ciphertexts.extend(state[:8])
        block_key = list(state[8:])
        
    xor_subroutine(block_key, key)
    return ciphertexts + block_key
    
def decrypt(data_and_tag, iv, key, associated_data='', hash_function=hash_function):
    block_key = data_and_tag[-8:]
    xor_subroutine(block_key, key)
    
    ciphertexts = data_and_tag[:-8]
    plaintexts = []
    for ciphertext in reversed(list(slide(ciphertexts, 8))):
        state = ciphertext + block_key
        for round in reversed(range(ROUNDS)):        
            state = invert_permutation(*[round, ] + state)
        plaintexts.extend(state[:8])
        block_key = list(state[8:])   
    
    if list(plaintexts[-16:-8]) == iv and hash_function(associated_data) == plaintexts[-8:]:    
        return plaintexts[:-16]
    else:
        return None
        
def test_encrypt_decrypt():
    data    = [0, 0, 0, 0, 0, 0, 0, 1]
    data2   = [0, 0, 0, 0, 0, 0, 0, 2]
    iv      = [0, 0, 0, 0, 0, 0, 0, 4]
    key     = [0, 0, 0, 0, 0, 0, 0, 1]
    data_e  = "Wonderful, wonderful test data!"
    
    ciphertext = encrypt(data, iv, key, data_e)    
    plaintext = decrypt(ciphertext, iv, key, data_e)
    assert plaintext == data, (plaintext, data)
    
    ciphertext2 = encrypt(data2, iv, key, data_e + '1')
    plaintext2 = decrypt(ciphertext2, iv, key, data_e)
    assert plaintext2 is None
    
    ciphertext3 = encrypt(data, data2, key, data_e)
    plaintext3 = decrypt(ciphertext3, data2, key, data_e + '!')
    #print ciphertext
    #print
    #print ciphertext2
    #print 
    #print ciphertext3
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        
        
    
        
    
    
