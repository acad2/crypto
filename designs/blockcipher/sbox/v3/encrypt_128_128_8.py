# unfinished

from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left

KEY_SIZE = 16
WORDSIZE = 8
ROUNDS = 1

def add_constants(a, b, c, d, round):    
    for index in range(4):
        b[index] ^= S_BOX256[4 + index + round]
        c[index] ^= S_BOX256[8 + index + round]
        a[index] ^= S_BOX256[0 + index + round]
        d[index] ^= S_BOX256[12 + index + round]                
        
def branch_function32(word):
    word ^= rotate_left(word, 3, 32) # two a bits influence each a bit
    word ^= rotate_left(word, 6, 32) # four a bits influence each a bit
    word ^= rotate_left(word, 12, 32) # eight a bits influence each a bit
    word ^= rotate_left(word, 24, 32) # sixteen a bits influence each a bit - 1/2 of 32    
    return word
    
def mix_pair(a, b):    
    a = branch_function32(a)
    b = branch_function32(b)
    a ^= b                  # thirty-two bits influence each a bit - 1/2 of 64
    b ^= rotate_left(a, 2, 32)  
    return a, b
    
def diffusion_layer(a, b, c, d):    
    a, b = mix_pair(a, b)
    c, d = mix_pair(c, d)
    return a, b, c, d
    
def confusion_layer(a, b, c, d):
    # worst case differential probability: 1/4
    # optimal implementation among optimal 4x4 sboxes
    # http://skew2011.mat.dtu.dk/proceedings/Finding%20Optimal%20Bitsliced%20Implementations%20of%204%20to%204-bit%20S-boxes.pdf
    t = a
    
    a &= b
    a ^= c
    
    c &= b
    c ^= d
    
    d &= a
    d ^= t
    
    b ^= c & t
    return a, b, c, d    
                    
    
def encrypt(plaintext, key, seed, rounds=ROUNDS):    
    blocks = divmod(len(plaintext), 4)
    a, b, c, d = bytes_to_words(seed, 4)
    for block in range(blocks):
        a, b, c, d = diffusion_layer(a, b, c, d)
        a, b, c, d = confusion_layer(a, b, c, d)
    
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
        print
        for byte in a + b + c  + d:
            print format(byte, 'b').zfill(8)        
        mix_state(a, b, c, d)         
        print "Output: "
        for byte in a + b + c  + d:
            print format(byte, 'b').zfill(8)
            
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
    