from pride.crypto.utilities import hamming_weight, xor_sum, rotate_right

def calculate_branch_number(substitution_diffusion_substitution_layer, datasize):
    raise NotImplementedError()
    min_branch_number = 0xFFFFFFFF            
    for difference in range(1, 256):
        data = bytearray(datasize)
        data2 = bytearray(datasize)        
        data2[0] = data[0] ^ difference
        substitution_diffusion_substitution_layer(data)
        substitution_diffusion_substitution_layer(data2)   
        
        output_difference = data2[0] ^ data[0]
        
        min_branch_number = min(hamming_weight(difference) + hamming_weight(output_difference), min_branch_number)
    return min_branch_number
    
def shuffle_bytes(_state, temp=list(range(16))):          
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
    
def polarize(data):
    output = bytearray(16)
    for index in range(8):    
        output[index] = 0
        for index2 in range(8):                      
            byte = data[index2]                                    
            output[index] |= ((byte & 1) << index2) & 255                             
            data[index2] = rotate_right(byte, 1)                                     
        
        output[index + 8] = rotate_right(data[index + 8], 1)  
    data[:16] = output[:16]
    
def diffusion_layer(data):
    polarize(data)
    shuffle_bytes(data)
    
from pride.crypto.designs.blockcipher.aes_procedures import S_BOX, subBytes, shiftRows, mixColumns
    
def substitution_layer(data):    
    for index, byte in enumerate(data):
        data[index] = S_BOX[byte]
       
def test_calculate_branch_number():    
    def test_method(data):        
        #    substitution_layer(data)        
        #    diffusion_layer(data)        
        #    substitution_layer(data)
        subBytes(data)
        shiftRows(data)
        mixColumns(data)
        subBytes(data)
        #print data
    print calculate_branch_number(test_method, 16)
    
if __name__ == "__main__":
    test_calculate_branch_number()
    