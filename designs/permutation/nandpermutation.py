from crypto.utilities import rotate_left

WORDSIZE_BITS = 64
MASK = 0xFFFFFFFFFFFFFFFF
def nand(word0, word1, mask=MASK):
    return (~(word0 & word1) & mask)
    
def mix_columns(a, b, c, d):        
    a &= c
    
    a = nand(a, c)
    b = (b & d)
    c ^= b
    d ^= a
 
    return a, b, c, d
    
def shift_rows(a, b, c, d, amount):    
    b = rotate_left(b, amount[1], WORDSIZE_BITS)
    c = rotate_left(c, amount[2], WORDSIZE_BITS)
    d = rotate_left(d, amount[3], WORDSIZE_BITS)
    return a, b, c, d
    
def permutation(a, b, c, d):
    a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shift_rows(a, b, c, d, (0, 1, 2, 3))
    a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shift_rows(a, b, c, d, (0, 4, 8, 12))
    a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shift_rows(a, b, c, d, (0, 8, 16, 24))
    return a, b, d, c
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x64_function, print_state_4x64_256_as_4x64
    test_4x64_function(permutation, (0, 0, 0, 1), print_state_4x64_256_as_4x64)
    
if __name__ == "__main__":
    visualize_permutation()
    