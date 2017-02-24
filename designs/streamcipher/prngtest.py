from os import urandom
import itertools

from crypto.utilities import bytes_to_words, xor_subroutine, rotate_left, words_to_bytes

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, c):
    _b = b
    b = choice(a, b, c)
    c = choice(a, c, _b)
    return b, c
    
def generate_keys():
    return bytes_to_words(bytearray(urandom(32)), 4), bytes_to_words(bytearray(urandom(32)), 4)        
        
def generate_seed(seed_key):
    seed = bytes_to_words(bytearray(urandom(32)), 4)
    xor_subroutine(seed, seed_key)
    return seed    
        
def permutation(seed, index, index2, key, modulus, wordsize):
    left, right = seed[index], seed[index2]
    left = (left + next(key) + index) % modulus
    right = (right + next(key) + index2) % modulus    
        
    left = (left + right) % modulus
    left = rotate_left(left, 1, wordsize)
    right = (right + left) % modulus
    right = rotate_left(right, 2, wordsize)
    left = (left + right) % modulus
    left = rotate_left(left, 4, wordsize)
    right = (right + left) % modulus
    right = rotate_left(right, 8, wordsize)
    left = (left + right) % modulus
    left = rotate_left(left, 16, wordsize)
    right = (right + left) % modulus
    
    seed[index], seed[index2] = left, right  
        
def stream_cipher(plaintext, key, seed, modulus=2 ** 32, wordsize=32):      
    # make state 2x key. 256 bit key, 512 bit state. 8 64-bit words, or 16-32 bit words
    # 4 instances of 4-32 bit words via SIMD would keep the latency low
    # 4 instances of 4-8 bit words via SIMD would be scalable?
    prng_key, seed_key = key
    seed = seed[:]    
    xor_subroutine(seed, seed_key)        
    
    key = itertools.cycle(prng_key)   
    size = len(seed)
    state = bytes_to_words(bytearray(plaintext), 4)
    plaintext_size = len(state)
    plaintext_index = 0    
    break_flag = False
    
    # requires one round warmup for full diffusion
    # a + b, a + c, a + d
    # b + c, b + d
    # c + d
    assert size - 1
    for index in range(size - 1):
        for index2 in range(index + 1, size):
            permutation(seed, index, index2, key, modulus, wordsize)                     
    
    while True:        
        for index in range(size - 1):            
            for index2 in range(index + 1, size):                               
                permutation(seed, index, index2, key, modulus, wordsize)
                state[plaintext_index] ^= (seed[index] + seed[index2]) % modulus
                plaintext_index += 1
                        
                if plaintext_index == plaintext_size:                    
                    break_flag = True
                    break                                
                    
            if break_flag:
                break        
        if break_flag:
            break
    _plaintext = words_to_bytes(state, 4)
    try:
        plaintext[:] = _plaintext
    except TypeError:
        pass
    return _plaintext
    
def test_stream_cipher():
    #prng_key, seed_key = generate_keys()
    #seed = generate_seed(seed_key)
    prng_key, seed_key = range(4), range(4, 8)
    seed = seed_key    
    message = bytearray("Awesome!")
    print stream_cipher(message, (prng_key, seed_key), seed)
    print stream_cipher(message, (prng_key, seed_key), seed)
    
def test_metrics():
    from crypto.analysis.metrics import test_stream_cipher       
    def keygen(byte):               
        return (0, 0, 0, ord(byte)), (0, 0, 0, 0)
    def seedgen(padding, byte):        
        output = bytearray(32)
        try:
            output[-1] = byte
        except (ValueError, TypeError):
            output[-1] = byte[0]
        return bytes_to_words(output, 4)
        
    seed = [0 for count in range(4)]  
    test_stream_cipher(stream_cipher, generate_keys(), seed, key_generation_function=keygen, seed_generation_function=seedgen,
                       randomness_test=False, avalanche_test=False, bias_test=False)        
        
        
if __name__ == "__main__": 
    test_stream_cipher()
    test_metrics()
    