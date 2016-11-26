from os import urandom
from crypto.utilities import words_to_bytes, bytes_to_words, rotate_left, rotate_right, xor_subroutine

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, k):
    """ Conditionally swaps a and b, based on the value of k. """
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    """ Transposes each 1 bit wide/4 bit tall column such that each bit has 1/4 probability of being in any word """
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)

    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def bit_permutation(inputs, key, wordsize=32): 
    """ Transpose the bits of the supplied inputs according to key.
        Selects one of 128! permutations of bits. (not evenly distributed because they key is not large enough) """
    a, b, c, d = inputs    
    k0, k1, k2, k3 = key
    for round in range(1):              
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4 bit tall column is now active
        b = rotate_left(b, 1, wordsize)
        c = rotate_left(c, 2, wordsize)
        d = rotate_left(d, 3, wordsize)               
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4x4 bit subsection is now active
        b = rotate_left(b, 4, wordsize)
        c = rotate_left(c, 8, wordsize)
        d = rotate_left(d, 12, wordsize)                              
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 16x4 bit subsection is now active                  
        b = rotate_left(b, 8, wordsize)
        c = rotate_left(c, 12, wordsize)
        d = rotate_left(d, 16, wordsize)        
                
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 32x4 bit subsection is now active  
    return a, b, c, d
    
def invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    """ Inverts the transposition performed by shuffle_columns. """
    a, d = choice_swap(a, d, k3)
    c, b = choice_swap(c, b, k2)
    c, d = choice_swap(c, d, k1)
    a, b = choice_swap(a, b, k0)
    return a, b, c, d       
        
def invert_bit_permutation(inputs, key, wordsize=32):
    """ Inverts the transposition performed by bit_permutation. """
    a, b, c, d = inputs
    k0, k1, k2, k3 = key
    for round in range(1): 
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 16, wordsize)
        c = rotate_right(c, 12, wordsize)
        b = rotate_right(b, 8, wordsize)        
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 12, wordsize)
        c = rotate_right(c, 8, wordsize)
        b = rotate_right(b, 4, wordsize)
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 3, wordsize)
        c = rotate_right(c, 2, wordsize)
        b = rotate_right(b, 1, wordsize)
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)

    return a, b, c, d
    
def key_schedule(state):
    """ Generates sufficiently different keys """
    total = 0
    for byte in state:
        total ^= byte
            
    for round in range(2):            
        state_size = len(state)
        for index, byte in enumerate(state):
            total ^= byte
            byte ^= rotate_left(total, 1) ^ rotate_left(state[(index - 1) % state_size], 2) ^ rotate_left(state[(index + 1) % state_size], 3) ^ index
            state[index] = byte
            total ^= byte

def invert_key_schedule(state):    
    total = 0
    for byte in state:
        total ^= byte
            
    for round in range(2):           
        state_size = len(state)
        for index, byte in reversed(list(enumerate(state))):
            total ^= byte
            byte ^= rotate_left(total, 1) ^ rotate_left(state[(index - 1) % state_size], 2) ^ rotate_left(state[(index + 1) % state_size], 3) ^ index
            state[index] = byte
            total ^= byte
            
def mix_columns(a, b, c, d):    
    """ Linear bit mixing function """
    a ^= b ^ c    
    c ^= b ^ d    
    b ^= c ^ d
    d ^= a ^ c
    return a, b, c, d
    
def invert_mix_columns(a, b, c, d):    
    d ^= a ^ c    
    b ^= c ^ d    
    c ^= b ^ d    
    a ^= b ^ c    
    return a, b, c, d
    
def keyed_homomorphic_permutation(state, key, rounds=4): 
    """ Ultimately, xors together random groups of state bits,
        such that each bit is made up of bit_i XOR bit_j XOR bit_k ... for
        a large enough number of random terms. """
    a, b, c, d = bytes_to_words(state, 4)
    key = key[:]
    for i in range(rounds):        
        key_schedule(key)
        # randomize the position of bits                    
        a, b, c, d = bit_permutation((a, b, c, d), bytes_to_words(key, 4))    
        
        # stack lots of bits on top of each other
        a, b, c, d = mix_columns(a, b, c, d)
        b = rotate_left(b, 1, 32)
        c = rotate_left(c, 2, 32)
        d = rotate_left(d, 3, 32)
        
        a, b, c, d = mix_columns(a, b, c, d)
        b = rotate_left(b, 4, 32)
        c = rotate_left(c, 8, 32)
        d = rotate_left(d, 12, 32)
        
        a, b, c, d = mix_columns(a, b, c, d)
        b = rotate_left(b, 8, 32)
        c = rotate_left(c, 12, 32)
        d = rotate_left(d, 16, 32)
        
        a, b, c, d = mix_columns(a, b, c, d)      
    key_schedule(key)
    a, b, c, d = bit_permutation((a, b, c, d), bytes_to_words(key, 4))    
    state[:] = words_to_bytes((a, b, c, d), 4)
    
def invert_keyed_homomorphic_permutation(state, key, rounds=4):
    assert isinstance(state, bytearray), type(state)
    a, b, c, d = bytes_to_words(state, 4)
    
    key = key[:]
    for round in range(rounds + 1):
        key_schedule(key)
        
    a, b, c, d = invert_bit_permutation((a, b, c, d), bytes_to_words(key, 4))    
    invert_key_schedule(key)  
    
    for round in reversed(range(rounds)):            
        a, b, c, d = invert_mix_columns(a, b, c, d)
        b = rotate_right(b, 8, 32)
        c = rotate_right(c, 12, 32)
        d = rotate_right(d, 16, 32)
        
        a, b, c, d = invert_mix_columns(a, b, c, d)
        b = rotate_right(b, 4, 32)
        c = rotate_right(c, 8, 32)
        d = rotate_right(d, 12, 32)
        
        a, b, c, d = invert_mix_columns(a, b, c, d)
        b = rotate_right(b, 1, 32)
        c = rotate_right(c, 2, 32)
        d = rotate_right(d, 3, 32)
        
        a, b, c, d = invert_mix_columns(a, b, c, d)
                
        a, b, c, d = invert_bit_permutation((a, b, c, d), bytes_to_words(key, 4))
        invert_key_schedule(key)        
    state[:] = words_to_bytes((a, b, c, d), 4)
        
def test_keyed_homomorphic_permutation():
    state = bytearray(16)
    state[0] = 1
    _state = state[:]
    
    key = bytearray(16)
    key[0] = 1
    
    keyed_homomorphic_permutation(state, key, 3)        
    invert_keyed_homomorphic_permutation(state, key, 3)
    assert state == _state, (state, _state)
            
def encrypt(data, key):
    """ Encrypt 64 bits of data using key. Produces 128-bit ciphertext.
        Ciphertexts are partially homomorphic. """
    padding = bytearray(urandom(8))
    xor_subroutine(data, padding)
    data.extend(padding)           
    xor_subroutine(data, key[16:])
    keyed_homomorphic_permutation(data, key[:16])   
    xor_subroutine(data, key[16:])    
    return data    
    
def decrypt(data, key):    
    """ Decrypt 64 bits of data from 128-bit ciphertext using key. """
    xor_subroutine(data, key[16:])
    invert_keyed_homomorphic_permutation(data, key[:16])
    xor_subroutine(data, key[16:])
    padding = data[8:]
    xor_subroutine(data, padding)
    del data[8:]
    return data[:8]
    
def test_encrypt_decrypt():
    data = bytearray(8)
    data[0] = 1
    _data = data[:]
    key = bytearray(32)
    encrypt(data, key)
    ciphertext = data[:]
    decrypt(data, key)
    assert data == _data, (data, _data)
        
    data2 = bytearray(8)
    data2[0] = 2
    _data2 = data2[:]
        
    encrypt(data2, key)
    ciphertext2 = data2[:]
    decrypt(data2, key)
    assert data2 == _data2, (data2, _data2)
    
    answer = _data[:]
    xor_subroutine(answer, _data2)
    xor_subroutine(ciphertext, ciphertext2)
    decrypt(ciphertext, key)
    assert ciphertext == answer, (ciphertext, answer)
    
if __name__ == "__main__":
    test_keyed_homomorphic_permutation
    test_encrypt_decrypt()
    