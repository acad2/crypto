from crypto.utilities import random_integer, rotate_left

WORDSIZE = 32
SWAP_FLAG = (2 ** 32) - 1
SWAP_OR_NOT = (SWAP_FLAG, 0)
TEST_SWAPS = [SWAP_FLAG, SWAP_FLAG, SWAP_FLAG, 0, 0]

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(k, a, b):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b           
    
def generate_key(rounds=1):
    return [random_integer(1) for count in range(5 * rounds)]
    
def shuffle_columns(a, b, c, d, k, offset=0):
    #a ^= b      # ab
    #c ^= d      # cd
    #b ^= c      # bcd
    #d ^= a ^ b  # ac    
    
    # ab
    # cd  
    # bcd
    # dab
    a, b = choice_swap(k[0 + offset], a, b)
    c, d = choice_swap(k[1 + offset], c, d)
    b, c = choice_swap(k[2 + offset], b, c)              
    d, b = choice_swap(k[4 + offset], d, b)    
    d, a = choice_swap(k[3 + offset], d, a)
    
    return a, b, c, d
    
def shift_rows(b, c, d, r1, r2, r3):
    return rotate_left(b, r1, 32), rotate_left(c, r2, 32), rotate_left(d, r2, 32)
    
K = generate_key(4)
    
def keyed_bit_permutation(a, b, c, d, k=K):
    a, b, c, d = shuffle_columns(a, b, c, d, k, 0)    
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k, 5)    
    b, c, d = shift_rows(b, c, d, 4, 8, 12)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k, 10)    
    b, c, d = shift_rows(b, c, d, 8, 16, 24)
    
    a, b, c, d = shuffle_columns(a, b, c, d, k, 15)    
    b, c, d = shift_rows(b, c, d, 16, 20, 24)
    return a, b, c, d
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    state = (6, 0, 0, 0)
    
    test_4x32_function(keyed_bit_permutation, state)
    
if __name__ == "__main__":
    visualize_permutation()
    