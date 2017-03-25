from crypto.utilities import rotate_left
        
def permutation(state):
    mix_columns(state, 0)
    mix_columns(state, 1)
    mix_columns(state, 2)
    mix_columns(state, 3)    
  #  shift_rows(state)
        
def mix_columns(state, base_index):
    a, b, c, d = state[base_index], state[base_index + 4], state[base_index + 8], state[base_index + 12]
    
    a, b, c, d = sbox(a, b, c, d)
    b, c, d = rotate_words(b, c, d, 1, 2, 3)    
    a ^= b; c ^= d; b ^= c; d ^= a;
    
   # a, b, c, d = sbox(a, b, c, d)
    b, c, d = rotate_words(b, c, d, 2, 3, 4)    
    a ^= b; c ^= d; b ^= c; d ^= a;    
    
    state[base_index], state[base_index + 4], state[base_index + 8], state[base_index + 12] = a, b, c, d
    return a, b, c, d

def sbox(a, b, c, d):    
    t = a;
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t
    return a, b, c, d
    
def rotate_words(b, c, d, r1, r2, r3):
    b = rotate_left(b, r1, 8)
    c = rotate_left(c, r2, 8)
    d = rotate_left(d, r3, 8)  
    return b, c, d    
        
def shift_rows(state):
    #  0  1  2  3
    #  4  5  6  7
    #  8  9 10 11
    # 12 13 14 15
    
    t = state[4];
    state[4] = state[5];
    state[5] = state[6];
    state[6] = state[7];
    state[7] = t;
    
    t, t2 = state[8], state[9]
    state[8], state[9] = state[10], state[11]
    state[10], state[11] = t, t2
    
    t = state[15]
    state[15] = state[14]
    state[14] = state[13]
    state[13] = state[12]
    state[12] = t
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x4x8_function
    state = [0] * 16
    state[3] = 1
    
    def test_function(*args):
        state = list(args)
        permutation(state)
        return state
    test_4x4x8_function(test_function, state)
    
if __name__ == "__main__":
    visualize_permutation()
    
    
    
    