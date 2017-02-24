from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left

KEY_SIZE = 16
WORDSIZE = 8
ROUNDS = 1

S_BOX = [11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7]
S_BOX2 = [4, 10, 1, 6, 8, 15, 7, 12, 3, 0, 13, 14, 5, 9, 11, 2]
S_BOX256 = []
for byte in range(256):
    S_BOX256.append((S_BOX[byte >> 4] << 4) | S_BOX2[byte & 15])              
        
def add_key_and_constants(a, b, c, d, key, round):
    for index in range(4):
        a[index] ^= key[0 + index] ^ S_BOX256[0 + index + round]
        b[index] ^= key[4 + index] ^ S_BOX256[4 + index + round]
        c[index] ^= key[8 + index] ^ S_BOX256[8 + index + round]
        d[index] ^= key[12 + index] ^ S_BOX256[12 + index + round]
            
def mix_pair(top, bottom, wordsize=WORDSIZE):    
    top ^= bottom
    top = rotate_left(top, 1, wordsize)
    bottom ^= top
    bottom = rotate_left(bottom, 2, wordsize)
    top ^= bottom
    top = rotate_left(top, 4, wordsize)
    bottom ^= top            
    return top, bottom
    
def mix_pairs(a, b, c, d, wordsize=WORDSIZE):        
    for index in range(4):               
        a[index], b[index] = mix_pair(a[index], b[index], wordsize)        
        c[index], d[index] = mix_pair(c[index], d[index], wordsize)        
    
def shift_rows(b, d, amount, wordsize=WORDSIZE):
    _b = b[:amount]
    del b[:amount]
    b.extend(_b)
    
    _d = d[:amount]
    del d[:amount]
    d.extend(_d)
                
def mix_state(a, b, c, d, wordsize=WORDSIZE):
    # a1 a2 a3 a4
    # b1 b2 b3 b4
    # c1 c2 c3 c4
    # d1 d2 d4 d4
    
    # mix pairs()
    
    # [a1b1] [a2b2] [a3b3] [a4b4]
    # [b1a1] [b2a2] [b3a3] [b4a4] <--- shift left by 1
                   
    # [c1d1] [c2d2] [c3d3] [c4d4] 
    # [d1c1] [d2c2] [d3c3] [d4c4] <--- shift left by 1
    
    # mix pairs()
    
    # [a1b1b2a2] [a2b2b3a3] [a3b3b4a4] [a4b4b1a4]
    # [b2a2b1a1] [b3a3a2b2] [b4a4a3b3] [b1a4a4b4] <--- shift left by 2
    #...
    mix_pairs(a, b, c, d, wordsize)
    shift_rows(b, d, 1, wordsize)    
    mix_pairs(a, b, c, d, wordsize)
    shift_rows(b, d, 2, wordsize)
    mix_pairs(a, b, c, d, wordsize) 
    mix_pairs(a, c, b, d, wordsize)
    
def sbox_layer(a, b, c, d):
    for index in range(4):
        a[index] = S_BOX256[a[index]]
        b[index] = S_BOX256[b[index]]        
        c[index] = S_BOX256[c[index]]
        d[index] = S_BOX256[d[index]]                 
    
def transposition(a, b, c, d):    
    temp = a[0]
    a[0] = c[3]
    c[3] = c[0]
    c[0] = d[1]
    d[1] = c[2]
    c[2] = d[2]
    d[2] = a[2]
    a[2] = b[0]
    b[0] = d[0]
    d[0] = a[1]
    a[1] = b[1]
    b[1] = b[2]
    b[2] = c[1]
    c[1] = a[3]
    a[3] = d[3]
    d[3] = b[3]
    b[3] = temp     
    
def encrypt(plaintext, key, wordsize=WORDSIZE, rounds=ROUNDS):      
    # 128 bit state    
    assert len(key) == KEY_SIZE
    assert isinstance(plaintext, bytearray)
    a, b, c, d = plaintext[:4], plaintext[4:8], plaintext[8:12], plaintext[12:16]
    for round in range(rounds):
        add_key_and_constants(a, b, c, d, key, round)        
        sbox_layer(a, b, c, d)
        mix_state(a, b, c, d)
        transposition(a, b, c, d)
    plaintext[:] = a + b + c + d
    return plaintext
            
def generate_key():
    return bytearray(urandom(KEY_SIZE))
    
def test_encrypt():
    key = range(KEY_SIZE)     
    #key = bytearray(32)
    #key[0] = 1
    message = bytearray("Awesome1" * 2)
    ciphertext = encrypt(message, key)
    print ciphertext
    #plaintext = decrypt(message, key)
    #assert plaintext == message, (plaintext, message)
    
    message = bytearray("Awesome2" * 2)
    ciphertext = encrypt(message, key)
    print ciphertext
    #plaintext = decrypt(message, key)
    #assert plaintext == message, (plaintext, message)
    
              
def test_metrics():
    import crypto
    class Test_Cipher(crypto.Cipher):
                
                
        def __init__(self, *args):
            super(Test_Cipher, self).__init__(*args)
            self.blocksize = 16
            
        def encrypt_block(self, data, key, tag=None, tweak=None):        
            encrypt(data, key)      
            
    
    Test_Cipher.test_metrics(generate_key(), "\x00" * 16)

def test_active_bits():    
    from crypto.analysis.active_bits import search_minimum_active_bits
    from crypto.utilities import integer_to_bytes, bytes_to_integer
    
    def test_function(state):
        a, b, c, d = state
        mix_state(a, b, c, d)
        return a, b, c, d
        
    def argument_function(a, b, c, d):
        return integer_to_bytes(a, 4), integer_to_bytes(b, 4), integer_to_bytes(c, 4), integer_to_bytes(d, 4)                
        
    def output_function(state):
        return tuple(bytes_to_integer(section) for section in state)
    
    search_minimum_active_bits(test_function, argument_function, output_function)
    
if __name__ == "__main__":     
    test_encrypt()
    #test_active_bits()
    test_metrics()
    