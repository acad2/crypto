from crypto.utilities import rotate_left

def mix_columns(a, b, c, d):
    # 0 1 2 3
    # 3 0 1 2  # rotated left by 3
    # 03 01 12 23           
    return a ^ d, a ^ b, b ^ c, c ^ d 
    
def sbox(a, b, c, d): 
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """                        
    t = a    
    a = (a & b) ^ c
    c = (b & c) ^ d
    d = (d & a) ^ t
    b ^= c & t    
    return a, b, c, d  
    
def shift_rows(b, c, d, r1, r2, r3):
    b = rotate_left(b, r1, 64)
    c = rotate_left(c, r2, 64)    
    d = rotate_left(d, r3, 64)
    return b, c, d
    
def _round_function(a, b, c, d, r1, r2, r3):  
    a, b, c, d = sbox(a, b, c, d)
    b, c, d = shift_rows(b, c, d, r1, r2, r3)
    return mix_columns(a, b, c, d)
    
def round_function(a, b, c, d):    
    a, b, c, d = _round_function(a, b, c, d, 1, 2, 3) # each 4x4 subsection is active    
    a, b, c, d = _round_function(a, b, c, d, 4, 8, 12) # each 16x4 subsection is active
    a, b, c, d = _round_function(a, b, c, d, 16, 32, 48) # each 64x4 subsection is active        
    return a, b, c, d
        
def test_round_function_branch_number():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        state = (a, b, 0, 0)
        for round in range(3):
            state = round_function(*state)
        return state
    print branch_number(test_function)
    
if __name__ == "__main__":
    test_round_function_branch_number()
    
            
            
            