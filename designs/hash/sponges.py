import pride.crypto.designs.hash.sponge as sponge
from pride.crypto.utilities import xor_sum, rotate_left
from pride.crypto.analysis.metrics import test_hash_function    

def round_function(left, right, key, index, 
                   mask=255, rotation_amount=5, bit_width=8):        
    key ^= right                 
    right = rotate_left((right + key + index) & mask, rotation_amount, bit_width)                
    key ^= right
    
    key ^= left        
    left = (left + (right >> (bit_width / 2))) & mask                
    left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)                    
    key ^= left
         
    return left, right, key    
    
def shuffle_bytes(_state, state_slice, temp=list(range(16)), offset=0):          
    temp[7] = _state[0 + offset] 
    temp[12] = _state[1 + offset]
    temp[14] = _state[2 + offset]
    temp[9] = _state[3 + offset]
    temp[2] = _state[4 + offset]
    temp[1] = _state[5 + offset]
    temp[5] = _state[6 + offset]
    temp[15] = _state[7 + offset]
    temp[11] = _state[8 + offset]
    temp[6] = _state[9 + offset]
    temp[13] = _state[10 + offset]
    temp[0] = _state[11 + offset]
    temp[4] = _state[12 + offset]
    temp[8] = _state[13 + offset]
    temp[10] = _state[14 + offset]
    temp[3] = _state[15 + offset]
            
    _state[state_slice] = temp[:]
    
def permute(state, rate_section=slice(0, 16), capacity_section=slice(16, 32), mask=255):    
    for round in range(2):
        shuffle_bytes(state, capacity_section, offset=capacity_section.stop - capacity_section.start)
        half_size = len(state) / 2
        
        capacity_xor = xor_sum(state[capacity_section])
        # stir the capacity
        for index in range(half_size, half_size * 2):
            left, right = state[index - 1], state[index]        
            left, right, capacity_xor = round_function(left, right, capacity_xor, index)        
            state[index - 1], state[index] = left, right
        
        shuffle_bytes(state, rate_section)
        rate_xor = xor_sum(state[rate_section])
        for index in range(half_size):
            rate_byte = index
            capacity_byte = index + half_size
            
            # mix the capacity and the rate
            left, right = state[rate_byte], state[capacity_byte]
            left, right, rate_xor = round_function(left, right, (rate_xor + capacity_xor) & mask, index)        
            state[rate_byte], state[capacity_byte] = left, right
            
            # stir the rate    
            left, right = state[rate_byte - 1], state[rate_byte]
            left, right, rate_xor = round_function(left, right, rate_xor, rate_byte)
            state[rate_byte - 1], state[rate_byte] = left, right              
    # print "\nFinished permuting state: ", state
    
permute3_sponge = sponge.sponge_factory(permute, output_size=32, rate=slice(0, 16), capacity=slice(16, 32))
    
def shuffle_bytes_optimized(_state):
    temp = _state[0] # copied from pride.crypto.designs.blockcipher.blockcipher3optimized.cpp
    
    _state[0] = _state[11];
    _state[11] = _state[8];
    _state[8] = _state[13];
    _state[13] = _state[10];
    _state[10] = _state[14];
    _state[14] = _state[2];
    _state[2] = _state[4];
    _state[4] = _state[12];
    _state[12] = _state[1];
    _state[1] = _state[5];
    _state[5] = _state[6];
    _state[6] = _state[9];
    _state[9] = _state[3];
    _state[3] = _state[15];
    _state[15] = _state[7];
    _state[7] = temp;
    
def permute4(state):
    shuffle_bytes_optimized(state)
    state_xor = xor_sum(state)
    for index in range(len(state)):
        left, right = state[index - 1], state[index]
        state_xor ^= right
        left, right, state_xor = round_function(left, right, state_xor, index)
        state[index - 1], state[index] = left, right
        
permute4_sponge = sponge.sponge_factory(permute4, output_size=32, rate=slice(0, 8), capacity=slice(8, 16))
        
def test_permute3_sponge():       
    test_hash_function(permute3_sponge, avalanche_test=False)
    
def test_permute4_sponge():
    test_hash_function(permute4_sponge, avalanche_test=False)
    
if __name__ == "__main__":
    #test_permute3_sponge()
    test_permute4_sponge()
    