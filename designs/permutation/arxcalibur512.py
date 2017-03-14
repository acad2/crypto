from crypto.utilities import rotate_left, modular_subtraction

WORDSIZE = 32
MODULUS = 2 ** 32
MASK = MODULUS - 1
ROUNDS = 4

def mix_columns(a, b, c, d, mask=MASK):
    a = (a + b) & mask
    c = (c + d) & mask
    b ^= c
    d ^= a
    return a, b, c, d
    
def shift_rows(b, c, d, r1, r2, r3, wordsize=WORDSIZE):
    b = rotate_left(b, r1, wordsize)
    c = rotate_left(c, r2, wordsize)
    d = rotate_left(d, r3, wordsize)
    return b, c, d
    
def mix_block(a, b, c, d):
    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    
    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 4, 8, 12)

    a, b, c, d = mix_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 8, 12, 16)    
    return a, b, c, d
    
def mix_blocks(block0, block1, block2, block3):    
    for round in range(ROUNDS):
        block0 = mix_block(*block0)
        block1 = mix_block(*block1)
        block2 = mix_block(*block2)
        block3 = mix_block(*block3)
    
    a0, b0, c0, d0 = block0    #a0, b3, c2, d1  
    a1, b1, c1, d1 = block1    #a1, b0, c3, d2    
    a2, b2, c2, d2 = block2    #a2, b1, c0, d3    
    a3, b3, c3, d3 = block3    #a3, b2, c1, d0            
    return [(a0, b3, c2, d1), (a1, b0, c3, d2), (a2, b1, c0, d3), (a3, b2, c1, d0)]

def permutation(a0, b0, c0, d0, a1, b1, c1, d1, a2, b2, c2, d2, a3, b3, c3, d3):
    state0, state1, state2, state3 = ((a0, b0, c0, d0), (a1, b1, c1, d1), (a2, b2, c2, d2), (a3, b3, c3, d3))
    state0, state1, state2, state3 = mix_blocks(state0, state1, state2, state3)
    state0, state1, state2, state3 = mix_blocks(state0, state1, state2, state3)
    return state0 + state1 + state2 + state3
        

def invert_permutation(a0, b0, c0, d0, a1, b1, c1, d1, a2, b2, c2, d2, a3, b3, c3, d3):
    state0, state1, state2, state3 = ((a0, b0, c0, d0), (a1, b1, c1, d1), (a2, b2, c2, d2), (a3, b3, c3, d3))    
    state0, state1, state2, state3 = unmix_blocks(state0, state1, state2, state3)    
    state0, state1, state2, state3 = unmix_blocks(state0, state1, state2, state3)    
    return state0 + state1 + state2 + state3
        
def unmix_blocks(block0, block1, block2, block3):
    a0, b0, c0, d0 = block0
    a1, b1, c1, d1 = block1
    a2, b2, c2, d2 = block2
    a3, b3, c3, d3 = block3
    
    block0 = a0, b1, c2, d3
    block1 = a1, b2, c3, d0
    block2 = a2, b3, c0, d1
    block3 = a3, b0, c1, d2
    
    for round in range(ROUNDS):
        block0 = unmix_block(*block0)
        block1 = unmix_block(*block1)
        block2 = unmix_block(*block2)
        block3 = unmix_block(*block3)
    return block0, block1, block2, block3
    
def unmix_block(a, b, c, d):
    b, c, d = invert_shift_rows(b, c, d, 8, 12, 16)
    a, b, c, d = invert_mix_columns(a, b, c, d)
    
    b, c, d = invert_shift_rows(b, c, d, 4, 8, 12)
    a, b, c, d = invert_mix_columns(a, b, c, d)

    b, c, d = invert_shift_rows(b, c, d, 1, 2, 3)
    a, b, c, d = invert_mix_columns(a, b, c, d)    
    return a, b, c, d
    
def invert_shift_rows(b, c, d, r1, r2, r3, wordsize=WORDSIZE):
    b = rotate_left(b, wordsize - r1, wordsize)
    c = rotate_left(c, wordsize - r2, wordsize)
    d = rotate_left(d, wordsize - r3, wordsize)
    return b, c, d
    
def invert_mix_columns(a, b, c, d, modulus=MODULUS):
    d ^= a
    b ^= c
    c = modular_subtraction(c, d, modulus)
    a = modular_subtraction(a, b, modulus)
    return a, b, c, d
    
def test_permutation_invert_permutation():
    data = [0] * 16
    data[-1] = 1
    _data = permutation(*data)    
    __data = invert_permutation(*_data)
    assert list(__data) == data, (__data, data, len(__data), len(data))
        
if __name__ == "__main__":
    test_permutation_invert_permutation()
    