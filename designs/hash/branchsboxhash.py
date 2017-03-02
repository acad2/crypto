from crypto.utilities import rotate_left, pad_input, slide, bytes_to_words, words_to_bytes

ROUNDS = 32

def branch(word):
    # 0 1 2 3 ... 60 61 62 63
    
    word ^= rotate_left(word, 3, 64) # two bits influence each bit
    word ^= rotate_left(word, 6, 64) # four bits influence each bit
    word ^= rotate_left(word, 13, 64) # eight bits influence each bit
    word ^= rotate_left(word, 26, 64) # sixteen bits influence each bit 
    word ^= rotate_left(word, 41, 64) # thirty-two bits influence each bit
    return word
    
def mix(word0, word1):
    word0 ^= word1  
    word1 ^= rotate_left(word0, 2, 64)  
    return word0, word1
    
def sbox(a, b, c, d):
    t = a
    
    a &= b
    a ^= c
    
    c &= b
    c ^= d
    
    d &= a
    d ^= t
    
    b ^= c & t
    return a, b, c, d  
    
def shift_rows(b, c, d):
    return rotate_left(b, 16, 64), rotate_left(c, 32, 64), rotate_left(d, 48, 64)
    
def linear_layer(a, b, c, d):    
    b, c, d = shift_rows(b, c, d)            
    a = branch(a); b = branch(b); c = branch(c); d = branch(d);       
    a, b = mix(a, b); c, d = mix(c, d);
    a, c = mix(a, c); b, d = mix(b, d); 
    return a, b, c, d        
            
def compression_function(data, rounds=4):
    output = [0, 0, 0, 0]    
    for a, b, c, d in slide(bytes_to_words(data, 8), 4):        
        a ^= output[0]; b ^= output[1]; c ^= output[2]; d ^= output[3];         
        for round in range(rounds):            
            a, b, c, d = sbox(a, b, c, d)                                   
            a, b, c, d = linear_layer(a, b, c, d)           
            
        output[0] ^= a; output[1] ^= b; output[2] ^= c; output[3] ^= d;
    return bytes(words_to_bytes(output, 8))
    
def hash_function(data):
    data = pad_input(bytearray(data), 32)
    return compression_function(data)
    
def test_hash_function():
    print hash_function("\x01")
    print hash_function("\x02")
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function)
    
def test_linear_branch_number():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        return linear_layer(a, b, 0, 0)
    print branch_number(test_function)
        
        
if __name__ == "__main__":
    #test_hash_function()
    test_linear_branch_number()