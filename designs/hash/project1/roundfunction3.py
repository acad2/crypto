from components import sbox, shift_rows, mix_columns
    
def shift_and_mix(a, b, c, d, r1, r2, r3):    # 7 instructions =
    b, c, d = shift_rows(b, c, d, r1, r2, r3) # 3 instructions + 
    return mix_columns(a, b, c, d)            # 4 instructions 
    
def round_function(a, b, c, d): # 30 instructions (not counting loop)
    for round in range(3):
        a, b, c, d = shift_and_mix(a, b, c, d, 1, 2, 3) # each 4x4 subsection is active    
        a, b, c, d = shift_and_mix(a, b, c, d, 4, 8, 12) # each 16x4 subsection is active
        a, b, c, d = shift_and_mix(a, b, c, d, 16, 32, 48) # each 64x4 subsection is active     
    return sbox(a, b, c, d) # 9 instructions
        
def test_round_function_branch_number():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        state = (a, b, 0, 0)
        state = round_function(*state)            
        #print_state(state)
        #raw_input()
        return state        
    print branch_number(test_function) # 96; instruction count: 39
    
def print_state(words, wordsize=64):            
    print "\n".join(format(word, 'b').zfill(wordsize) for word in words)
    
if __name__ == "__main__":
    test_round_function_branch_number()
    
            
            
            