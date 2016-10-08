from crypto.designs.ciphercomponents import choice, rotate_left

def choice_shuffle(a, b, k):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def bit_permutation(a, b, c, d, k0, k1, k2, k3):
    a, b = choice_shuffle(a, b, k0)      
    c, d = choice_shuffle(c, d, k1)
    a = rotate_left(a, 1, 32)
    b = rotate_left(b, 2, 32)
    c = rotate_left(c, 3, 32)
    d = rotate_left(d, 5, 32)
    
    a, c = choice_shuffle(a, c, k2)
    b, d = choice_shuffle(b, d, k3)
    
    a = rotate_left(a, 8 , 32)
    b = rotate_left(b, 16, 32)
    c = rotate_left(c, 24, 32)
    d = rotate_left(d, 4, 32)    
    return b, c, d, a, k0, k1, k2, k3
    
def test_bit_permutation():
    from os import urandom
    from crypto.analysis.visualization import test_4x32_function
    inputs = a, b, c, d, k0, k1, k2, k3 = bytearray(urandom(8))
    #inputs = a, b, c, d, k0, k1, k2, k3 = (1, 1, 1, 1, 0, 13370000, 0, 0)    
    test_4x32_function(bit_permutation, inputs)
    
if __name__ == "__main__":
    test_bit_permutation()
    