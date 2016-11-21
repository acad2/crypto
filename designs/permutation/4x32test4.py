from crypto.utilities import rotate_left

def mix_columns(a, b, c, d, mask=0xFFFFFFFF):    
    #a = (a + b) & mask
    #a ^= c
    #a = (a + d) & mask
    #
    #b = (b + c) & mask
    #b ^= d
    #b = (b + a) & mask
    #
    #c = (c + d) & mask
    #c ^= a
    #c = (c + b) & mask
    #
    #d = (d + a) & mask
    #d ^= b
    #d = (d + c) & mask
    
    a = (a + b) & mask
    c = (c + d) & mask
    b ^= c
    d ^= a
        
    return a, b, c, d
    
def permutation(a, b, c, d, size=32):       
    for round in range(1):             
        a ^= 0xFFFFFFFF
        d ^= 0xFFFFFFFF
        a, b, c, d = mix_columns(a, b, c, d) # each 4 bit column is now active
        b = rotate_left(b, 1, size)
        c = rotate_left(c, 2, size)
        d = rotate_left(d, 3, size)
                
        a, b, c, d = mix_columns(a, b, c, d) # each 4x4 bit subsection is now active
        b = rotate_left(b, 4, size)
        c = rotate_left(c, 8, size)
        d = rotate_left(d, 12, size)
                
        a, b, c, d = mix_columns(a, b, c, d) # each 16x4 bit subsection is now active
        b = rotate_left(b, 8, size)
        c = rotate_left(c, 12, size)
        d = rotate_left(d, 16, size)
        
    a, b, c, d = mix_columns(a, b, c, d) # each 32x4 bit subsection is now active     
    return a, b, c, d
    
def test_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (1, 0, 0, 0))
    
def test_permutation_active_bits(): 
    from crypto.analysis.active_bits import search_minimum_active_bits, THOROUGH_TEST
    pass_function = lambda *args: args
    search_minimum_active_bits(lambda args: permutation(*args), pass_function, lambda *args: args[0])#, test_inputs=THOROUGH_TEST)
        
if __name__ == "__main__":
    test_permutation()
    test_permutation_active_bits()
    