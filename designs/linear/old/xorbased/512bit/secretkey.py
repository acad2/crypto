from crypto.utilities import words_to_bytes, bytes_to_words, rotate_left, rotate_right, xor_subroutine

WORDSIZE = 8
SMALL_SHIFT = [0, 1, 2, 3 , 4 , 5 , 6 , 7]
LARGE_SHIFT = [0, 8, 16, 24, 32, 40, 48, 56]

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, k):
    """ Conditionally swaps a and b, based on the value of k. """
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(state, key):
    a, b, c, d, e, f, g, h = state[:8]
    k0, k1, k2, k3, k4, k5, k6, k7 = key
    
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)

    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)

    e, f = choice_swap(e, f, k4)
    g, h = choice_swap(g, h, k5)
    
    g, f = choice_swap(g, f, k6)
    e, h = choice_swap(e, h, k7)
    
    a, e = choice_swap(a, e, k0)
    b, f = choice_swap(b, f, k1)
    c, g = choice_swap(c, g, k2)
    d, h = choice_swap(d, h, k3)
    
    state[:8] = (a, b, c, d, e, f, g, h)

def invert_shuffle_columns(state, key):
    a, b, c, d, e, f, g, h = state
    k0, k1, k2, k3, k4, k5, k6, k7 = key
    
    d, h = choice_swap(d, h, k3)
    c, g = choice_swap(c, g, k2)
    b, f = choice_swap(b, f, k1)
    a, e = choice_swap(a, e, k0)
    
    e, h = choice_swap(e, h, k7)
    g, f = choice_swap(g, f, k6)
    
    g, h = choice_swap(g, h, k5)
    e, f = choice_swap(e, f, k4)
    
    a, d = choice_swap(a, d, k3)
    c, b = choice_swap(c, b, k2)
    
    c, d = choice_swap(c, d, k1)
    a, b = choice_swap(a, b, k0)
    
    state[:] = a, b, c, d, e, f, g, h
 
def mix_columns(state):
    a, b, c, d, e, f, g, h = state
    
    a ^= e
    b ^= f
    c ^= g
    d ^= h
    
    e ^= b
    f ^= c
    g ^= d
    h ^= a
    
    state[:] = a, b, c, d, e, f, g, h    
    
def invert_mix_columns(state):    
    a, b, c, d, e, f, g, h = state
    
    h ^= a
    g ^= d
    f ^= c
    e ^= b
    
    d ^= h
    c ^= g
    b ^= f
    a ^= e

    state[:] = a, b, c, d, e, f, g, h

def shift_rows(state, amounts):    
    a, b, c, d, e, f, g, h = state
    b = rotate_left(b, amounts[1], 8 * WORDSIZE)
    c = rotate_left(c, amounts[2], 8 * WORDSIZE)
    d = rotate_left(d, amounts[3], 8 * WORDSIZE)
    e = rotate_left(e, amounts[4], 8 * WORDSIZE)
    f = rotate_left(f, amounts[5], 8 * WORDSIZE)
    g = rotate_left(g, amounts[6], 8 * WORDSIZE)    
    h = rotate_left(h, amounts[7], 8 * WORDSIZE)
    state[:] = a, b, c, d, e, f, g, h
    
def invert_shift_rows(state, amounts):
    a, b, c, d, e, f, g, h = state
    b = rotate_right(b, amounts[1], 8 * WORDSIZE)
    c = rotate_right(c, amounts[2], 8 * WORDSIZE)
    d = rotate_right(d, amounts[3], 8 * WORDSIZE)
    e = rotate_right(e, amounts[4], 8 * WORDSIZE)
    f = rotate_right(f, amounts[5], 8 * WORDSIZE)
    g = rotate_right(g, amounts[6], 8 * WORDSIZE)
    h = rotate_right(h, amounts[7], 8 * WORDSIZE)      
    state[:] = a, b, c, d, e, f, g, h
    
def permutation(data, index=0, direction=1):
    total = 0
    for byte in data:
        total ^= byte
        
    size = len(data)    
    for count in range(size):                
        byte = data[index]
        
        total ^= byte
        byte ^= total ^ data[(index + 1) % size] ^ data[(index - 1) % size]
        total ^= byte

        data[index] = byte 
                
        index += direction                
        
def permutation512(state, key=(0, 1, 2, 3, 4, 5, 6, 7)):
    shuffle_columns(state, key)
    mix_columns(state)
    shift_rows(state, SMALL_SHIFT)        
    
    shuffle_columns(state, key)
    mix_columns(state)
    shift_rows(state, LARGE_SHIFT)        
    
def invert_permutation512(state, key):
    invert_shift_rows(state, LARGE_SHIFT)         
    invert_mix_columns(state)
    invert_shuffle_columns(state, key)
    
    invert_shift_rows(state, SMALL_SHIFT)    
    invert_mix_columns(state)
    invert_shuffle_columns(state, key)

def key_schedule(key, rounds):    
    keys = []
    for round in range(rounds + 1):
        permutation(key)           
        keys.append(key[:])        
    return keys
    
def encrypt(data, key, rounds=2):    
    state = bytes_to_words(data, WORDSIZE) 
    key = bytes_to_words(key, WORDSIZE)        
           
    for round in range(rounds):                
        permutation512(state, key)    

    data[:] = words_to_bytes(state, WORDSIZE)
    
def decrypt(data, key, rounds=2):
    state = bytes_to_words(data, WORDSIZE)
    _key = bytes_to_words(key, WORDSIZE)
    
    keys = key_schedule(_key, rounds)
    
    xor_subroutine(state, keys[0])            
    for round in reversed(range(rounds)):
        invert_permutation512(state, keys[round + 1])    
    xor_subroutine(state, keys[0])        
    
    data[:] = words_to_bytes(state, WORDSIZE)
        
def test_permutation512():
    data = bytes_to_words(bytearray(8 * WORDSIZE), WORDSIZE)
    key  = bytes_to_words(bytearray(8 * WORDSIZE), WORDSIZE)
    _data = data[:]
    
    permutation512(data, key)
    invert_permutation512(data, key)
    
    assert data == _data
    
def test_encrypt_decrypt():
    data = bytearray(8 * WORDSIZE)
    data[0] = 1
    _data = data[:]
    key = bytearray(8 * WORDSIZE)
    
    encrypt(data, key)
    ciphertext = data[:]   
    decrypt(data, key)
    assert data == _data, (data, _data)
        
    data2 = bytearray(8 * WORDSIZE)
    data2[0] = 2
    _data2 = data2[:]
        
    encrypt(data2, key)
    ciphertext2 = data2[:]
    decrypt(data2, key)
    assert data2 == _data2, (data2, _data2)
    
    
    xor_subroutine(_data, _data2)
    xor_subroutine(ciphertext, ciphertext2)
    decrypt(ciphertext, key)
    assert ciphertext == _data, (ciphertext, _data)
    print "Passed secretkey encrypt/decrypt unit test"
    
def visualize_permutation512():
    from crypto.analysis.visualization import test_8x64_function    
    data = bytes_to_words(bytearray(8 * WORDSIZE), WORDSIZE)
    key = bytes_to_words(bytearray(8 * WORDSIZE), WORDSIZE)
    data[0] = 1
    
    def test_function(*data):
        state = list(data)
        permutation512(state, state[:])
        return state
    test_8x64_function(test_function, data)
        
def test_permutation512_active_bits():
    from crypto.analysis.active_bits import test_8x64_function
    
    def test_function(arguments, key=bytes_to_words(bytearray(64), 8), rounds=1):
        state = list(arguments + (0, 0, 0, 0))        
        for round in range(rounds):
            permutation512(state, key)
        
        return state[:]
    test_8x64_function(test_function, range(8))
            
if __name__ == "__main__":
    test_permutation512()    
    test_encrypt_decrypt()
    visualize_permutation512()
    test_permutation512_active_bits()
    