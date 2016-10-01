from pride.crypto.utilities import rotate_left, rotate_right

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
    
def invert_shuffle_bytes(state):
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
    
def bit_mixing(data, start=0, direction=1):
    size = len(data)
    index = start
    for counter in range(size):
        left, right = data[index], data[(index + 1) % size]
        right ^= rotate_left(left, ((index + index + 1) % 256))
        data[index], data[(index + 1) % size] = left, right
        
        index += direction
           
def decorrelation_layer(data, start=0, direction=1):
    bit_mixing(data, start, direction)    
    shuffle_bytes(data)
    
def invert_decorrelation_layer(data):
    invert_shuffle_bytes(data)
    bit_mixing(data, len(data) - 1, -1)
        
def test_bit_mixing():
    data = bytearray(range(8))
    binary = lambda _data: ''.join(format(byte, 'b').zfill(8) for byte in _data)
    print binary(data)
    
    bit_mixing(data)
    print binary(data)
    
    bit_mixing(data, len(data) - 1, -1)
    print binary(data)
    
def test_decorrelation_layer():
    data = bytearray(range(16))
    
    binary = lambda _data: ''.join(format(byte, 'b').zfill(8) for byte in _data)
    print binary(data)
    print
    decorrelation_layer(data)
    print binary(data)
    print
    invert_decorrelation_layer(data)
    print binary(data)
    
if __name__ == "__main__":
    #test_bit_mixing()
    test_decorrelation_layer()
    