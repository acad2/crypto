from crypto.utilities import rotate_left

SBOX = [int(character, 16) for character in "086d5f7c4e2391ba"]

def mix_columns(a, b, c, d):    
    #a ^= b # ab
    #c ^= d # cd
    #b ^= c # bc    
    #d ^= a # dab            
    # ab bc cd dab
    a ^= c
    c ^= b
    b ^= d    
    d ^= a
    return a, b, c, d
    
def sbox(a, b, c, d, _sbox=SBOX):    
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t 
    return a, b, c, d
        
def shift_rows(b, c, d, r1, r2, r3):
    b = rotate_left(b, r1, 4)    
    c = rotate_left(c, r2, 4)    
    d = rotate_left(d, r3, 4)    
    return b, c, d
    
def mix_4x4(a, b, c, d):    
    for round in range(1):                                              
        a, b, c, d = mix_columns(a, b, c, d)          
       # b, c, d = shift_rows(b, c, d, 1, 2, 3)
       # a, b, c, d = sbox(a, b, c, d)                 
        
    return a, b, c, d
    
def visualize_mix4x4():
    from crypto.analysis.visualization import test_4x4_function
    test_4x4_function(mix_4x4, (0, 1, 0, 0))
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2, bit_generator
    import itertools
    test_inputs = lambda: itertools.chain(bit_generator(1, 0xF), bit_generator(3, 0xF), bit_generator(7, 0xF))
    search_minimum_active_bits2(mix_4x4, test_inputs=test_inputs)
    
if __name__ == "__main__":
    #visualize_mix4x4()
    test_active_bits()
    