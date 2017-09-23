def rotate_left32(word, amount):
    return ((word << amount) | (word >> (32 - amount))) & 0xFFFFFFFF
    
def sbox(a, b, c, d):    
    t = a;
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t
    return a, b, c, d
    
def mix_columns(a, b, c, d):
    a ^= b     # ab
    c ^= d     # cd
    b ^= c     # bcd
    d ^= a ^ b # dabbcd == ac       
    return a, b, c, d
    
def shift_rows(b, c, d, r1, r2, r3):
    return rotate_left32(b, r1), rotate_left32(c, r2), rotate_left32(d, r3)
    
def permutation(a, b, c, d, rounds=1):
    # ideal order of operations:
    # add round_index to state as round constant
    # apply linear layer (spreads round constant around state)
    # apply s-box 
    for round_number in range(1, rounds + 1):
      #  a ^= round_number
        
        a, b, c, d = mix_columns(a, b, c, d)
        b, c, d = shift_rows(b, c, d, 1, 2, 4)
        
        a, b, c, d = mix_columns(a, b, c, d)
        b, c, d = shift_rows(b, c, d, 4, 8, 16)
        
        a, b, c, d = mix_columns(a, b, c, d)
        a, c, d = shift_rows(b, c, d, 8, 16, 24)
                
        a, b, c, d = mix_columns(a, b, c, d)
        a, b, c, d = sbox(a, b, c, d)        
    return a, b, c, d
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    data = [0, 0, 0, 1]
    test_4x32_function(permutation, data)
        
def test_permutation_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2, THOROUGH_TEST
    search_minimum_active_bits2(permutation, test_inputs=THOROUGH_TEST)
            
if __name__ == "__main__":
    #visualize_permutation()
    test_permutation_active_bits()
    