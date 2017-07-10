def rotate_left4(_input, amount):
    return ((_input << amount) | (_input >> (4 - amount))) & 15    
    
def rotate_left32(_input, amount):
    return ((_input << amount) | (_input >> (32 - amount))) & 0xFFFFFFFF
    
def mix_columns(a, b, c, d):
    a ^= b
    c ^= d
    b ^= d
    d ^= a    
    return a, b, c, d
    
def shift_rows4(b, c, d, r1, r2, r3):
    _b = _c = _d = 0
    for subsection in range(8):
        _b |= rotate_left4(b >> (4 * subsection), r1) << (4 * subsection)
        _c |= rotate_left4(c >> (4 * subsection), r2) << (4 * subsection)
        _d |= rotate_left4(d >> (4 * subsection), r3) << (4 * subsection)
    return _b, _c, _d
    
def shift_rows(b, c, d, r1, r2, r3):
    b = rotate_left32(b, r1)
    c = rotate_left32(c, r2)
    d = rotate_left32(d, r3)
    return b, c, d        
                
constants = [1, 2, 4, 8]
a, b, c, d = 0, 0, 0, 0
for subsection in range(8):                
    a |= constants[0] << (4 * subsection)
    b |= rotate_left4(constants[1] << (4 * subsection), (1 + subsection) % 4)
    c |= rotate_left4(constants[2] << (4 * subsection), (2 + subsection) % 4)
    d |= rotate_left4(constants[3] << (4 * subsection), (3 + subsection) % 4)
CONSTANTS = [a, b, c, d]    
    
def mix_state(a, b, c, d, constants=[1]):
    a ^= constants[0]; b ^= constants[0] << 1; c ^= constants[0] << 2; d ^= constants[0] << 3;
    constants = [item + 1 for item in constants]
    a, b, c, d = mix_columns(a, b, c, d)   # each 1x4 bit column is active
    b, c, d = shift_rows4(b, c, d, 1, 2, 3)
    
    a, b, c, d = mix_columns(a, b, c, d)   # each 4x4 bit slice is active
    b, c, d = shift_rows(b, c, d, 4, 8, 12)
    #
    #a, b, c, d = mix_columns(a, b, c, d)   # each 16x4 bit slice is active
    #b, c, d = shift_rows(b, c, d, 8, 12, 16)
    #
    #a, b, c, d = mix_columns(a, b, c, d)   # each 32x4 bit slice is active
    return a, b, c, d
    
def visualize_mix_state():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(mix_state, (0, 0, 0, 1))
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2
    search_minimum_active_bits2(mix_state)        
        
if __name__ == "__main__":
    #visualize_mix_state()
    test_active_bits()
            
            