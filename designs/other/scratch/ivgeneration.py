import os
import itertools

from crypto.utilities import bytes_to_words, words_to_bytes
    
def iv_generator(key, seed, wordsize=8, mask=(2 ** 64) - 1):
    state = bytes_to_words(seed, wordsize)    
    bit_width = wordsize * 8
    while True:
        permutation(state, key, mask, bit_width)          
        yield words_to_bytes(state, wordsize)
        
def prime_generator():
    primes = [2]
    yield 2
    for test_number in itertools.count(3, 2):
        for prime in primes:
            if not test_number % prime:
                break
        else:
            yield test_number
            primes.append(test_number)
    
def shuffle(data, key):
    for index in reversed(range(1, len(data))):
        other_index = next(key) & (index - 1)
        data[index], data[other_index] = data[other_index], data[index] 

def generate_key(size, key=None):
    if generate_key.primes is None:
        _primes = prime_generator()      
        generate_key.primes = [next(_primes) for count in range(2048)]    
    primes = generate_key.primes[:] 
    key = itertools.cycle(bytearray(key or os.urandom(size)))
    shuffle(primes, key)
    return primes[:size]
generate_key.primes = None
              
def test_iv_generator():
    outputs = []
    size = 2
    seed = bytearray("\x00" * size)
    _seed = seed[:]
    key = generate_key(size)
    generator = iv_generator(key, seed)      
    next_iv = lambda *args: next(generator)
        
    for progress in find_permutation_cycle_length((2 ** 16), 1024, next_iv, _seed, None, None, None):
        print progress
        
if __name__ == "__main__":
    test_iv_generator()        
    