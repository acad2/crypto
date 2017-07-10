from crypto.utilities import rotate_left, bytes_to_integer, integer_to_bytes

def micksRow(a):
    b = a & 0x80808080;
    
    # b |= b >> 1; # without multiply instruction
    # b |= b >> 3;
    # b >>= 3;
        
    b = (b >> 7) * 0x1B; # with multiply instruction

    b ^= (a << 1) & 0xFEFEFEFE;
    c = a ^ b;
    b ^= (c >>  8) | ((c << 24) & 0xFFFFFFFF);
    b ^= ((a <<  8) & 0xFFFFFFFF) | (a >> 24);
    return b ^ (a >> 16) ^ ((a << 16) & 0xFFFFFFFF);
    
def choice(b, c, d):
    return d ^ (b & (c ^ d))    
       
# mapping = bytearray((0, 7, 14, 1, 5, 11, 8, 2, 3, 10, 13, 6, 15, 12, 4, 9))    
  
def round_function(state1, state2):    
    #state = integer_to_bytes(state1, 8) + integer_to_bytes(state2, 8)
    #temp
    
    #x = ((state[7] << 24) & 255) | ((state[6] << 24) ^ 255) | ((state[5] << 16) & 255) | state[4]
    #y = ((state[3] << 24) & 255) | ((state[2] << 24) ^ 255) | ((state[1] << 16) & 255) | state[0]
    ##
    #x  = ((state[15] << 24) & 255) | ((state[14] << 24) ^ 255) | ((state[13] << 16) & 255) | state[12]
    #y2 = ((state[11] << 24) & 255) | ((state[10] << 24) ^ 255) | ((state[9] << 16) & 255) | state[8]
    
    # state1 0-7 state2 8-15
    # top half   
    # the strange ordering applies shuffle_bytes before the bit permutation     
    
    
    
    #x = ((state[1] << 16) & 255) | ((state[6] << 24) ^ 255) | ((state[5] << 16) & 255) | state[4]
    #y = ((state[3] << 24) & 255) | ((state[2] << 24) ^ 255) |  | state[0]
  
    #x  = ((state[15] << 24) & 255) | ((state[14] << 24) ^ 255) | ((state[13] << 16) & 255) | state[12]
    #y2 = ((state[11] << 24) & 255) | ((state[10] << 24) ^ 255) | ((state[9] << 16) & 255) | state[8]
    
    
    x = (((state2 >> 24) & 255) << 24) | (((state1 >> 40) & 255) << 16) | (((state1 >> 32) & 255) << 8) | ((state2 >> 56) & 255)
    y = (((state2 >> 32) & 255) << 24) | (((state1 >> 48) & 255) << 16) | (((state2 >> 8) & 255) << 8) | (state1 & 255)      
    
    t = (y ^ (y >> 7)) & 0x00AA00AA;  y = y ^ t ^ (t << 7);    
    t = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t ^ (t <<14); 
    t = (y ^ (y >>14)) & 0x0000CCCC;  y = y ^ t ^ (t <<14); 
    
    t = (x & 0xF0F0F0F0) | ((y >> 4) & 0x0F0F0F0F); 
    y = ((x << 4) & 0xF0F0F0F0) | (y & 0x0F0F0F0F); 
            
    # bottom half
    x =  (((state2 >> 40) & 255) << 24) | (((state1 >> 24) & 255) << 16) | (((state2 >> 48) & 255) << 8) | (state2 & 255)
    y2 = (((state1 >> 8) & 255) <<24)  | (((state2 >> 16) & 255) << 16) | (((state1 >> 16) & 255) << 8) | ((state1 >> 56) & 255)      
    
    t2 = (y2 ^ (y2 >> 7)) & 0x00AA00AA;  y2 = y2 ^ t2 ^ (t2 << 7); 
    
    t2 = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t2 ^ (t2 <<14); 
    t2 = (y2 ^ (y2 >>14)) & 0x0000CCCC;  y2 = y2 ^ t2 ^ (t2 <<14); 
    
    t2 = (x & 0xF0F0F0F0) | ((y2 >> 4) & 0x0F0F0F0F); 
    y2 = ((x << 4) & 0xF0F0F0F0) | (y2 & 0x0F0F0F0F);                    
    # end decorrelation layer
    
    # non linear layer + mix the rows       
    t ^= micksRow(rotate_left(choice(y, t2, y2), 1, bit_width=32))
    y ^= micksRow(rotate_left(choice(t2, y2, t), 3, bit_width=32))
    t2 ^= micksRow(rotate_left(choice(y2, t, y), 5, bit_width=32))
    y2 ^= micksRow(rotate_left(choice(t, y, t2), 7, bit_width=32))                    
    
    state1 =  (y << 32) | t        
    state2 = (y2 << 32)| t2     
    
    return state1, state2
    
def decorrelation_layer(state, state2):    
    x = (((state2 >> 24) & 255) << 24) | (((state >> 40) & 255) << 16) | (((state >> 32) & 255) << 8) | ((state2 >> 56) & 255)
    y = (((state2 >> 32) & 255) << 24) | (((state >> 48) & 255) << 16) | (((state2 >> 8) & 255) << 8) | (state & 255)    
    
    t = (y ^ (y >> 7)) & 0x00AA00AA;  y = y ^ t ^ (t << 7);    
    t = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t ^ (t <<14); 
    t = (y ^ (y >>14)) & 0x0000CCCC;  y = y ^ t ^ (t <<14); 
    
    t = (x & 0xF0F0F0F0) | ((y >> 4) & 0x0F0F0F0F); 
    y = ((x << 4) & 0xF0F0F0F0) | (y & 0x0F0F0F0F); 
            
    # bottom half
    x =  (((state2 >> 40) & 255) << 24) | (((state >> 24) & 255) << 16) | (((state2 >> 48) & 255) << 8) | (state2 & 255)
    y2 = (((state >> 8) & 255) <<24)  | (((state2 >> 16) & 255) << 16) | (((state >> 16) & 255) << 8) | ((state >> 56) & 255)      
    
    t2 = (y2 ^ (y2 >> 7)) & 0x00AA00AA;  y2 = y2 ^ t2 ^ (t2 << 7); 
    
    t2 = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t2 ^ (t2 <<14); 
    t2 = (y2 ^ (y2 >>14)) & 0x0000CCCC;  y2 = y2 ^ t2 ^ (t2 <<14); 
    
    t2 = (x & 0xF0F0F0F0) | ((y2 >> 4) & 0x0F0F0F0F); 
    y2 = ((x << 4) & 0xF0F0F0F0) | (y2 & 0x0F0F0F0F);                    
    # end decorrelation layer
    return ((y << 32) | t), ((y2 << 32) | t2)
    
def nonlinear_mixing(t, y, t2, y2):
    t ^= micksRow(choice(y, t2, y2))
    y ^= micksRow(choice(t2, y2, t))
    t2 ^= micksRow(choice(y2, t, y))
    y2 ^= micksRow(choice(t, y, t2))
    return t, y, t2, y2
    
def test_for_fixed_points():
    state = bytearray(16)
    for index in range(16):    
        for shift in range(8):
            state[index] = 1 << shift            
            state1, state2 = bytes_to_integer(state[:8]), bytes_to_integer(state[8:])
            assert format(state1, 'b').zfill(64).count('1') in (1, 0), format(state1, 'b').zfill(64)
            assert format(state2, 'b').zfill(64).count('1') in (1, 0), format(state2, 'b').zfill(64)
            
            state1, state2 = decorrelation_layer(state1, state2)
            assert format(state1, 'b').zfill(64).count('1') in (1, 0), format(state1, 'b').zfill(64)
            assert format(state2, 'b').zfill(64).count('1') in (1, 0), format(state2, 'b').zfill(64)
            
            _state = integer_to_bytes(state1, 8) + integer_to_bytes(state2, 8)
            if _state[index] == 1 << shift:
                print "Fixed point in decorrelation layer at: {} {}".format(index, shift)
            
            state[index] = 0
        
    for state in range(2 ** 24):
        state = integer_to_bytes(state, 16)
        inputs = bytes_to_integer(state[:4]), bytes_to_integer(state[4:8]), bytes_to_integer(state[8:12]), bytes_to_integer(state[12:16])
        outputs = nonlinear_mixing(*inputs)
        
        if inputs == outputs:
            print "Fixed point in nonlinear mixing layer: {}".format([format(word, 'b').zfill(32) for word in inputs])
            
            
def get_output_difference(function, input1, input2):    
    output1 = function(input1)
    output2 = function(input2)
    
    output1_bits = ''.join(format(byte, 'b').zfill(8) for byte in output1)
    output2_bits = ''.join(format(byte, 'b').zfill(8) for byte in output2)    
    return _get_difference(output1, output2)        
    
def binary_form(bytestring):
    return ''.join(format(byte, 'b').zfill(8) for byte in bytestring)
    
def _get_difference(output1, output2):  
    output1_bits = binary_form(output1)
    output2_bits = binary_form(output2)
    input_differences = b''
    
    for index, bit in enumerate(output1_bits):          
        if bit != output2_bits[index]:
            input_differences += '1'
        else:
            input_differences += '0'
    return input_differences        
    
def print_active_sbox_info():
    rounds = 1
    input1 = bytearray(16)
    input2 = bytearray(16)
    input1[-1] = 1
    
    def test_function(state):
        state1, state2 = bytes_to_integer(state[:8]), bytes_to_integer(state[8:16])
        state1, state2 = round_function(state1, state2)
        state[:] = integer_to_bytes(state1, 8) + integer_to_bytes(state2, 8)
        return state
        
    for round in range(rounds):
        input_difference = _get_difference(input1, input2)
        print "Input difference: {}/{}".format(input_difference.count('1'), len(input_difference))
        output_difference = get_output_difference(test_function, input1, input2)
        print "Active bits: {}/{}".format(output_difference.count('1'), len(output_difference))                   
            
def test_round_function():
    from crypto.utilities import print_state_4x4, integer_to_bytes
    state, state2 = 1, 0
    
    state = polarize(state)
    state, state2 = round_function(state, state2)
    print_state_4x4(integer_to_bytes(state, 8) + integer_to_bytes(state2, 8))    
    print "State :\n{}".format(state)
    print "State2:\n{}".format(state2)
        
if __name__ == "__main__":
    #test_round_function()
    #print_active_sbox_info()
    test_for_fixed_points()
    