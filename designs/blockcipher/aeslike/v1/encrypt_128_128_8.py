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
        
def add_constants(a, b, c, d, round):    
    for index in range(4):
        b[index] ^= S_BOX256[4 + index + round]
        c[index] ^= S_BOX256[8 + index + round]
        a[index] ^= S_BOX256[0 + index + round]
        d[index] ^= S_BOX256[12 + index + round]
            
def mix_pair(top, bottom, wordsize=WORDSIZE):    
    # a0 a1 a2 a3 a4 a5 a6 a7
    # b0 b1 b2 b3 b4 b5 b6 b7
    
    # a ^= b
   
    # a0b0 a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7
    # b0 b1 b2 b3 b4 b5 b6 b7   
    
    # rotate a left by 1
    
    # a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7 a0b0
    # b0 b1 b2 b3 b4 b5 b6 b7     

    # b ^= a
    
    # a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7 a0b0
    # b0a1b1 b1a2b2 b2a3b3 b3a4b4 b4a5b5 b5a6b6 b6a7b7 b7a0b0

    # rotate b left by 2
    
    # a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7 a0b0
    # b2a3b3 b3a4b4 b4a5b5 b5a6b6 b6a7b7 b7a0b0 b0a1b1 b1a2b2 
   
    # a ^= b
    
    # a1b1b2a3b3 a2b2b3a4b4 a3b3b4a5b5 a4b4b5a6b6 a5b5b6a7b7 a6b6b7a0b0 a7b7b0a1b1 a0b0b1a2b2
    # b2a3b3 b3a4b4 b4a5b5 b5a6b6 b6a7b7 b7a0b0 b0a1b1 b1a2b2 
   
    # rotate a left by 4
    
    # a5b5b6a7b7 a6b6b7a0b0 a7b7b0a1b1 a0b0b1a2b2 a1b1b2a3b3 a2b2b3a4b4 a3b3b4a5b5 a4b4b5a6b6 
    # b2a3b3 b3a4b4 b4a5b5 b5a6b6 b6a7b7 b7a0b0 b0a1b1 b1a2b2 
       
    # b ^= a
    
    # a5b5b6a7b7 a6b6b7a0b0 a7b7b0a1b1 a0b0b1a2b2 a1b1b2a3b3 a2b2b3a4b4 a3b3b4a5b5 a4b4b5a6b6 
    # b2a3b3a5b5b6a7b7 b3a4b4a6b6b7a0b0 b4a5b5a7b7b0a1b1 b5a6b6a0b0b1a2b2 b6a7b7a1b1b2a3b3 b7a0b0a2b2b3a4b4 b0a1b1a3b3b4a5b5 b1a2b2a4b4b5a6b6               
    top ^= bottom    
    top = rotate_left(top, 1, wordsize)
    bottom ^= top
    bottom = rotate_left(bottom, 2, wordsize)
    top ^= bottom
    top = rotate_left(top, 4, wordsize)
    bottom ^= top     
    #bottom = rotate_left(bottom, 5, wordsize) # does not really improve active bits; min is 47 without this step, and only 49 with it
    #top ^= bottom    
    return top, bottom
    
def mix_pairs(a, b, c, d, wordsize=WORDSIZE):        
    for index in range(4):               
        a[index], b[index] = mix_pair(a[index], b[index], wordsize)        
        c[index], d[index] = mix_pair(c[index], d[index], wordsize)        
    
def shift_rows(b, d, amount, wordsize=WORDSIZE):
    # this does the equivalent of rotate(b, (amount * 8), wordsize=32)
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
    
    # a1b1 a2b2 a3b3 a4b4
    # b1a1 b2a2 b3a3 b4a4 
               
    # c1d1 c2d2 c3d3 c4d4 
    # d1c1 d2c2 d3c3 d4c4 
    
    # shift rows(b, d, 1)
    
    # a1b1 a2b2 a3b3 a4b4
    # b2a2 b3a3 b4a4 b1a1 
               
    # c1d1 c2d2 c3d3 c4d4 
    # d2c2 d3c3 d4c4 d1c1 
    
    # mix pairs()
    
    # a1b1b2a2 a2b2b3a3 a3b3b4a4 a4b4b1a1
    # b2a2a1b1 b3a3a2b2 b4a4a3b3 b1a1a4b4
               
    # c1d1d2c2 c2d2d3c3 c3d3d4c4 c4d4d1c1
    # d2c2c1d1 d3c3c2d2 d4c4c3d3 d1c1c4d4
    
    # shift rows(b, d, 2)
    
    # a1b1b2a2 a2b2b3a3 a3b3b4a4 a4b4b1a1
    # b4a4a3b3 b1a1a4b4 b2a2a1b1 b3a3a2b2
               
    # c1d1d2c2 c2d2d3c3 c3d3d4c4 c4d4d1c1
    # d4c4c3d3 d1c1c4d4 d2c2c1d1 d3c3c2d2
    
    # mix pairs()    
    
    # a1b1b2a2b4a4a3b3 a2b2b3a3b1a1a4b4 a3b3b4a4b2a2a1b1 a4b4b1a1b3a3a2b2
    # b4a4a3b3a1b1b2a2 b1a1a4b4a2b2b3a3 b2a2a1b1a3b3b4a4 b3a3a2b2a4b4b1a1
               
    # c1d1d2c2d4c4c3d3 c2d2d3c3d1c1c4d4 c3d3d4c4d2c2c1d1 c4d4d1c1d3c3c2d2
    # d4c4c3d3c1d1d2c2 d1c1c4d4c2d2d3c3 d2c2c1d1c3d3d4c4 d3c3c2d2c4d4d1c1
    
    # mix the a row with the d row, and the b row with the c row        
    
    # a1b1b2a2b4a4a3b3d4c4c3d3c1d1d2c2 a2b2b3a3b1a1a4b4d1c1c4d4c2d2d3c3 a3b3b4a4b2a2a1b1d2c2c1d1c3d3d4c4 a4b4b1a1b3a3a2b2d3c3c2d2c4d4d1c1
    # b4a4a3b3a1b1b2a2c1d1d2c2d4c4c3d3 b1a1a4b4a2b2b3a3c2d2d3c3d1c1c4d4 b2a2a1b1a3b3b4a4c3d3d4c4d2c2c1d1 b3a3a2b2a4b4b1a1c4d4d1c1d3c3c2d2
               
    # c1d1d2c2d4c4c3d3b4a4a3b3a1b1b2a2 c2d2d3c3d1c1c4d4b1a1a4b4a2b2b3a3 c3d3d4c4d2c2c1d1b2a2a1b1a3b3b4a4 c4d4d1c1d3c3c2d2b3a3a2b2a4b4b1a1
    # d4c4c3d3c1d1d2c2a1b1b2a2b4a4a3b3 d1c1c4d4c2d2d3c3a2b2b3a3b1a1a4b4 d2c2c1d1c3d3d4c4a3b3b4a4b2a2a1b1 d3c3c2d2c4d4d1c1a4b4b1a1b3a3a2b2
        
    mix_pairs(a, b, c, d, wordsize)
    shift_rows(b, d, 1, wordsize)    
    mix_pairs(a, b, c, d, wordsize)
    shift_rows(b, d, 2, wordsize)
    mix_pairs(a, b, c, d, wordsize)     
    mix_pairs(a, d, b, c, wordsize)
    
def sbox_layer(a, b, c, d):
    a[0] = S_BOX256[a[0]]; a[1] = S_BOX256[a[1]]; a[2] = S_BOX256[a[2]]; a[3] = S_BOX256[a[3]]
    b[0] = S_BOX256[b[0]]; b[1] = S_BOX256[b[1]]; b[2] = S_BOX256[b[2]]; b[3] = S_BOX256[b[3]]
    c[0] = S_BOX256[c[0]]; c[1] = S_BOX256[c[1]]; c[2] = S_BOX256[c[2]]; c[3] = S_BOX256[c[3]]
    d[0] = S_BOX256[d[0]]; d[1] = S_BOX256[d[1]]; d[2] = S_BOX256[d[2]]; d[3] = S_BOX256[d[3]]               
    
def encrypt(plaintext, key, wordsize=WORDSIZE, rounds=ROUNDS):      
    # 128 bit state    
    assert len(key) == KEY_SIZE
    assert isinstance(plaintext, bytearray)
    xor_subroutine(plaintext, key)
    a, b, c, d = plaintext[:4], plaintext[4:8], plaintext[8:12], plaintext[12:16] 
    
    for round in range(rounds):
        add_constants(a, b, c, d, round)        
        sbox_layer(a, b, c, d)       
        mix_state(a, b, c, d)         
    plaintext[:] = a + b + c + d
    xor_subroutine(plaintext, key)
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
            encrypt(data, key)      
            
    
    Test_Cipher.test_metrics(generate_key(), "\x00" * 16, avalanche_test=False, randomness_test=False, bias_test=False, period_test=False)

def test_active_bits():    
    from crypto.analysis.active_bits import search_minimum_active_bits, count_active_sboxes, display_active_words_progress
    from crypto.utilities import integer_to_bytes, bytes_to_integer
    
    def test_function(state):
        a, b, c, d = state        
        #sbox_layer(a, b, c, d)
        mix_state(a, b, c, d)               
        #sbox_layer(a, b, c, d)
        #mix_state(a, b, c, d)        
        #mix_state(a, b, c, d)
        #mix_state(a, b, c, d)        
        return a, b, c, d
        
    def argument_function(a, b, c, d):
        return integer_to_bytes(a, 4), integer_to_bytes(b, 4), integer_to_bytes(c, 4), integer_to_bytes(d, 4)                
        
    def output_function(state):
        return tuple(bytes_to_integer(section) for section in state)
    
    search_minimum_active_bits(test_function, argument_function, output_function)#, 
                               #display_progress_function=display_active_words_progress,
                               #count_active_word_function=count_active_sboxes)
    
if __name__ == "__main__":     
    #test_encrypt()
    test_active_bits()
    #test_metrics()
    