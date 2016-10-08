# bit transposition: (8 ** 2) + 8 = (64 + 8) = 72
# byte transposition: 16
# total: 88
# 
# prp/prf: 16
# xor_with_key: 16
# 
# prp/prf + xor_with_key without composed fs :       4 * rounds                                                  
#                                                   32 * round_complexity
#                                                  128 = psuedo instructions
#                                                                                                                     
# prp/prf + xor_with_key + composed_functions: (88 + 32) = 120    round_complexity
#                                                            4  * rounds
#                                                          480 = psuedo instructions
#                                                           
#                                                  (4 * 32) != (4 * 120)
#                                                  (15 * 32) = (4 * 120) = 480
#                                                  
# 15 rounds of prp(xor_with_key()) requires the same amount of psuedo instructions as 4 rounds of byte_transposition(bit_transposition(prp(xor_with_key())))

                                           
def bit_transposition(state):
    output = bytearray(16)
    for index in range(8):
        output[index] = 0
        for index2 in range(8):            
            byte = state[index2]
            output[index] |= ((byte & 1) << index2) & 255
            state[index2] = rotate_right(byte, 1)        
        
        output[index + 8] = rotate_left(state[index + 8], 1)
    
    state[:] = output[:]  

def byte_transposition(_state):   
    temp = bytearray(16)
    
    temp[7] = _state[0] 
    temp[12] = _state[1]
    temp[14] = _state[2]
    temp[9] = _state[3]
    temp[2] = _state[4]
    temp[1] = _state[5]
    temp[5] = _state[6]
    temp[15] = _state[7]
    temp[11] = _state[8]
    temp[6] = _state[9]
    temp[13] = _state[10]
    temp[0] = _state[11]
    temp[4] = _state[12]
    temp[8] = _state[13]
    temp[10] = _state[14]
    temp[3] = _state[15]
            
    _state[:] = temp[:]
             
def decorrelation_layer(data):
    bit_transposition(data)
    byte_transposition(data)
                
def invert_byte_transposition(state):
    temp = bytearray(16)
    
    temp[11] = state[0]
    temp[5] = state[1]
    temp[4] = state[2]
    temp[15] = state[3]
    temp[12] = state[4]
    temp[6] = state[5]
    temp[9] = state[6]
    temp[0] = state[7]
    temp[13] = state[8]
    temp[3] = state[9]
    temp[14] = state[10]
    temp[8] = state[11]
    temp[1] = state[12]
    temp[10] = state[13]
    temp[2] = state[14]
    temp[7] = state[15]
    
    state[:] = temp[:]
    
def test_bit_byte_transposition_diffusion():
    def test_hash(data):
        output = bytearray(16)
        for block in slide(bytearray(data), 16):
            block.extend("\x00" * (16 - len(block)))
            assert len(block) == 16
            for round in range(4):
                bit_transposition(block)
                byte_transposition(block)
                for index in range(16):
                    block[index] = (block[index] + block[(index + 2) % 16] + index) % 256
            xor_subroutine(output, block)        
        return bytes(output)
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(test_hash)
    