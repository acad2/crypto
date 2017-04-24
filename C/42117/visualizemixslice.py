from crypto.utilities import rotate_left

def mix_slice(a, b, c, d):
    a, b, c, d = mix_columns(a, b, c, d);
    b, c, d = shift_rows(b, c, d, 1, 2, 3);
    a, b, c, d = sub_bytes(a, b, c, d);
    
    a, b, c, d = mix_columns(a, b, c, d);
    b, c, d = shift_rows(b, c, d, 4, 8, 12);
    a, b, c, d = sub_bytes(a, b, c, d);
    
    a, b, c, d = mix_columns(a, b, c, d);
    b, c, d = shift_rows(b, c, d, 8, 12, 16);
    a, b, c, d = sub_bytes(a, b, c, d);
    return a, b, c, d
    
def mix_columns(a, b, c, d):
    a ^= b
    c ^= d
    b ^= c
    d ^= a
    return a, b, c, d
    
def shift_rows(b, c, d, r1, r2, r3):
    b = rotate_left(b, r1, 32)
    c = rotate_left(c, r2, 32)
    d = rotate_left(d, r3, 32)
    return b, c, d
    
def sub_bytes(a, b, c, d):
    t = a
    a = (a & b) ^ c
    c = (c | b) ^ d
    d = (d & a) ^ t
    b ^= c & t
    return a, b, c, d       
        
def visualize_mix_slice():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(mix_slice, (0, 0, 0, 1))
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2
    search_minimum_active_bits2(mix_slice)
    
if __name__ == "__main__":
    visualize_mix_slice()
    test_active_bits()
    