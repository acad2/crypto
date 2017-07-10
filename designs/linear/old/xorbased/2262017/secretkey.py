# k1 ^ r, keyed_bit_shuffle(m ^ r, k2)
# broken

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
    
def encrypt(data, key):    
    random_mask = bytearray(32)        
    xor_subroutine(data, random_mask)      
    xor_subroutine(random_mask, key[:32])        
    state = bytes_to_words(data, 4)    
    keyed_bit_transposition(state, bytes_to_words(key[32:64], 4))        
    data[:] = words_to_bytes(state, 4) + random_mask        
    
def decrypt(data, key, parity=1):    
    state = bytes_to_words(data[:32], 4)        
    invert_keyed_bit_transposition(state, bytes_to_words(key[32:64], 4))    
    data[:32] = words_to_bytes(state, 4)
    
    random_mask = data[32:64]     
    if parity:
        xor_subroutine(random_mask, key[:32])        
    xor_subroutine(data, random_mask)        
    del data[32:64]
    return data
    
def test_keyed_bit_transposition(): 
    data = bytes_to_words(range(32), 4)
    _data = data[:]
    key = bytes_to_words(range(64, 64 + 32), 4)
    
    keyed_bit_transposition(data, key)
    invert_keyed_bit_transposition(data, key)
    
    assert data == _data
    print "Passed keyed_bit_transposition Unit Test"
    
def test_encrypt_decrypt():
    from os import urandom
    data = bytearray(32)
    data[0] = 1
    _data = data[:]
    key = bytearray(urandom(64))#range(64)#[0] * 64
    
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
    
    
    parity = 1 # defaults to 1
    xor_subroutine(_data, _data2)
    xor_subroutine(ciphertext, ciphertext2)
    parity ^= 1 # flip to 0        
    decrypt(ciphertext, key, parity)    
    assert ciphertext == _data, ([byte for byte in ciphertext], [byte for byte in _data])    
    print "Passed secretkey encrypt/decrypt Unit Test"
    
if __name__ == "__main__":    
    test_keyed_bit_transposition()
    test_encrypt_decrypt()    
    