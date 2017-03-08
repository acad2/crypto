ROUNDS = 1

def rotate_left(word, amount):
    return ((word << amount) | (word >> (64 - amount))) & 0xFFFFFFFFFFFFFFFF
    
def add_key(a, b, c, d, key):
    a ^= key[0]; b ^= key[1]; c ^= key[2]; d ^= key[3];    
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
    # something is wrong with this implementation - http://skew2011.mat.dtu.dk/proceedings/Finding%20Optimal%20Bitsliced%20Implementations%20of%204%20to%204-bit%20S-boxes.pdf page 9
    # function does not produce correct result -> 086d5f7c4e2391ba 
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t    
    
    #t = d
    #d = (d & c) ^ b
    #b = (b & c) ^ a
    #a = (a & d) ^ t
    #c ^= b & t     
            
    return a, b, c, d  
    
def round_function(a, b, c, d, round_number): # 41 instructions (not counting loop)            
    a ^= generate_round_constant(round_number) # 11     
    a, b, c, d = sbox(a, b, c, d)              # 9 
    a, b, c, d = shift_and_mix(a, b, c, d, 1, 2, 3) # each 4x4 subsection is active      # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 4, 8, 12) # each 16x4 subsection is active    # 7
    a, b, c, d = shift_and_mix(a, b, c, d, 16, 32, 48) # each 64x4 subsection is active  # 7   
    return a, b, c, d
            
def encrypt(data, key, rounds=ROUNDS):    
    a, b, c, d = data[0], data[1], data[2], data[3]            
    
    for round in range(1, rounds + 1):        
        a, b, c, d = add_key(a, b, c, d, key)
        a, b, c, d = round_function(a, b, c, d, round)
    
    a, b, c, d = add_key(a, b, c, d, key)
    data[0], data[1], data[2], data[3] = a, b, c, d    
    
    
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
    _data1 = round_function(*round_function(*round_function(*data1 + [1]) + (2, )) + (3, ))
    _data2 = round_function(*round_function(*round_function(*data2 + [1]) + (2, )) + (3, ))
    for index in range(4):
        print format(_data1[index], 'b').zfill(64)
        print format(_data2[index], 'b').zfill(64)
        print("Differences: {}".format(format(_data1[index] ^ _data2[index], 'b').count('1')))
        if _data1[index] != rotate_right(_data2[index], 1, 64):            
            print "Rotational symmetry not detected"
            break
    else:
        print "Rotational symmetry present"
    
def test_diffusion():
    from crypto.analysis.branch_number import branch_number
    rounds = 2
    def test_function(a, b):
        c = d = 0
        for round in range(1, 1 + rounds):
            a, b, c, d = round_function(a, b, c, d, round)        
        return b, 0, 0, 0#b, c, d#0, 0, 0# b, c, d
    print("Differences after {} rounds: {}".format(rounds, branch_number(test_function)))
        
# if the best differential is 1/4 or 1/2**2 and there really are 64 active s-boxes per 2 rounds, then ...
# if we can assume that each application of shift_and_mix doubles the number of terms that represents any given bit, then the formula for the number of terms is:
#   2 ** applications
#   2 ** (3 applications * rounds) = level
#       2 ** (3 * r) = 2 ** 128
#       3 * r = 128
#       r = 128 / 3 == 42.6 
#   2 ** (3 * 10) = 2 ** 30

def test_sbox_representation():
    from encrypt import sbox as sbox_f
    SBOX = [int(character, 16) for character in "086d5f7c4e2391ba"]
    
    def get_int(a, b, c, d):
        out = 0
    
        if a: out |= 0x01
        if b: out |= 0x02
        if c: out |= 0x04
        if d: out |= 0x08
    
        return out
    
    _sbox = []
    for _input in range(16):
        a = _input & 1
        b = _input & 2
        c = _input & 4
        d = _input & 8
        
        a, b, c, d = sbox_f(a, b, c, d)
        _output = get_int(a, b, c, d)
        assert sbox[_input] == _output, (sbox[_input], _output, _input, a, b, c, d)
        print _input
        _sbox.append(_output)
    
if __name__ == "__main__":
    #test_sbox_representation()
    #test_encrypt()
    #test_for_rotational_symmetry()
    test_diffusion()
    