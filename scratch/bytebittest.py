from pride.crypto.utilities import bytes_to_integer, integer_to_bytes

# 0 1 2 3  4 5  6  7   8  9 10 11 12 13 14 15 
# 8 6 5 15 1 13 10 9   14 12 2 4  7  0  14 3

def decorrelation_layer(state1, state2, transposition_table):    
    state = bytearray(16)
    for index, byte in enumerate(integer_to_bytes(state1, 8) + integer_to_bytes(state2, 8)):
        state[transposition_table[index]] = byte
    
    state1, state2 = bytes_to_integer(state[:8]), bytes_to_integer(state[8:])
    # top half   
    # the strange ordering applies shuffle_bytes before the bit permutation         
        
    x = (((state1 >> 56) & 255) << 24) | (((state1 >> 48) & 255) << 16) | (((state1 >> 40) & 255) << 8) | ((state1 >> 32) & 255)
    y = (((state1 >> 24) & 255) << 24) | (((state1 >> 16) & 255) << 16) | (((state1 >> 8) & 255) << 8)  |  (state1 & 255)    
    
    t = (y ^ (y >> 7)) & 0x00AA00AA;  y = y ^ t ^ (t << 7);    
    t = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t ^ (t <<14); 
    t = (y ^ (y >>14)) & 0x0000CCCC;  y = y ^ t ^ (t <<14); 
    
    t = (x & 0xF0F0F0F0) | ((y >> 4) & 0x0F0F0F0F); 
    y = ((x << 4) & 0xF0F0F0F0) | (y & 0x0F0F0F0F); 
            
    # bottom half
    x =  (((state2 >> 56) & 255) << 24) | (((state2 >> 48) & 255) << 16) | (((state2 >> 40) & 255) << 8) | ((state2 >> 32) & 255)
    y2 = (((state2 >> 24) & 255) << 24) | (((state2 >> 16) & 255) << 16) | (((state2 >> 8) & 255) << 8)  |  (state2 & 255)       
       
    t2 = (y2 ^ (y2 >> 7)) & 0x00AA00AA;  y2 = y2 ^ t2 ^ (t2 << 7); 
    
    t2 = (x ^ (x >>14)) & 0x0000CCCC;  x = x ^ t2 ^ (t2 <<14); 
    t2 = (y2 ^ (y2 >>14)) & 0x0000CCCC;  y2 = y2 ^ t2 ^ (t2 <<14); 
    
    t2 = (x & 0xF0F0F0F0) | ((y2 >> 4) & 0x0F0F0F0F); 
    y2 = ((x << 4) & 0xF0F0F0F0) | (y2 & 0x0F0F0F0F);    
    
    return ((y << 32) | t), ((y2 << 32) | t2)

            
    
# 865F1CA9 EB2470D3
# 07E15B82 3AD6FC49


# 2EF5C19A B468073D


# 0734C1AF DE6B2895
#          
# 7CE9215F B6D048A3
# 4A168F7C 30ED59B2
# 2FC156AD E8340B97
# F4589721 A30E6CDB
    
def test_for_fixed_points():
    state = bytearray(16)
    sboxes = (bytearray((8, 6, 5, 15, 1, 12, 10, 9, 14, 11, 2, 4, 7, 0, 13, 3)), 
              bytearray((0, 7, 14, 1, 5, 11, 8, 2, 3, 10, 13, 6, 15, 12, 4, 9)), # best one
              bytearray((2, 14, 15, 5, 12, 1, 9, 10, 11, 4, 6, 8, 0, 7, 3, 13)),
              bytearray((0, 7, 3, 4, 12, 1, 10, 15, 13, 14, 6, 11, 2, 8, 9, 5)),
              bytearray((7, 12, 14, 9, 2, 1, 5, 15, 11, 6, 13, 0, 4, 8, 10, 3)),
              bytearray((4, 10, 1, 6, 8, 15, 7, 12, 3, 0, 14, 13, 5, 9, 11, 2)),
              bytearray((2, 15, 12, 1, 5, 6, 10, 13, 14, 8, 3, 4, 0, 11, 9, 7)),
              bytearray((15, 4, 5, 8, 9, 7, 2, 1, 10, 3, 0, 14, 6, 12, 13, 11)))
        
    #for mapping_number, mapping in enumerate(sboxes):
    #    print "Mapping number: {}".format(mapping_number)
    #    assert len(set(mapping)) == 16, (sorted(mapping), mapping)
    #mapping = bytearray((0, 7, 14, 1, 5, 11, 8, 2, 3, 10, 13, 6, 15, 12, 4, 9))

    def shuffle_bytes(state):        
        #state[0] = state[0]
        temp = state[1]
        
        state[1] = state[7] 
        state[7] = state[2]    
        state[2] = state[14]    
        state[14] = state[4]
        state[4] = state[5]
        state[5] = state[11]
        state[11] = state[6]
        state[6] = state[8]
        state[8] = state[3]
        state[3] = temp
             
        temp = state[9]
        state[9] = state[10]
        state[10] = state[13]
        state[13] = state[12]
        state[12] = state[15]        
        state[15] = temp
        
    mapping = bytearray(range(16))
    shuffle_bytes(mapping)
    assert len(set(mapping)) == 16, [byte for byte in mapping]
    for rounds in range(256):
        for index in range(16):    
            for shift in range(8):
                state[index] = 1 << shift            
                state1, state2 = bytes_to_integer(state[:8]), bytes_to_integer(state[8:])
                assert format(state1, 'b').zfill(64).count('1') in (1, 0), format(state1, 'b').zfill(64)
                assert format(state2, 'b').zfill(64).count('1') in (1, 0), format(state2, 'b').zfill(64)
                
                for round in range(rounds):
                                            
                    state1, state2 = decorrelation_layer(state1, state2, mapping)
                #  assert format(state1, 'b').zfill(64).count('1') in (1, 0), format(state1, 'b').zfill(64)
                #  assert format(state2, 'b').zfill(64).count('1') in (1, 0), format(state2, 'b').zfill(64)
                    
                    _state = integer_to_bytes(state1, 8) + integer_to_bytes(state2, 8)
                    if _state[index] == 1 << shift:
                        print "Returned point in decorrelation layer at: {} {} after {} rounds".format(index, shift, rounds)
                    
                state[index] = 0            
                
if __name__ == "__main__":
    test_for_fixed_points()
    