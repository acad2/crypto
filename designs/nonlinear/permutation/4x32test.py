def rotate_left(a, amount):
    return ((a << amount) | (a >> (32 - amount))) & 0xFFFFFFFF
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def _permutation(a, b, c, d, rotation_amount, mask=0xFFFFFFFF):    
    a ^= (b + c + d) & mask
    a = rotate_left(a, 7 + rotation_amount)
    
    a = (a + (b ^ c ^ d)) & mask
    a = rotate_left(a, 9 + rotation_amount)        
    return a
    
def permutation(a, b, c, d):
    a = _permutation(a, b, c, d, 1)
    b = _permutation(b, c, d, a, 3)
    c = _permutation(c, d, a, b, 5)
    d = _permutation(d, a, b, c, 7)
        
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
    