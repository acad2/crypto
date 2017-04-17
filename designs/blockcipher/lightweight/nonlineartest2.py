from crypto.utilities import rotate_left

SBOX = [int(character, 16) for character in "086d5f7c4e2391ba"]

def mix_columns(a, b, c, d):    
    a ^= b # ab
    c ^= d # cd
    b ^= c # bc    
    d ^= a # dab    
    b ^= d # acd
    
    # ab acd cd dab
    return a, b, c, d
    
def sbox(a, b, c, d, _sbox=SBOX):
    return (_sbox[item] for item in (a, b, c, d))
    
def shift_rows(b, c, d, r1, r2, r3):
    b = rotate_left(b, r1, 4)    
    c = rotate_left(c, r2, 4)    
    d = rotate_left(d, r3, 4)    
    return b, c, d
    
def mix_4x4(a, b, c, d):    
    for round in range(2):        
        a, b, c, d = sbox(a, b, c, d)       
        a, b, c, d = mix_columns(a, b, c, d)        
        
        b, c, d = shift_rows(b, c, d, 1, 2, 3)
    return a, b, c, d
    
def visualize_mix4x4():
    from crypto.analysis.visualization import test_4x4_function
    test_4x4_function(mix_4x4, (0, 0, 0, 1))
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2, bit_generator
    import itertools
    test_inputs = lambda: itertools.chain(bit_generator(1, 0xF), bit_generator(3, 0xF), bit_generator(7, 0xF))
    search_minimum_active_bits2(mix_4x4, test_inputs=lambda: itertools.chain(bit_generator(1, 0xF), bit_generator(3, 0xF)))
    
if __name__ == "__main__":
    #visualize_mix4x4()
    test_active_bits()
    