from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left

KEY_SIZE = 32
WORDSIZE = 8
ROUNDS = 6

S_BOX = [11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7]
S_BOX256 = []
for byte in range(256):
    S_BOX256.append((S_BOX[byte >> 4] << 4) | S_BOX[byte & 15])              

INVERSE_S_BOX256 = [0] * 256
for index in range(256):
    INVERSE_S_BOX256[S_BOX256[index]] = index
        
def add_key(seed, index, index2, key):    
    seed[index] ^= next(key) ^ index  
    seed[index2] ^= next(key) ^ index2
           
def add_constant(seed, index, index2, constants):            
    add_key(seed, index + 0, index2 + 0, constants)
    add_key(seed, index + 5, index2 + 5, constants)
    add_key(seed, index + 10, index2 + 10, constants)
    add_key(seed, index + 15, index2 + 15, constants)    
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, c):
    t = b
    b = choice(a, b, c)
    c = choice(a, c, t)
    return b, c
    
def bit_transposition(left, right, key, key_index, wordsize=WORDSIZE):
    left, right = choice_swap(key[key_index], left, right)
    left = rotate_left(left, 1, wordsize)
    
    left, right = choice_swap(key[key_index + 1], left, right)
    right = rotate_left(right, 2, wordsize)
    
    left, right = choice_swap(key[key_index + 2], left, right)
    left = rotate_left(left, 4, wordsize)
    
    left, right = choice_swap(key[key_index + 3], left, right)
    return left, right
    
def mix_pairs(a, b, c, d, key, wordsize=WORDSIZE):    
    key_index = 0
    for index in range(4):               
        a[index], b[index] = bit_transposition(a[index], b[index], key, key_index, wordsize)
        key_index += 4        
        c[index], d[index] = bit_transposition(c[index], d[index], key, key_index, wordsize)
        key_index += 4        
    
def shift_rows(b, d, amount, wordsize=WORDSIZE):
    _b = b[:amount]
    del b[:amount]
    b.extend(_b)
    
    _d = d[:amount]
    del d[:amount]
    d.extend(_d)
        
        
def bit_permutation(a, b, c, d, key, wordsize=WORDSIZE):
    # 8 8 8 8 
    # 8 8 8 8 
    # 8 8 8 8 
    # 8 8 8 8 
    
    # mix pairs()
    
    # [a1b1] [a2b2] [a3b3] [a4b4]
    # [b1a1] [b2a2] [b3a3] [b4a4] <--- shift left by 1
                   
    # [c1d1] [c2d2] [c3d3] [c4d4] 
    # [d1c1] [d2c2] [d3c3] [d4c4] <--- shift left by 1
    
    # mix pairs()
    
    # [a1b1b2a2] [a2b2b3a3] [a3b3b4a4] [a4b4b1a4]
    # [b2a2b1a1] [b3a3a2b2] [b4a4a3b3] [b1a4a4b4] <--- shift left by 2
    #...
    # [c1d1] [c2d2] [c3d3] [c4d4] 
    # [d2c2] [d3c3] [d4c4] [d1c1] <--- shift left by 2
    
    
    # [a1b1] [a2b2] [a3b3] [a4b4]
    # [b2a2] [b3a3] [b4a4] [b1a4] <--- shift left by 2
    
    # [c1d1] [c2d2] [c3d3] [c4d4] 
    # [d2c2] [d3c3] [d4c4] [d1c1]
    
    mix_pairs(a, b, c, d, key, wordsize)
    shift_rows(b, d, 1, wordsize)    
    mix_pairs(a, b, c, d, key, wordsize)
    shift_rows(b, d, 2, wordsize)
    mix_pairs(a, b, c, d, key, wordsize)      
    
    b[:], c[:] = c[:], b[:]
    
def sbox_layer(a, b, c, d):
    for index in range(4):
        a[index] = S_BOX256[a[index]]
        b[index] = S_BOX256[b[index]]        
        c[index] = S_BOX256[c[index]]
        d[index] = S_BOX256[d[index]]
        
def keyed_permutation(a, b, c, d, key, wordsize=WORDSIZE):        
    bit_permutation(a, b, c, d, key)
    sbox_layer(a, b, c, d)            
    
def encrypt(plaintext, key, wordsize=WORDSIZE, rounds=ROUNDS):      
    # 128 bit state
    # hardware oriented: nothing but crossed wires (bit permutation) and a small s-box    
    assert len(key) == KEY_SIZE
    assert isinstance(plaintext, bytearray)
    a, b, c, d = plaintext[:4], plaintext[4:8], plaintext[8:12], plaintext[12:16]
    for round in range(rounds):
        keyed_permutation(a, b, c, d, key, wordsize)
    plaintext[:] = a + b + c + d
    return plaintext

def invert_keyed_permutation(a, b, c, d, key, wordsize=WORDSIZE):
    invert_bit_permutation(a, b, c, d, key)
    invert_sbox_layer(a, b, c, d)
    
def invert_sbox_layer(a, b, c, d):
    for index in range(4):
        a[index] = INVERSE_S_BOX256[a[index]]
        b[index] = INVERSE_S_BOX256[b[index]]
        c[index] = INVERSE_S_BOX256[c[index]]
        d[index] = INVERSE_S_BOX256[d[index]]
    
def invert_bit_permutation(a, b, c, d, key, wordsize=WORDSIZE):    
    mix_pairs(a, b, c, d, key, wordsize)
    shift_rows(b, d, 2, wordsize)
    mix_pairs(a, b, c, d, key, wordsize)
    shift_rows(b, d, 3, wordsize)
    mix_pairs(a, b, c, d, key, wordsize)
    
def decrypt(ciphertext, key, wordsize=WORDSIZE, rounds=ROUNDS): 
    a, b, c, d = ciphertext[:4], ciphertext[4:8], ciphertext[8:12], ciphertext[12:16]
    for round in range(rounds):
        invert_keyed_permutation(a, b, c, d, key, wordsize)
    ciphertext[:] = a + b + c + d
    return ciphertext
    
def generate_key():
    return bytearray(urandom(KEY_SIZE))
    
def test_encrypt():
    key = range(KEY_SIZE)     
    #key = bytearray(32)
    #key[0] = 1
    message = bytearray("Awesome1" * 2)
    ciphertext = encrypt(message, key)
    print ciphertext
    plaintext = decrypt(message, key)
    assert plaintext == message, (plaintext, message)
    
    message = bytearray("Awesome2" * 2)
    ciphertext = encrypt(message, key)
    print ciphertext
    plaintext = decrypt(message, key)
    assert plaintext == message, (plaintext, message)
    
              
def test_metrics():
    import crypto
    class Test_Cipher(crypto.Cipher):
                
                
        def __init__(self, *args):
            super(Test_Cipher, self).__init__(*args)
            self.blocksize = 16
            
        def encrypt_block(self, data, key, tag=None, tweak=None):        
            encrypt(data, key)      
            
    
    Test_Cipher.test_metrics(generate_key(), "\x00" * 16)
            
if __name__ == "__main__": 
    test_encrypt()
    test_metrics()
    