from os import urandom
import itertools

from crypto.utilities import xor_subroutine, rotate_left

KEY_SIZE = 10
SEED_SIZE = 20

S_BOX = [11, 5, 4, 15, 12, 6, 9, 0, 13, 3, 14, 8, 1, 10, 2, 7]
S_BOX2 = [4, 10, 1, 6, 8, 15, 7, 12, 3, 0, 13, 14, 5, 9, 11, 2]
S_BOX256 = []
for byte in range(256):
    S_BOX256.append((S_BOX[byte >> 4] << 4) | S_BOX2[byte & 15])                    
        
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
    
    seed[-8:-4], seed[-4:] = seed[-3:] + [seed[-4]], seed[-8:-4]
    
def _permutation(seed, key, index, index2, wordsize):
    left, right = seed[index], seed[index2] 
    
    left ^= (index + 1)  # add constant
    right ^= (index2 + 1)
    #
    left ^= (key[index % KEY_SIZE]) # add key
    right ^= (key[index2 % KEY_SIZE])
                        
    # a0 a1 a2 a3 a4 a5 a6 a7
    # b0 b1 b2 b3 b4 b5 b6 b7
    # a0b0 a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7 a ^ b
    
    #   b0   b1   b2   b3   b4   b5   b6   b7
    # a1b1 a2b2 a3b3 a4b4 a5b5 a6b6 a7b7 a0b0 a = rotate_left(a, 1); b ^= a;
    
    # a1b1    a2b2    a3b3    a4b4    a5b5    a6b6    a7b7    a0b0 = b
    # a3b23   a4b34   a5b45   a6b56   a7b67   a0b07   a1b01   a2b12 
    # a13b123 a24b234 a35b345 a46b456 a57b567 a06b067 a17b017 a02b012 b = rotate_left(b, 3); a ^= b
    
    # a13b123 a24b234 a35b345 a46b456 a57b567 a06b067 a17b017 a02b012
    
    
    left ^= right                   # linear layer 
    left = rotate_left(left, 1, 8)
    right ^= left
    right = rotate_left(right, 3, 8)
    left ^= right
    left = rotate_left(left, 
    
    
    right = S_BOX256[right]
    left = S_BOX256[left]  # non-linear layer
        
    seed[index], seed[index2] = left, right
        
def permutation(seed, key, index, index2, wordsize): 
    # could squeeze output after each quarter section to improve latency
    _permutation(seed, key, index, index2, wordsize)
    _permutation(seed, key, (5 + index), (5 + index2), wordsize)
    _permutation(seed, key, (10 + index), (10 + index2), wordsize)
    _permutation(seed, key, (15 + index), (15 + index2), wordsize) 
    
def combine_key_stream(state, seed, plaintext_index, index, index2):       
    print bytearray(seed)
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
    
    key = prng_key
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
            permutation(seed, key, index, index2, wordsize)                                   
            transposition(seed)
    while True:        
        for index in range(size - 1):            
            for index2 in range(index + 1, size):                                    
                permutation(seed, key, index, index2, wordsize)                  
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
    _message = message[:]
    
    stream_cipher(message, (prng_key, seed_key), seed)
    ciphertext = message[:]
    
    stream_cipher(message, (prng_key, seed_key), seed)
    plaintext = message[:]
    
    assert plaintext == _message, (plaintext, _message)
    
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
    