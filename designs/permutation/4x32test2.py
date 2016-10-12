def rotate_left(a, amount):
    return ((a << amount) | (a >> (32 - amount))) & 0xFFFFFFFF
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def _permutation(a, b, c, d, mask=0xFFFFFFFF):  
    a = (a + b) & mask
    a ^= c
    a = (a + d) & mask
    a = rotate_left(a, 2)
    a ^= b
    a = (a + c) & mask
    a ^= d
    a = rotate_left(a, 8)
    return a
    
def permutation(a, b, c, d):
    for round in range(2):
        a = _permutation(a, b, c, d)
        b = _permutation(b, c, d, a)
        c = _permutation(c, d, a, b)
        d = _permutation(d, a, b, c)        
    
    #a ^= choice(d, c, b)
    #
    #b ^= choice(a, d, c)
    ##b = rotate_left(b, 1)
    #
    #c ^= choice(b, a, d)
    ##c = rotate_left(c, 2)
    #
    #d ^= choice(c, b, a)
    #d = rotate_left(d, 3)
    return a, b, c, d
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
    
def test_permutation_active_bits(): 
    from crypto.analysis.active_bits import search_minimum_active_bits
    pass_function = lambda *args: args
    search_minimum_active_bits(lambda args: permutation(*args), pass_function, lambda *args: args[0])
    
if __name__ == "__main__":
    visualize_permutation()
    test_permutation_active_bits()
    