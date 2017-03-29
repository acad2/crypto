from crypto.utilities import rotate_left

def shift_rows(b, c, d, r1, r2, r3, mask=0xFFFFFFFF):
    _b = _c = _d = 0
    for count in range(4):
        shift_amount = count * 32            
        _b ^= rotate_left((b >> shift_amount) & mask, r1, 32) << shift_amount
        _c ^= rotate_left((c >> shift_amount) & mask, r2, 32) << shift_amount
        _d ^= rotate_left((d >> shift_amount) & mask, r2, 32) << shift_amount
    return _b, _c, _d          

def mix_columns(a, b, c, d):
    # acd        
    # bcd
    # abc
    # abd
    a ^= b; c ^= d; b ^= c; d ^= a; a ^= b; c ^= d;            
    #a ^= b; c ^= d; b ^= c; d ^= a; a ^= c; 
    
    return a, b, c, d
    
def permutation(a, b, c, d):
    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    
    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 4, 8, 12)
    
    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 8, 16, 24)  
    return a, b, c, d