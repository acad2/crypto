ROUNDS = 4              # 2 ** (-differential_probability * active_sboxes) == 2 ** (-2 * 64) == (2 ** -128) ?
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
    
def mix_columns(a, b, c, d): # 4 instructions
    a ^= d # ad
    b ^= c # bc
    c ^= a # acd
    d ^= b # bcd
    return a, b, c, d
                
def shift_and_mix(a, b, c, d, r1, r2, r3):    # 7 instructions =    
    b, c, d = shift_rows(b, c, d, r1, r2, r3) # 3 instructions + 
    return mix_columns(a, b, c, d)            # 4 instructions 
    
def sbox(a, b, c, d): # 9 instructions 
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """                        
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t        
    return a, b, c, d  
        
def linear_layer(a, b, c, d):    
    a, b, c, d = shift_and_mix(a, b, c, d, 1, 2, 3) # each 4x4 subsection is active      # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 4, 8, 12) # each 16x4 subsection is active    # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 16, 32, 48) # each 64x4 subsection is active  # 7   
    return a, b, c, d
    
def round_function(a, b, c, d, round_number): # 41 instructions (not counting loop)            
    a ^= generate_round_constant(round_number) # 11     
    a, b, c, d = sbox(a, b, c, d)              # 9 
    a, b, c, d = linear_layer(a, b, c, d)
    return a, b, c, d
              
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(a, b, c):
    t = b
    b = choice(a, b, c)
    c = choice(a, c, t)
    return b, c        
        
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, c = choice_swap(k0, a, c)
    b, d = choice_swap(k1, b, d)
    c, b = choice_swap(k2, c, b)
    d, a = choice_swap(k3, d, a)
    return a, b, c, d
    
def shift_and_shuffle(a, b, c, d, r1, r2, r3, k0, k1, k2, k3):   
    b, c, d = shift_rows(b, c, d, r1, r2, r3)
    return shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
def bit_shuffle(a, b, c, d, nonlinear_key):
    k0, k1, k2, k3 = load(nonlinear_key)
    for round in range(2):
        a, b, c, d = shift_and_shuffle(a, b, c, d, 1, 2, 3, k0, k1, k2, k3)        
        a, b, c, d = shift_and_shuffle(a, b, c, d, 4, 8, 12, k0, k1, k2, k3)        
        a, b, c, d = shift_and_shuffle(a, b, c, d, 16, 32, 48, k0, k1, k2, k3)        
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
        a, b, c, d = bit_shuffle(a, b, c, d, nonlinear_key)
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
            
            
def test_diffusion():
    from crypto.analysis.branch_number import branch_number
    rounds = 2
    def test_function(a, b):
        c = d = 0
        for round in range(1, 1 + rounds):
            a, b, c, d = round_function(a, b, c, d, round)        
        return b, 0, 0, 0#b, c, d#0, 0, 0# b, c, d
    print("Differences after {} rounds: {}".format(rounds, branch_number(test_function)))
            
if __name__ == "__main__":    
    visualize_bit_shuffle()
    #test_encrypt()    
    #test_diffusion()
    