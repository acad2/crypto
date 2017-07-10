def rotate_left(a, amount, bit_width=32, mask=0xFFFFFFFF):
    return ((a << amount) | (a >> (bit_width - amount))) & mask
    
def choice_swap(a, b, c):
    t = b ^ c
    t &= a
    _c = c
    c = t ^ b
    b = t ^ _c    
    return b, c
    
def bit_permutation(a, b, c, d):
    b, a = choice_swap(d, b, a)
    d, c = choice_swap(b, d, c) 
    a, d = choice_swap(c, a, d)
    c, b = choice_swap(a, c, b)      
    a = rotate_left(a, 1)
    b = rotate_left(b, 2 + 8)     
    c = rotate_left(c, 3 + 16)
    d = rotate_left(d, 4 + 24)        
    return a, b, c, d
    
def permutation(a, b, c, d, mask=0xFFFFFFFF):   
    c ^= d
    b ^= c
    a = (a + b) & mask
    a = rotate_left(a, 1)
    
    a ^= c
    d ^= a
    b = (b + d) & mask
    b = rotate_left(b, 2)
    
    
    
    
    
    a = rotate_left(a, 1)
    b = (b + (a ^ c ^ d)) & mask
    b = rotate_left(b, 2)
    c = (c + (a ^ b ^ d)) & mask
    c = rotate_left(c, 3)
    d = (d + (a ^ b ^ c)) & mask
    d = rotate_left(d, 4)
    b = rotate_left(b, 8)
    c = rotate_left(c, 16)
    d = rotate_left(d, 24)
    return a, b, c, d
    #return bit_permutation(a, b, c, d)
        
def visualize_bit_permutation():
    from crypto.analysis.visualization import test_4x32_function
    from os import urandom
    test_4x32_function(bit_permutation, (ord(urandom(1)), 3, 1, 5 | 8))
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
    
if __name__ == "__main__":
    visualize_bit_permutation()
    #visualize_permutation()
    