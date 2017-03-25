from crypto.utilities import rotate_left, xor_sum

WORDSIZE = 8

def branch(word):
    word ^= rotate_left(word, 3)
    word ^= rotate_left(word, 6)
    return word
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(k, a, b):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b               
        
def permutation(state, sbox, wordsize=WORDSIZE, cache=[branch(index) for index in range(32)]):    
    assert len(state) < 32    
    _sum = xor_sum(state) # 16
    size = len(state)
    for index in range(size):
        #for index2 in range(index, size):
        #    word0, word1 = state[index], state[index2]
        #    _sum ^= word0 ^ word1
        #    word0, word1 = choice_swap(_sum, word0, word1)
        #    state[index] = rotate_left(sbox[word0 ^ cache[index]], 1, wordsize)
        #    state[index2] = sbox[rotate_left(word1, 1, wordsize) ^ cache[index2]]
        #    _sum ^= state[index] ^ state[index2]
            
            
        byte = state[index]
        state[index] = sbox[_sum ^ cache[index]] # 3
        _sum = rotate_left(sbox[_sum ^ byte ^ state[index]], 1, wordsize) # 4
                    
            
    #print state        
    
def test_permutation():
    from crypto.analysis.metrics import test_permutation
    from crypto.designs.blockcipher.standardized.aes_procedures import S_BOX
        
    def test_function(data):
        data = bytearray(data)
        permutation(data, S_BOX)
        return bytes(data)
    test_permutation(test_function, 16, avalanche_test=False, randomness_test=False)
                
if __name__ == "__main__":
    test_permutation()
    