from crypto.utilities import  longs_to_bytes, bytes_to_longs
from crypto.designs.nonlinear.ciphercomponents import optimized_bit_byte_transposition_words as branching_step
from crypto.designs.nonlinear.ciphercomponents import choice_rotate_mixRow as nonlinear_mixing_step
   
def permutation_256_32(state, rounds=1):
    (a, b, c, d,
     e, f, g, h) = bytes_to_longs(state)
    for round in range(rounds):               
        a, b, c, d = nonlinear_mixing_step(*branching_step(a, b, c, d)) # could be done in parallel in hardware
        e, f, g, h = nonlinear_mixing_step(*branching_step(e, f, g, h)) # could be done in parallel in hardware
                                                               
        a, b, e, f = nonlinear_mixing_step(*branching_step(a, b, e, f))
        c, d, g, h = nonlinear_mixing_step(*branching_step(c, d, g, h))
                                                               
        a, b, g, h = nonlinear_mixing_step(*branching_step(a, b, g, h))
        c, d, a, b = nonlinear_mixing_step(*branching_step(c, d, a, b))
        
    state[:] = longs_to_bytes(a, b, c, d, e, f, g, h)
    
def test_permutation():
    from crypto.analysis.metrics import test_permutation
    def _permutation(_input):
        state = bytearray(_input)
        permutation_256_32(state)
        return bytes(state)
        
    test_permutation(_permutation, 32)                
        
        
if __name__ == "__main__":    
    test_permutation()
    