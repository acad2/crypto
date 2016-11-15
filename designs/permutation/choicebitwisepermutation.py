from crypto.designs.ciphercomponents import choice, rotate_left

def choice_shuffle(a, b, k):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, b = choice_shuffle(a, b, k0)      
    c, d = choice_shuffle(c, d, k1)
    a, c = choice_shuffle(a, c, k2)
    b, d = choice_shuffle(b, d, k3)
    return a, b, c, d
    
def bit_permutation(a, b, c, d, k0, k1, k2, k3, size=32): 
    a ^= 0xFFFFFFFF
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)    
    #a = rotate_left(a, 0, size)
    b = rotate_left(b, 1, size)
    c = rotate_left(c, 2, size)
    d = rotate_left(d, 3, size)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
    
    b = rotate_left(b, 4, size)
    c = rotate_left(c, 8, size)
    d = rotate_left(d, 12, size)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
    
    #a = rotate_left(a, 4, size)
    b = rotate_left(b, 8, size)
    c = rotate_left(c, 12, size)
    d = rotate_left(d, 16, size)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
    #a, c = choice_shuffle(a, c, k2)
    #b, d = choice_shuffle(b, d, k3)
    
    #a = rotate_left(a, 8 , size)
    #b = rotate_left(b, 16, size)
    #c = rotate_left(c, 24, size)
    #d = rotate_left(d, 4, size)    
    return b, c, d, a, k0, k1, k2, k3
    
def test_bit_permutation():
    from os import urandom
    from crypto.analysis.visualization import test_4x32_function
    #a, b, c, d, k0, k1, k2, k3 = bytearray(urandom(8))
    #inputs = a, b, c, d, k0, k1, k2, k3 
    inputs = a, b, c, d, k0, k1, k2, k3 = (1, 0, 0, 0, 0, 13370000, 0, 0)    
    test_4x32_function(lambda *inputs: bit_permutation(*inputs, size=32), inputs)
    
if __name__ == "__main__":
    test_bit_permutation()
    