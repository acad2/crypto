from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left

KEY_SIZE = 10
SEED_SIZE = 20

S_BOX = [11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7]
S_BOX256 = []
for byte in range(256):
    S_BOX256.append((S_BOX[byte >> 4] << 4) | S_BOX[byte & 15])              
        
def add_key(seed, index, index2, key):    
    seed[index] ^= next(key) ^ index  
    seed[index2] ^= next(key) ^ index2
           
def add_constant(seed, index, index2, constants):            
    add_key(seed, index + 0, index2 + 0, constants)
    add_key(seed, index + 5, index2 + 5, constants)
    add_key(seed, index + 10, index2 + 10, constants)
    add_key(seed, index + 15, index2 + 15, constants)    
    
def transposition(seed):        
    #|  0  1  2  3 
    #|  4  5  6  7
    #|  8  9 10 11
    #| 12 13 14 15
    #| 16 17 18 19
    
    #| 11  5  4 15 | 
    #| 12  6  9  0 | shuffle these
    #| 13  3 14  8 | 
    #|  1 10  2  7 | 
    #| 16 17 18 19   ^ then rotate the last row left by 1
    
    #| 11  5  4 15        
    #| 12  6  9  0
    #| 13  3 14  8
    #|  1 10  2  7
    #| 17 18 19 16
    
    temp = seed[0]

    seed[0] = seed[11]
    seed[11] = seed[8]
    seed[8] = seed[13]
    seed[13] = seed[10]
    seed[10] = seed[14]
    seed[14] = seed[2]
    seed[2] = seed[4]
    seed[4] = seed[12]
    seed[12] = seed[1]
    seed[1] = seed[5]
    seed[5] = seed[6]
    seed[6] = seed[9]
    seed[9] = seed[3]
    seed[3] = seed[15]
    seed[15] = seed[7]
    seed[7] = temp       
    
    seed[-4:] = seed[-3:] + [seed[-4]]
    
    
def _permutation(seed, index, index2, wordsize):
    left, right = seed[index], seed[index2] 
    left = S_BOX256[left]
    right = S_BOX256[right]
    
    left = left ^ right
    left = rotate_left(left, 1, wordsize)
    right = right ^ left
    right = rotate_left(right, 2, wordsize)
    left = left ^ right
    left = rotate_left(left, 4, wordsize)
    right = right ^ left
    right = rotate_left(right, 7, wordsize)
    left = left ^ right
    
    seed[index], seed[index2] = left, right
        
def permutation(seed, index, index2, wordsize): 
    # could squeeze output after each quarter section to improve latency
    _permutation(seed, index, index2, wordsize)
    _permutation(seed, (5 + index), (5 + index2), wordsize)
    _permutation(seed, (10 + index), (10 + index2), wordsize)
    _permutation(seed, (15 + index), (15 + index2), wordsize) 
    
def combine_key_stream(state, seed, plaintext_index, index, index2):                
    try:
        state[plaintext_index + 0] ^= (seed[index +  0] ^ seed[index2 + 0])
        state[plaintext_index + 1] ^= (seed[index +  5] ^ seed[index2 + 5])
        state[plaintext_index + 2] ^= (seed[index + 10] ^ seed[index2 + 10])
        state[plaintext_index + 3] ^= (seed[index + 15] ^ seed[index2 + 15])
    except IndexError:
        pass
        
def stream_cipher(plaintext, key, seed, wordsize=8):      
    # make state 2x key
    # 4 instances of 5-8 bit words via SIMD would be scalable?
    # 80-bit prng key, 160 bit state (5 * 8 = 40 * 4 = 160)
    # optional seed key for increased key bits?
    prng_key, seed_key = key
    assert len(seed) == 20    
    assert len(seed_key) == 20
    assert len(prng_key) == 10
    seed = list(seed)
    xor_subroutine(seed, seed_key)        
    
    key = itertools.cycle(prng_key)   
    size = 5
    state = bytearray(plaintext)
    plaintext_size = len(state)
    plaintext_index = 0    
    break_flag = False
    
    # requires one round warmup for full diffusion
    # a + b, a + c, a + d
    # b + c, b + d
    # c + d
    assert size - 1
    for index in range(size - 1):
        for index2 in range(index, size):
            add_key(seed, index, index2, key)  
            constants = itertools.cycle((index + 1, index2 + 2))
            add_constant(seed, index, index2, constants)   
            permutation(seed, index, index2, wordsize)               
            transposition(seed)            
            
    while True:        
        for index in range(size - 1):            
            for index2 in range(index + 1, size):                    
                add_key(seed, index, index2, key)
                constants = itertools.cycle((index, index2))
                add_constant(seed, index, index2, constants)                              
                permutation(seed, index, index2, wordsize)                  
                combine_key_stream(state, seed, plaintext_index, index, index2) 
                
                transposition(seed)
                
                plaintext_index += 4
                        
                if plaintext_index >= plaintext_size:                    
                    break_flag = True
                    break                                
                    
            if break_flag:
                break        
        if break_flag:
            break    
    try:
        plaintext[:] = state
    except TypeError:
        pass    
    return state
    
def generate_keys():
    return bytearray(urandom(KEY_SIZE)), bytearray(urandom(SEED_SIZE))        
        
def generate_seed(seed_key):
    seed = bytearray(urandom(SEED_SIZE))
    xor_subroutine(seed, seed_key)
    return seed   
    
def test_stream_cipher():
    prng_key, seed_key = range(10), range(20)
    seed = seed_key    
    message = bytearray("Awesome!")
    print stream_cipher(message, (prng_key, seed_key), seed)
    print stream_cipher(message, (prng_key, seed_key), seed)
    
def test_metrics():
    from crypto.analysis.metrics import test_stream_cipher       
    def keygen(byte):  
        key = [0] * 10
        key[-1] = ord(byte)
        return key, [0] * 20
    def seedgen(padding, byte):        
        output = bytearray(20)
        try:
            output[-1] = byte
        except (ValueError, TypeError):
            output[-1] = byte[0]
        return output
        
    seed = [0] * 20  
    test_stream_cipher(stream_cipher, generate_keys(), seed, key_generation_function=keygen, seed_generation_function=seedgen)#,
                       #randomness_test=False, avalanche_test=False, bias_test=False)        
        
        
if __name__ == "__main__": 
    test_stream_cipher()
    test_metrics()
    