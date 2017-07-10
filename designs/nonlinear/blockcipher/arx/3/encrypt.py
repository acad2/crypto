ROUNDS = 5              # 2 ** (-differential_probability * active_sboxes) == 2 ** 
KEY_ADDITION_LAYERS = 4 # minimum of 4: https://eprint.iacr.org/2013/391.pdf "...block ciphers based on the EM scheme with one key should have at least 4 rounds ..."

def rotate_left(word, amount):
    return ((word << amount) | (word >> (64 - amount))) & 0xFFFFFFFFFFFFFFFF
        
def generate_round_constant(word): # 10 instructions
    word ^= rotate_left(word, 3)
    word ^= rotate_left(word, 6)
    word ^= rotate_left(word, 17)
    word ^= rotate_left(word, 15)
    word ^= rotate_left(word, 24)
    return word
    
def shift_rows(b, c, d, r1, r2, r3): # 3 instructions
    b = rotate_left(b, r1)
    c = rotate_left(c, r2)    
    d = rotate_left(d, r3)
    return b, c, d
    
def mix_columns(a, b, c, d): # 9 instructions
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """                        
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t        
    return a, b, c, d  
                
def shift_and_mix(a, b, c, d, r1, r2, r3):    # 12 instructions = 
    a, b, c, d = mix_columns(a, b, c, d)            # 9 instructions    
    b, c, d = shift_rows(b, c, d, r1, r2, r3) # 3 instructions + 
    return a, b, c, d
                
def round_function(a, b, c, d, round_number): # 47 instructions
    a ^= generate_round_constant(round_number) # 11     
    a, b, c, d = shift_and_mix(a, b, c, d, 1, 2, 3)              # 12   
    a, b, c, d = shift_and_mix(a, b, c, d, 4, 8, 12)              # 12     
    a, b, c, d = shift_and_mix(a, b, c, d, 16, 32, 48)              # 12     
    return a, b, c, d
                  
def add_key(a, b, c, d, key):
    a ^= key[0]; b ^= key[1]; c ^= key[2]; d ^= key[3];    
    return a, b, c, d
    
def load(data):
    a = data[0]; b = data[1]; c = data[2]; d = data[3];
    return a, b, c, d
    
def store(data, a, b, c, d):
    data[0] = a; data[1] = b; data[2] = c; data[3] = d;
        
def encrypt(data, linear_key, nonlinear_key, rounds=ROUNDS, key_addition_layers=KEY_ADDITION_LAYERS):    
    a, b, c, d = load(data)    
    for key_number in range(key_addition_layers):        
        a, b, c, d = add_key(a, b, c, d, linear_key)
        for round in range(1, rounds + 1):                  
            a, b, c, d = round_function(a, b, c, d, (rounds * key_number) + round)
    
    a, b, c, d = add_key(a, b, c, d, linear_key)
    store(data, a, b, c, d)
    
    
def test_encrypt():
    key = [0] * 4
    key2 = [0] * 4
    data = [0] * 4
    data[0] = 1
    encrypt(data, key, key2)
    print data
        
def visualize_bit_shuffle():
    data = [0, 0, 15, 1]
    key = [0, 0, 0, 3]
    
    def test_function(a, b, c, d):
        return bit_shuffle(a, b, c, d, key)
                
    from crypto.analysis.visualization import test_4x64_function
    test_4x64_function(test_function, data)
            
def visualize_round_function():
    data = [0, 0, 0, 1]    
    
    CONSTANTS = iter(range(1, 128))
    def test_function(a, b, c, d):
        return round_function(a, b, c, d, next(CONSTANTS))                
    from crypto.analysis.visualization import test_4x64_function
    test_4x64_function(test_function, data)
                
                
            
def test_diffusion():
    from crypto.analysis.branch_number import branch_number
    rounds = 4
    def test_function(a, b):
        c = d = 0
        for round in range(1, 1 + rounds):
            a, b, c, d = round_function(a, b, c, d, round)        
        return a, b, c, d#b, 0, 0, 0#b, c, d#0, 0, 0# b, c, d
    print("Differences after {} rounds: {}".format(rounds, branch_number(test_function)))
            
if __name__ == "__main__":    
    #visualize_bit_shuffle()
    #visualize_round_function()
    #test_encrypt()    
    test_diffusion()
    