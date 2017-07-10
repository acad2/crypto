from crypto.utilities import addition_subroutine, xor_subroutine, rotate_left

def mix_columns(a, b, c, d):
    addition_subroutine(a, b, 256)
    addition_subroutine(c, d, 256)
    xor_subroutine(b, c)
    xor_subroutine(d, a)
    
def shift_rows(b, c, d, b_amount, c_amount, d_amount):
    for index in range(len(b)):        
        b[index] = rotate_left(b[index], b_amount, 8)
        c[index] = rotate_left(c[index], c_amount, 8)
        d[index] = rotate_left(d[index], d_amount, 8)  
    
def permutation(a, b, c, d):
    mix_columns(a, b, c, d)
    shift_rows(b, c, d, 1, 2, 3)
    #mix_columns(a, b, c, d)
    #shift_rows(b, c, d, 4, 8, 12)
    #mix_columns(a, b, c, d)
    #shift_rows(b, c, d, 8, 16, 24)
    return a, b, c, d
    
def test_permutation():    
    from crypto.analysis.visualization import test_64x8_function
    
    def print_function(args):         
        for item in args:  
            print ''.join(format(byte, 'b').zfill(8) for byte in item)      
    
    test_64x8_function(permutation, [[1 for count in range(4)] for item in ('a', 'b', 'c', 'd')],
                       print_function)
    
if __name__ == "__main__":
    test_permutation()
    