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
import arxcalibur512 

ROUNDS = 2

def bytes_to_word32(data):
    return [bytes_to_integer(bytearray(block)) for block in slide(data, 4)]
    
def hash_function(data):
    return bytes_to_word32(hashlib.sha256(data).digest())
        
def pad_data_to_blocksize(data, blocksize):  # pad_data{data}_to_blocksize{blocksize}
    datasize = len(data)
    padding_amount = (blocksize - (datasize % blocksize))         
    if not padding_amount:        
        padding_characters = chr(0) * blocksize
    elif padding_amount == blocksize:
        padding_characters = chr(0) * blocksize
    else:                        
        padding_characters = chr(padding_amount) * padding_amount
    return data + padding_characters
        
def remove_padding(data, blocksize):
    padding_amount = data[-1]                  
    return bytes(data)[:-(padding_amount or blocksize)]
        
def _store_block(data, block_count, _data):        
    assert len(_data) == 8
    data[block_count * 8:(block_count + 1) * 8] = _data
    
def encrypt(data, iv, key, associated_data='', 
            hash_function=hash_function, permutation=arxcalibur512.permutation,
            rounds=ROUNDS):
    block_key = key         
    
    assert len(block_key) == 8    
    assert len(iv) == 8
    assert not len(data) % 8
    
    blocks = (block for block in slide(hash_function(associated_data) + iv + data, 8))
    for block_count, block in enumerate(blocks):
        state = block + block_key        
        for round in range(rounds):                   
            state = permutation(*[round, ] + state)           
        _store_block(data, block_count, state[:8])        
        block_key = list(state[8:])
    
    assert len(block_key) == len(key)
    xor_subroutine(block_key, key)
    return block_key # block_key is the tag
    
def decrypt(data, tag, iv, key, associated_data='', 
            hash_function=hash_function, invert_permutation=arxcalibur512.invert_permutation,
            rounds=ROUNDS):
    block_key = tag[:]
    xor_subroutine(block_key, key)
            
    blocks = (block for block in reversed(list(slide(data, 8))))
    for block_count, ciphertext in enumerate(blocks):
        state = ciphertext + block_key
        for round in reversed(range(rounds)):        
            state = invert_permutation(*[round, ] + state)
        _store_block(data, block_count, state[:8])        
        block_key = list(state[8:])   

    if list(data[8:16]) == iv and hash_function(associated_data) == data[-8:]:  
        remove_padding(data, 32)
        return True
    else:
        return False
        
def test_encrypt_decrypt():
    data    = [0, 0, 0, 0, 0, 0, 0, 1]
    data2   = [0, 0, 0, 0, 0, 0, 0, 2]
    iv      = [0, 0, 0, 0, 0, 0, 0, 4]
    key     = [0, 0, 0, 0, 0, 0, 0, 1]
    data_e  = "Wonderful, wonderful test data!"
    
    tag = encrypt(data, iv, key, data_e)    
    valid = decrypt(data, tag, iv, key, data_e)
    assert valid #plaintext == data, (plaintext, data)
    
    tag2 = encrypt(data2, iv, key, data_e + '1')
    valid = decrypt(data2, tag2, iv, key, data_e)
    assert not valid #plaintext2 is None
    
    data3 = pad_data_to_blocksize(data_e, 32)
    tag3 = encrypt(data3, iv, key, data_e)
    valid = decrypt(data3, tag3, iv, key, data_e)
    assert valid
    #tag3 = encrypt(data, data2, key, data_e)
    #valid = decrypt(data3, tag3, data2, key, data_e + '!')
    #print ciphertext
    #print
    #print ciphertext2
    #print 
    #print ciphertext3
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        
        
    
        
    
    
