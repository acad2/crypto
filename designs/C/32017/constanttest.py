from crypto.utilities import rotate_left, slide

def add_constant(round_constants):
    output = 0
    for counter, constant in enumerate(round_constants):
        t = constant                 
        t ^= rotate_left(t, 3, 64);         
        t ^= rotate_left(t, 6, 64);         
        t ^= rotate_left(t, 17, 64);        
        t ^= rotate_left(t, 15, 64);         
        t ^= rotate_left(t, 24, 64);
        output |= t << (64 * counter)
    round_constants[0] += 4; round_constants[1] += 4; round_constants[2] += 4; round_constants[3] += 4;
    return output
    
cs = [1, 2, 3, 4]
    