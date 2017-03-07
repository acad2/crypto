ROUNDS = 1

def rotate_left(word, amount):
    return ((word << amount) | (word >> (64 - amount))) & 0xFFFFFFFFFFFFFFFF
    
def add_key(data, key):
    data[0] ^= key[0]; data[1] ^= key[1]; data[2] ^= key[2]; data[3] ^= key[3];    
    return a, b, c, d
    
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
    c = (b & c) ^ d
    d = (d & a) ^ t
    b ^= c & t    
    return a, b, c, d  
    
def round_function(a, b, c, d, round_number): # 41 instructions (not counting loop)
    a ^= generate_round_constant(round_number) # 11      
    a, b, c, d = shift_and_mix(a, b, c, d, 1, 2, 3) # each 4x4 subsection is active      # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 4, 8, 12) # each 16x4 subsection is active    # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 16, 32, 48) # each 64x4 subsection is active  # 7   
    return sbox(a, b, c, d) # 9 instructions
            
def encrypt(data, key, rounds=ROUNDS):
    add_key(data, key)
    a, b, c, d = data[0], data[1], data[2], data[3]            
    
    for round in range(1, rounds + 1):        
        a, b, c, d = round_function(a, b, c, d, round)
    
    data[0], data[1], data[2], data[3] = a, b, c, d    
    add_key(data, key)
    
def test_encrypt():
    key = [0] * 4
    data = [0] * 4
    data[0] = 1
    encrypt(data, key)
    #print data
    
def test_for_rotational_symmetry():
    from crypto.utilities import rotate_right
    data1 = [0] * 4
    data2 = [0] * 4
    constant = generate_round_constant(1)
    data1[0] = 1 #constant ^ 1#generate_round_constant(1) ^ 1
    data2[0] = 2 #constant ^ 2#generate_round_constant(1) ^ 2
    _data1 = round_function(*data1 + [1])
    _data2 = round_function(*data2 + [1])
    for index in range(4):
        print format(_data1[index], 'b').zfill(64)
        print format(rotate_right(_data2[index], 1, 64), 'b').zfill(64)
        if _data1[index] != rotate_right(_data2[index], 1, 64):
            print "Rotational symmetry not detected"
            break
    else:
        print "Rotational symmetry present"
    
def test_diffusion():
    from crypto.analysis.branch_number import branch_number
    def test_function(a, b):
        c = d = 0
        for round in range(1, 4):
            a, b, c, d = round_function(a, b, c, d, round)        
        return a, b, c, d
    print branch_number(test_function)        
        
if __name__ == "__main__":
    test_encrypt()
    test_for_rotational_symmetry()
    test_diffusion()
    