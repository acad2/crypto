#define ROUNDS = 4
#define mix(a, b, c, d){a += b; c += d; b ^= c; d ^= a;}
#define rotate_left(word, amount)((a << amount) | (a >> (32 - amount)))
#define shift(b, c, d, r1, r2, r3){b = rotate_left(b, r1); c = rotate_left(c, r2);  d = rotate_left(d, r3);}
#define mix_block(a, b, c, d){mix(a, b, c, d); shift(b, c, d, 1, 2, 3);\
                              mix(a, b, c, d); shift(b, c, d, 4, 8, 12);\
                              mix(a, b, c, d); shift(b, c, d, 8, 12, 16);}
#define generate_constants(counter){c0 = counter; c1 = counter + 1; c2 = counter + 2; c3 = counter + 3;\
                                   mix_block(c0, c1, c2, c3); mix_block(c0, c1, c2, c3);}
#define add_constant(counter, block0, block1, block2, block3){generate_constants(counter);\
                                                              block0[0] ^= c0; block1[0] ^= c1;\
                                                              block2[0] ^= c2; block3[0] ^= c3;}                                 
#define mix_blocks(counter, block0, block1, block2, block3){add_constant(counter, block0, block1, block2, block3);\
    
    for round in range(ROUNDS):
        block0 = mix_block(*block0)
        block1 = mix_block(*block1)
        block2 = mix_block(*block2)
        block3 = mix_block(*block3)
    
    a0, b0, c0, d0 = block0    #a0, b3, c2, d1  
    a1, b1, c1, d1 = block1    #a1, b0, c3, d2    
    a2, b2, c2, d2 = block2    #a2, b1, c0, d3    
    a3, b3, c3, d3 = block3    #a3, b2, c1, d0            
    return [[a0, b3, c2, d1], [a1, b0, c3, d2], [a2, b1, c0, d3], [a3, b2, c1, d0]]

def permutation(counter, a0, b0, c0, d0, a1, b1, c1, d1, a2, b2, c2, d2, a3, b3, c3, d3):
    state0, state1, state2, state3 = ([a0, b0, c0, d0], [a1, b1, c1, d1], [a2, b2, c2, d2], [a3, b3, c3, d3])
    state0, state1, state2, state3 = mix_blocks(counter, state0, state1, state2, state3)
    state0, state1, state2, state3 = mix_blocks(counter + 1, state0, state1, state2, state3)
    return state0 + state1 + state2 + state3
 
// inverse in different file 
    