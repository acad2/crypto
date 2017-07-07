from crypto.utilities import random_bytes

WORD_SIZE_BITS = 6
STATE_LENGTH = 64

def generate_state(length=STATE_LENGTH):
    return range(length)          
        
def permute_columns(state, key):
    for index, word in enumerate(state):
        state[index] = (word + key[index]) % STATE_LENGTH
                
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
    if key: 
        key = 0x63    
    t = word1    
    word1 = choice(key, word1, word2)
    word2 = choice(key, word2, t)
    return word1, word2
                        
def permutation(state, key=[item & 1 for item in bytearray(random_bytes(STATE_LENGTH))]):    
    # permutation /\  4 1 2 3
    #             |   3 4 1 2 
    #            \/   2 3 4 1 
    #                 ------- 
    #permutation <--> 1 2 3 4 
    state = list(state)
    #permute_columns(state, key)
    permute_row(state, key)
    
    return state
    
def visualize_permutation():
    from crypto.analysis.visualization import test_64x6_function
    test_64x6_function(lambda *args: permutation(args), generate_state())
    
if __name__ == "__main__":
    visualize_permutation()
    