from crypto.utilities import rotate_left

ROUNDS = 1
SBOX4 = [int(character, 16) for character in "086d5f7c4e2391ba"]
SBOX8 = []
for count in range(256):
    SBOX8.append((SBOX4[count >> 4] << 4) | SBOX4[count & 15])

def mix_columns(a, b, c, d): 
    """ Optimal 4x4 s-box implementation; Applies 64 s-boxes in parallel on the columns. """       
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t        
    return a, b, c, d  
    
def shift_rows(b, c, d, r1, r2, r3):
    b = (rotate_left(b >> 4, r1, 4) << 4) | rotate_left(b & 15, r1, 4)
    c = (rotate_left(c >> 4, r2, 4) << 4) | rotate_left(c & 15, r2, 4)
    d = (rotate_left(d >> 4, r3, 4) << 4) | rotate_left(d & 15, r3, 4)
    return b, c, d
    
def mix_8x4(a, b, c, d, sbox=SBOX8):
    a ^= 1; b ^= 1; c ^= 1; d ^= 1;
    a, b, c, d = mix_columns(a, b, c, d)    
    #a, b, c, d = (sbox[item] for item in (a, b, c, d))    
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    a, b, c, d = mix_columns(a, b, c, d)    
    #a, b, c, d = (sbox[item] for item in (a, b, c, d)) 
    return a, b, c, d
    
def mix_slice(a, b, c, d):
    for index in range(4):        
        a[index], b[index], c[index], d[index] = mix_8x4(*[item[index] for item in (a, b, c, d)])
        
def shift_words(b, c, d):
    b[:] = (rotate_left(item, 4, 8) for item in b)      
    d[:] = (rotate_left(item, 4, 8) for item in d)
    b[:] = b[1:] + b[:1]
    c[:] = c[2:] + c[:2]
    d[:] = d[3:] + d[:3]   
   
def mix_state(a, b, c, d):    
    mix_slice(a, b, c, d)
    shift_words(b, c, d)
          
def permutation(a, b, c, d, rounds=ROUNDS):    
    for round in range(1, rounds + 1):
        a[-1] ^= round; b[-2] ^= round; c[-3] ^= round; d[-4] ^= round;        
        mix_state(a, b, c, d)        
        
def visualize_mix_4x4_function():
    from crypto.analysis.visualization import test_8x8_function
    test_8x8_function(mix_8x4, (0, 0, 0, 4))
    
def visualize_mix_state():
    from crypto.analysis.visualization import test_4x32_function
    from crypto.utilities import integer_to_bytes, bytes_to_integer
    def test_function(a, b, c, d):
        state = [integer_to_bytes(word, 4) for word in (a, b, c, d)]        
        permutation(*state)
        return [bytes_to_integer(item) for item in state]
    test_4x32_function(test_function, (0, 0, 0, 1))
        
        
if __name__ == "__main__":
    visualize_mix_4x4_function()
    visualize_mix_state()
    