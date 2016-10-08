from crypto.utilities import xor_sum, rotate_left, xor_subroutine, modular_subtraction, rotate_right, words_to_bytes

def shuffle_bytes(_state, section, temp=list(range(16))):          
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
            
    _state[section] = temp[:]
           
def prp(data, key, mask=255, rotation_amount=5, bit_width=8, key_slice=slice(16, 32), data_slice=slice(0, 16), transpose=True):     
    if transpose:
        if key_slice is not None:
            shuffle_bytes(data, key_slice)
        shuffle_bytes(data, data_slice)       
    
    for index in reversed(range(len(data) - 1)):       
        left, right = data[index], data[index + 1]
        
        key ^= right                 
        right = rotate_left((right + key + index) & mask, rotation_amount, bit_width)                
        key ^= right
        
        key ^= left        
        left = (left + (right >> (bit_width / 2))) & mask                
        left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)                    
        key ^= left
        
        data[index], data[index + 1] = left, right                 

    right = data[0]
    key ^= right
    right = (right + key) & mask
    key ^= right
    
    left = data[1]
    key ^= left        
    left = (left + (right >> (bit_width / 2))) & mask                
    left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)                    
    key ^= left
    data[1] = left
    return key
        
def invert_prp(data, key, mask=255, rotation_amount=5, bit_width=8, transpose=False):           
    key ^= data[0]
    data[0] = (256 + (data[0] - key)) & mask
    key ^= data[0]
    
    for index in range(len(data) - 1):
        
        right = data[index + 1]
        left = data[index]
        
        key ^= left    
        left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)         
        left = (256 + (left - (right >> bit_width / 2))) & mask
        key ^= left;
        
        key ^= right;        
        right = (256 + (rotate_right(right, rotation_amount, bit_width) - key - index)) & mask 
        key ^= right;                               
                
        data[index + 1] = right;        
        data[index] = left;
    
    return key;      
            
def prf(data, key, mask=255, rotations=5, bit_width=8):      
    for index in range(len(data)):         
        new_byte = rotate_left((data[index] + key + index) & mask, rotations, bit_width)
        key ^= new_byte        
        data[index] = new_byte             
    
def xor_with_key(data, key):
    data_xor = 0
    for index, byte in enumerate(key):
        data[index] ^= byte
        data_xor ^= data[index]
    return data_xor
    
def stream_cipher(data, seed, key, size=(8, 255, 5), mode="encrypt"):     
    if mode == "encrypt":
        data_prp_function = prp
    else:
        data_prp_function = invert_prp
    key = list(key)
    seed = list(seed)
    state = seed + key
    key_material = list()       
    
    bit_width, mask, rotation_amount = size          
    block_count, extra = divmod(len(data), 16) 
    prf_state_xor = 0    
    
    state_xor = xor_sum(state)
    
    for block in range(block_count + 1 if extra else block_count):       
        state_xor = prp(state, state_xor, mask, rotation_amount, bit_width)
        prf_state_xor ^= state_xor                
        key_material.extend(state[0:16])    
    
    prf(key_material, prf_state_xor, mask, rotation_amount, bit_width)        
    
    data_xor = xor_with_key(data, key_material)        
    data_xor = data_prp_function(data, data_xor, mask, rotation_amount, bit_width, transpose=False)    
    xor_subroutine(data, key_material)
    
def test_prp_prf():
    data = bytearray(32)
    xor = prp(data, 0)    
    print data
    print [byte for byte in data]
    invert_prp(data, xor)
    print data
    print [byte for byte in data]
    
    #from differential import find_best_differential
    #from linear import calculate_linearity
    #for index in range(16):
    #    sbox = bytearray()        
    #    for byte in range(256):
    #        data = bytearray(32)
    #        data[15] = byte
    #        data[-2] = 1
    #        prp(data, byte)
    #        prf(data, xor_sum(data))
    #        sbox.append(data[index])     
    #    import os
    #    sbox = bytearray(os.urandom(256))
    #    from scratch import aes_s_box as sbox
    #    print "Calculating best differential/linearity for byte at index: {}...".format(index)        
    #    print find_best_differential(sbox)
    #    print calculate_linearity(sbox)
    
def test_streamcipher2():
    data = list(bytearray(16))
    key = bytearray(16)
    seed = bytearray(16)    
    size = (8, 255, 5)#(64, 0xFFFFFFFFFFFFFFFF, 40)
    data[1] = 1
    stream_cipher(data, key, seed, size)
    print words_to_bytes(data, size[0] / 8)
   # print [byte for byte in data]
    
    
    data2 = list(bytearray(16))
    data2[0] = 1
    stream_cipher(data2, key, seed, size, mode="encrypt")
    print words_to_bytes(data2, size[0] / 8)
   # print [byte for byte in data2]
        
if __name__ == "__main__":
    #test_prp_prf()
    test_streamcipher2()
    