from crypto.utilities import random_bytes

WORD_SIZE_BITS = 32
MASK64 = (2 ** WORD_SIZE_BITS) - 1
STATE_LENGTH = 8

def generate_state(length=STATE_LENGTH):
    return range(length)          
        
def generate_key(length=STATE_LENGTH, mask=MASK64):
    key_m = [(item & mask) | 1 for item in bytearray(random_bytes(length))]
    key_e = [item & mask for item in bytearray(random_bytes(length))]
    return key_m + key_e
        
def permute_columns(state, key, mask=MASK64):
    for index, word in enumerate(state):
        state[index] = ((word * key[index]) + key[STATE_LENGTH + index]) & mask
                
def permute_row(state, key):
    size = len(state)
    for index in range(size - 1):
        for index2 in range(index + 1, size):            
            word1 = state[index]; word2 = state[index2]
            word1, word2 = choice_swap(key, word1, word2)
            state[index] = word1; state[index2] = word2
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(key, word1, word2):    
  #  if key: 
  #      key = 0x63    
    t = word1    
    word1 = choice(key, word1, word2)
    word2 = choice(key, word2, t)
    return word1, word2
                        
# a1x + b1
#a2(a1x + b1) + b2
#a1a2x + a2b1 + b2
#a3(a1a2x + a2b1 + b2) + b3
#a1a2a3x + a2a3b1 + a3b2 + b3


def permutation(state, key=generate_key()):    
    # permutation /\  4 1 2 3
    #             |   3 4 1 2 
    #            \/   2 3 4 1 
    #                 ------- 
    #permutation <--> 1 2 3 4 
    state = list(state)
   # permute_columns(state, key)
    permute_row(state, key)
    
    return state
    
def visualize_permutation():
    from crypto.analysis.visualization import test_8x32_function
    test_8x32_function(lambda *args: permutation(args), generate_state())
    
if __name__ == "__main__":
    visualize_permutation()
    