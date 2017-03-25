from crypto.utilities import rotate_left

WORDSIZE_BITS = 8

def sub_bytes(a, b, c, d):
    t = a; a = (a & b) ^ c;  c = (b | c) ^ d; d = (d & a) ^ t; b ^= c & t;
    return a, b, c, d
    
def shift_rows(b, c, d, r1, r2, r3, bits=WORDSIZE_BITS):
    b = rotate_left(b, r1, bits)
    c = rotate_left(c, r2, bits)
    d = rotate_left(d, r3, bits)
    return b, c, d
    
def mix(a, b, c, d, constant=[1], wordsize=WORDSIZE_BITS):
    t = constant[0]
    t ^= rotate_left(t, 1, wordsize)
    constant[0] += 1        
    a ^= t
    #backup = (a, b, c, d)    
    #a >>= 4
    #b >>= 4
    #c >>= 4
    #d >>= 4
    a, b, c, d = sub_bytes(a, b, c, d)
    a ^= b; c ^= d; b ^= c; d ^= a;
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    a ^= b; c ^= d; b ^= c; d ^= a;
    b, c, d = shift_rows(b, c, d, 2, 4, 6)
    
    #a ^= (b << 1) & 255
    #b ^= (c << 2) & 255
    #c ^= (d << 3) & 255
    #d ^= (a << 4) & 255
    #b, c, d = shift_rows(b, c, d, 1, 2, 3)
    #a ^= b; c ^= d; b ^= c; d ^= a;
    #a, b, c, d = sub_bytes(a, b, c, d)
    #b, c, d = shift_rows(b, c, d, 2, 4, 6)
    #a ^= b; c ^= d; b ^= c; d ^= a;
    #output = [(a << 4) & 0xff, (b << 4) & 0xff, (c << 4) & 0xff, (d << 4) & 0xff]
    #a, b, c, d = backup
    #a &= 15
    #b &= 15
    #c &= 15
    #d &= 15
    #a, b, c, d = sub_bytes(a, b, c, d)
    #b, c, d = shift_rows(b, c, d, 1, 2, 3)
    #a ^= b; c ^= d; b ^= c; d ^= a;
    #a, b, c, d = sub_bytes(a, b, c, d)
    #b, c, d = shift_rows(b, c, d, 1, 2, 3)
    #a ^= b; c ^= d; b ^= c; d ^= a;    
    output = [a, b, c, d]
    #output[0] ^= a; output[1] ^= b; output[2] ^= c; output[3] ^= d;            
    return output
        
def visualize_mix():
    from crypto.analysis.visualization import test_8x8_function
    test_8x8_function(mix, (0, 0, 0, 2))
    
if __name__ == "__main__":
    visualize_mix()
    