from crypto.designs.ciphercomponents import choice, rotate_left

def choice_swap(a, b, k):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)
    #a, c = choice_swap(a, c, k2)
    #b, d = choice_swap(b, d, k3)
    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def bit_permutation(a, b, c, d, k0, k1, k2, k3, size=32): 
    # this uses all reversible gates - invert, choice swap (fredkin), and rotate
    # low weight keys are weak       
    # data does not cause avalanche effect
    for round in range(4):              
        a ^= 0xFFFFFFFF
        d ^= 0xFFFFFFFF
            
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 1, size)
        c = rotate_left(c, 2, size)
        d = rotate_left(d, 3, size)               
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 4, size)
        c = rotate_left(c, 8, size)
        d = rotate_left(d, 12, size)                              
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                    
        b = rotate_left(b, 8, size)
        c = rotate_left(c, 12, size)
        d = rotate_left(d, 16, size)        
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        a, b, c, d = b, c, d, a 
        a, b, c, d, k0, k1, k2, k3 = k0, k1, k2, k3, a, b, c, d
   # print
   # print '\n'.join(format(word, 'b').zfill(32) for word in (a, b, c, d))
    return a, b, c, d, k0, k1, k2, k3
    
def test_bit_permutation(key=(1, 1, 1, 1)):
    from os import urandom
    from crypto.analysis.visualization import test_4x32_function      
    #a, b, c, d, k0, k1, k2, k3 = bytearray(urandom(8))
    #inputs = a, b, c, d, k0, k1, k2, k3 
    inputs = a, b, c, d, k0, k1, k2, k3 = (1, 0, 0, 0) + key
    test_4x32_function(lambda *inputs: bit_permutation(*inputs, size=32), inputs)
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits    
    from os import urandom
    from crypto.utilities import bytes_to_words
    key = tuple(bytes_to_words(bytearray(urandom(16)), 4))        
    search_minimum_active_bits(lambda args: bit_permutation(*args + key), lambda *args: args, lambda args: args)
    
if __name__ == "__main__":
    from os import urandom
    from crypto.utilities import bytes_to_words
    key = (1, 0, 0, 0)#tuple(bytes_to_words(bytearray(urandom(16)), 4))
    test_bit_permutation(key)        
    #key = (2, 0, 0, 0)
    #test_bit_permutation(key)
    test_active_bits()
    