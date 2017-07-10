from crypto.utilities import rotate_left
    
def mix_columns(a, b, c, d):
    a ^= d # ad
    b ^= c # bc
    c ^= a # acd
    d ^= b # bcd
    return a, b, c, d
        
def sbox(a, b, c, d): # 9 instructions 
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """                        
    t = a    
    a = (a & b) ^ c
    c = (b & c) ^ d
    d = (d & a) ^ t
    b ^= c & t    
    return a, b, c, d  
    
def shift_rows(b, c, d, r1, r2, r3): # 3 instructions
    b = rotate_left(b, r1, 64)
    c = rotate_left(c, r2, 64)    
    d = rotate_left(d, r3, 64)
    return b, c, d