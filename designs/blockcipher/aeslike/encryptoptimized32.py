from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left, slide, bytes_to_integer, integer_to_bytes

KEY_SIZE = 16
WORDSIZE = 32
ROUNDS = 1

S_BOX = [11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7]
S_BOX2 = [4, 10, 1, 6, 8, 15, 7, 12, 3, 0, 13, 14, 5, 9, 11, 2]
S_BOX256 = []
for byte in range(256):
    S_BOX256.append((S_BOX[byte >> 4] << 4) | S_BOX2[byte & 15])              
        
def add_key_and_constants(a, b, c, d, key, round):    
    a ^= key[0] ^ (S_BOX256[ 0 + 0 + round] << 24) ^ (S_BOX256[ 0 + 1 + round] << 16) ^ (S_BOX256[ 0 + 2 + round] << 8) ^ (S_BOX256[ 0 + 3 + round])
    b ^= key[1] ^ (S_BOX256[ 4 + 0 + round] << 24) ^ (S_BOX256[ 4 + 1 + round] << 16) ^ (S_BOX256[ 4 + 2 + round] << 8) ^ (S_BOX256[ 4 + 3 + round])
    c ^= key[2] ^ (S_BOX256[ 8 + 0 + round] << 24) ^ (S_BOX256[ 8 + 1 + round] << 16) ^ (S_BOX256[ 8 + 2 + round] << 8) ^ (S_BOX256[ 8 + 3 + round])
    d ^= key[3] ^ (S_BOX256[12 + 0 + round] << 24) ^ (S_BOX256[12 + 1 + round] << 16) ^ (S_BOX256[12 + 2 + round] << 8) ^ (S_BOX256[12 + 3 + round])    
    return a, b, c, d
    
def vector_rotate(word, amount, wordsize=WORDSIZE):
    return ((rotate_left((word >> 24) & 255, amount, 8) << 24) | 
            (rotate_left((word >> 16) & 255, amount, 8) << 16) | 
            (rotate_left((word >> 8) & 255, amount, 8)  <<  8) | 
            rotate_left(word & 255, amount, 8))   
    
def mix_pairs(a, b, c, d, wordsize=WORDSIZE):        
    a ^= b
    c ^= d    
    a = vector_rotate(a, 1)
    c = vector_rotate(c, 1)
    b ^= a
    d ^= c
    b = vector_rotate(b, 2)
    d = vector_rotate(d, 2)
    a ^= b
    c ^= d
    a = vector_rotate(a, 4)
    c = vector_rotate(c, 4)
    b ^= a
    d ^= c
    return a, b, c, d
    
def shift_rows(b, d, amount, wordsize=WORDSIZE):    
    b = rotate_left(b, (8 * amount), 32)#wordsize)
    d = rotate_left(d, (8 * amount), 32)#wordsize)
    return b, d
                
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
    a, b, c, d = mix_pairs(a, b, c, d, wordsize)
    b, d = shift_rows(b, d, 1, wordsize)    
    a, b, c, d = mix_pairs(a, b, c, d, wordsize)
    b, d = shift_rows(b, d, 2, wordsize)
    a, b, c, d = mix_pairs(a, b, c, d, wordsize) 
    a, c, b, d = mix_pairs(a, c, b, d, wordsize)
    return a, b, c, d
    
def sbox_layer(a, b, c, d):
    a = (S_BOX256[(a >> 24) & 255] << 24) | (S_BOX256[(a >> 16) & 255] << 16) | (S_BOX256[(a >> 8) & 255] << 8) | S_BOX256[a & 255]
    b = (S_BOX256[(b >> 24) & 255] << 24) | (S_BOX256[(b >> 16) & 255] << 16) | (S_BOX256[(b >> 8) & 255] << 8) | S_BOX256[b & 255]
    c = (S_BOX256[(c >> 24) & 255] << 24) | (S_BOX256[(c >> 16) & 255] << 16) | (S_BOX256[(c >> 8) & 255] << 8) | S_BOX256[c & 255]
    d = (S_BOX256[(d >> 24) & 255] << 24) | (S_BOX256[(d >> 16) & 255] << 16) | (S_BOX256[(d >> 8) & 255] << 8) | S_BOX256[d & 255]
    return a, b, c, d
    
def transposition(a, b, c, d, mask0=0xFF000000, mask1=0x00FF0000, mask2=0x0000FF00, mask3=0x000000FF):             
    _a = ((c & mask3) << 24) | ((b & mask1) <<  0) | ((b & mask0) >> 16) | (d & mask3)    
    _b = ((d & mask0) <<  0) | ((b & mask2) <<  8) | ((c & mask1) >>  8) | ((a & mask0) >> 24)
    _c = ((d & mask1) <<  8) | ((a & mask3) << 16) | ((d & mask2) >>  0) | ((c & mask0) >> 24)
    _d = ((a & mask1) <<  8) | ((c & mask2) <<  8) | ((a & mask2) >>  0) | (b & mask3)
    return _a, _b, _c, _d

    
    
def encrypt(plaintext, key, wordsize=WORDSIZE, rounds=ROUNDS):      
    # 128 bit state    
    assert len(key) == KEY_SIZE
    assert isinstance(plaintext, bytearray)
    assert len(plaintext) == 16, (len(plaintext), plaintext)            
    a, b, c, d = [bytes_to_integer(word) for word in slide(plaintext, 4)] # this conversion makes this version slower then the 8-bit python version
    key = [bytes_to_integer(word) for word in slide(key, 4)]
    for round in range(rounds):
        a, b, c, d = add_key_and_constants(a, b, c, d, key, round)        
        a, b, c, d = sbox_layer(a, b, c, d)       
        a, b, c, d = mix_state(a, b, c, d)         
        a, b, c, d = transposition(a, b, c, d)      
    plaintext[:] = integer_to_bytes(a, 4) + integer_to_bytes(b, 4) + integer_to_bytes(c, 4) + integer_to_bytes(d, 4)
    return plaintext
            
def generate_key():
    return bytearray(urandom(KEY_SIZE))
    
def test_encrypt():
    key = range(KEY_SIZE)     
    #key = bytearray(32)
    #key[0] = 1
    message = bytearray(range(16))
    message[0] = 1
    ciphertext = encrypt(message, key)
    print ciphertext
    #plaintext = decrypt(message, key)
    #assert plaintext == message, (plaintext, message)
    
    message = bytearray(range(16))
    message[0] = 2
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
            assert len(data) == self.blocksize, (len(data), self.blocksize)
            encrypt(data, key)      
            
    
    Test_Cipher.test_metrics(generate_key(), "\x00" * 16, avalanche_test=False, randomness_test=False,  bias_test=False, period_test=False)

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
    