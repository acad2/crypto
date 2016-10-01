def xor_sum(data):
    value = 0
    for byte in data:
        value ^= byte
    return value
    
def p_box(data):
    bits = ''.join(format(byte, 'b').zfill(8) for byte in data)
    return [int(bits[index::8], 2) for index in range(8)]
        
def shuffle(_state):
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
    replacement_subroutine(_state, temp)    
              
def encrypt(data, key, rounds=1, mask=((2 ** 8) - 1)):
    xor_subroutine(data, key)        
    for round in range(rounds):        
        for index, byte in enumerate(p_box(data[:8]) + (p_box(data[8:]))):
            data[index] = byte
        
        shuffle(data)
        round_key = xor_sum(data)    
        for index in reversed(range(16)):
            next_index = index - 1
            round_key ^= data[index] ^ data[next_index]
            
            right = (data[index] + round_key + key[index]) & mask
            left = (data[next_index] + (right >> 4)) & mask
            left ^= rotate_right(right, 5)
                        
            round_key ^= data[index] ^ data[next_index]
    return bytes(data)
    
def decrypt(data, key, rounds=1, mask=((2 ** 8) - 1)):
    round_key = xor_sum(data)
    
    for index in range(16):
        next_index = index - 1
        round_key ^= data[index] ^ data[next_index]
        left, right = data[index], data[next_index]
        
        left ^= rotate_right(right, 5)
        left = (mask + 1 + (left - right)) & 255
        right = (mask + 1 + (right - round_key - key[index]
        