from crypto.utilities import words_to_bytes, bytes_to_words, rotate_left, rotate_right, xor_subroutine

SMALL_SHIFT = [0, 1, 2, 3 , 4 , 5 , 6 , 7]
LARGE_SHIFT = [0, 4, 8, 12, 16, 20, 24, 28]

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, k):
    """ Conditionally swaps a and b, based on the value of k. """
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, e, f, g, h, k0, k1, k2, k3, k4, k5, k6, k7):
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
    return a, b, c, d, e, f, g, h    

def invert_shuffle_columns(a, b, c, d, e, f, g, h, k0, k1, k2, k3, k4, k5, k6, k7):
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
    return a, b, c, d, e, f, g, h

 
def mix_columns(state):
    a, b, c, d, e, f, g, h = state
    
    a ^= b
    c ^= d
    e ^= f
    g ^= h
    
    b ^= c
    d ^= e
    f ^= g
    h ^= a
    
    state[:] = a, b, c, d, e, f, g, h    
    
def invert_mix_columns(state):    
    a, b, c, d, e, f, g, h = state
    
    h ^= a
    f ^= g
    d ^= e
    b ^= c
    
    g ^= h
    e ^= f
    c ^= d
    a ^= b

    state[:] = a, b, c, d, e, f, g, h

def shift_rows(state, amounts):    
    a, b, c, d, e, f, g, h = state
    b = rotate_left(b, amounts[1], 32)
    c = rotate_left(c, amounts[2], 32)
    d = rotate_left(d, amounts[3], 32)
    e = rotate_left(e, amounts[4], 32)
    f = rotate_left(f, amounts[5], 32)
    g = rotate_left(g, amounts[6], 32)    
    h = rotate_left(h, amounts[7], 32)
    state[:] = a, b, c, d, e, f, g, h
    
def invert_shift_rows(state, amounts):
    a, b, c, d, e, f, g, h = state
    b = rotate_right(b, amounts[1], 32)
    c = rotate_right(c, amounts[2], 32)
    d = rotate_right(d, amounts[3], 32)
    e = rotate_right(e, amounts[4], 32)
    f = rotate_right(f, amounts[5], 32)
    g = rotate_right(g, amounts[6], 32)
    h = rotate_right(h, amounts[7], 32)      
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
        
def permutation256(state):    
    permutation(state)    
    shift_rows(state, SMALL_SHIFT)    
    permutation(state)    
    shift_rows(state, LARGE_SHIFT)    
    
def invert_permutation256(state):
    invert_shift_rows(state, LARGE_SHIFT)     
    permutation(state, len(state) - 1, -1)
    invert_shift_rows(state, SMALL_SHIFT)
    permutation(state, len(state) - 1, -1)        
                           
def keyed_bit_transposition(state, key):      
    shuffle_columns(*state + key)
    shift_rows(state, SMALL_SHIFT)
    shuffle_columns(*state + key)
    shift_rows(state, LARGE_SHIFT)       
    
def invert_keyed_bit_transposition(state, key):
    invert_shift_rows(state, LARGE_SHIFT)
    invert_shuffle_columns(*state + key)
    invert_shift_rows(state, SMALL_SHIFT)
    invert_shuffle_columns(*state + key)        
                
def key_schedule(key, rounds):    
    keys = []
    for round in range(rounds + 1):
        permutation(key)           
        keys.append(key[:])        
    return keys
    
def encrypt(data, key, rounds=2):    
    state = bytes_to_words(data, 4)
    _key = bytes_to_words(key, 4)
    
    keys = key_schedule(_key, rounds)
    
    xor_subroutine(state, keys[0])        
    for round in range(rounds):        
        keyed_bit_transposition(state, keys[round + 1])
        permutation256(state)
    xor_subroutine(state, keys[0])    

    data[:] = words_to_bytes(state, 4)
    
def decrypt(data, key, rounds=2):
    state = bytes_to_words(data, 4)
    _key = bytes_to_words(key, 4)
    
    keys = key_schedule(_key, rounds)
    
    xor_subroutine(state, keys[0])            
    for round in reversed(range(rounds)):
        invert_permutation256(state)
        invert_keyed_bit_transposition(state, keys[round + 1])
    xor_subroutine(state, keys[0])        
    
    data[:] = words_to_bytes(state, 4)
    
def test_keyed_bit_transposition(): 
    data = bytes_to_words(range(32), 4)
    _data = data[:]
    key = range(8)
    
    keyed_bit_transposition(data, key)
    invert_keyed_bit_transposition(data, key)
    
    assert data == _data
    
def test_permutation256():
    state = bytes_to_words(bytearray(32), 4)
    _state = state[:]
    
    permutation256(state)
    invert_permutation256(state)
    
    assert state == _state
    
def test_encrypt_decrypt():
    data = bytearray(32)
    data[0] = 1
    _data = data[:]
    key = bytearray(32)
    
    encrypt(data, key)
    ciphertext = data[:]   
    decrypt(data, key)
    assert data == _data, (data, _data)
        
    data2 = bytearray(32)
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
    
def visualize_permutation256():
    data = bytearray(32)
    key = bytearray(32)
    key[0] = 1
    while not raw_input("Press any key + enter to end, or enter to continue: "):
        encrypt(data, key)
        print
        print '\n'.join(format(word, 'b').zfill(32) for word in bytes_to_words(data, 4))
        
if __name__ == "__main__":
    test_permutation256()
    test_keyed_bit_transposition()
    test_encrypt_decrypt()
    visualize_permutation256()
    