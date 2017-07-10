from crypto.utilities import rotate_left

def branch(word):    
    """ Makes each bit in the output word depend on 1/2 the bits from the input word. """
    word ^= rotate_left(word, 3, 64) # two bits influence each bit
    word ^= rotate_left(word, 6, 64) # four bits influence each bit
    word ^= rotate_left(word, 17, 64) # eight bits influence each bit
    word ^= rotate_left(word, 15, 64) # sixteen bits influence each bit    
    word ^= rotate_left(word, 24, 64) # thirty-two bits influence each bit 
    return word
    
def mix(word0, word1):
    """ Mixes two words that have had branch or mix applied already; doubles number of bit dependencies again. """    
    word0 ^= word1  
    word1 ^= rotate_left(word0, 28, 64)  
    return word0, word1
        
def shift_rows(b, c, d):
    return rotate_left(b, 16, 64), rotate_left(c, 32, 64), rotate_left(d, 48, 64)
    
def linear_layer(a, b, c, d):    
    """ Linear branching layer. Makes each bit depend on exactly 1/2 of the other bits. """                              
    a = branch(a); b = branch(b); c = branch(c); d = branch(d); # each word has 32 active bits
    a, b = mix(a, b); c, d = mix(c, d);                         # each word has 64 active bits
    a, c = mix(a, c); b, d = mix(b, d);                         # each word has 128 active bits
    b, c, d = shift_rows(b, c, d)                               
    return a, b, c, d        
        
def sbox(a, b, c, d): 
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """
    t = a
    
    a &= b
    a ^= c
    
    c &= b
    c ^= d
    
    d &= a
    d ^= t
    
    b ^= c & t
    return a, b, c, d  
        
def round_function(a, b, c, d):
    return sbox(*linear_layer(a, b, c, d)) 
    
def test_linear_branch_number():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        return linear_layer(a, b, 0, 0)
    print branch_number(test_function)
    
def test_round_function_branch_number():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        return round_function(a, b, 0, 0)
    print branch_number(test_function)
        
        
if __name__ == "__main__":
    #test_linear_branch_number()    
    test_round_function_branch_number()
    