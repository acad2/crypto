from crypto.utilities import rotate_left, rotate_right

def shuffle_bytes(_state):   
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
    
def test_invert_polarize():
    data = bytearray(range(16))
    print [byte for byte in data]
    polarize(data)
    print [byte for byte in data]
    polarize(data)
    print [byte for byte in data]
    assert data == bytearray(range(16)), data
    
def print_state(data, message):
    print message
    for byte in data:
        print format(byte, 'b').zfill(8)
        
def test_polarize():
    data = bytearray(8 for count in range(16))
    
    print_state(data, "Before:")
    polarize(data)
    print_state(data, "After: ")
    polarize(data)
    print_state(data, "After2:")
    polarize(data)
    print_state(data, "After3:")
    polarize(data)
    print_state(data, "After4:")
    
def test_polarize_shuffle():
    data = bytearray(range(16))    
    polarize(data)    
    print_state(data, "Before: ")
    outputs = []
    size = 5
    while True:                        
        shuffle_bytes(data)        
        polarize(data)                       
      #  print_state(data, "After: ")
      
        if data[-size:] not in outputs:
            outputs.append(data[-size:])
        else:
            break
    print len(outputs)
      
        
    
if __name__ == "__main__":
    #test_polarize()
    #test_invert_polarize()
    test_polarize_shuffle()
    
    