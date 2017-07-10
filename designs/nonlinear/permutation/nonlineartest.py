from crypto.utilities import rotate_left

def permutation(a, b, c, d, modulus=2 ** 32, mask=(2 ** 32) - 1):
    #a = (a + (b ^ (c & d))) % modulus
    b ^= mask
    c ^= mask
    
    a = (a + b) % modulus
    a ^= b
    
    c = (c + d) % modulus
    c ^= d
    
    b = rotate_left(b, 1, 32)
    c = rotate_left(c, 2, 32)
    d = rotate_left(d, 3, 32)
    
    b = (b + c) % modulus
    b ^= c
    
    d = (d + a) % modulus
    d ^= a
    
    b = rotate_left(b, 4, 32)
    c = rotate_left(c, 8, 32)
    d = rotate_left(d, 12, 32)
    return a, b, c, d
    
def test_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
    
if __name__ == "__main__":
    test_permutation()
    