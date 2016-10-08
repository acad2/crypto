from crypto.utilities import xor_sum, rotate_left, rotate_right, slide, xor_subroutine, integer_to_bytes, bytes_to_words, words_to_bytes
    
def shuffle_bytes(_state):

    temp = _state[0]

    _state[0] = _state[11]
    _state[11] = _state[8]
    _state[8] = _state[13]
    _state[13] = _state[10]
    _state[10] = _state[14]
    _state[14] = _state[2]
    _state[2] = _state[4]
    _state[4] = _state[12]
    _state[12] = _state[1]
    _state[1] = _state[5]
    _state[5] = _state[6]
    _state[6] = _state[9]
    _state[9] = _state[3]
    _state[3] = _state[15]
    _state[15] = _state[7]
    _state[7] = temp
    
def invert_shuffle_bytes(state, temp=list(range(16))):       
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
    
def bit_mixing(data, start=0, direction=1, bit_width=8):
    size = len(data)
    index = start
    key = 0
    for counter in range(size):
        data[(index + 1) % size] ^= rotate_left(data[index], (index % bit_width), bit_width)
        key ^= data[(index + 1) % size]
        index += direction
    return key
    
def decorrelation_layer(data, bit_width):
    key = bit_mixing(data, 0, 1, bit_width)    
    shuffle_bytes(data)
    return key
    
def prp(data, key, mask=255, rotation_amount=5, bit_width=8):    
    key = decorrelation_layer(data, bit_width)
    for index in range(len(data)):
        byte = data[index]
        key ^= byte                          
        data[index] = rotate_left((byte + key + index) & mask, rotation_amount, bit_width)        
        key ^= data[index]                    
    return key
        
def prf(data, key, mask=255, rotation_amount=5, bit_width=8):    
    for index in range(len(data)):        
        new_byte = rotate_left((data[index] + key + index) & mask, rotation_amount, bit_width)    
        key ^= new_byte
        data[index] = new_byte            
            
def xor_subroutine2(data, key):
    data_xor = 0
    for index, byte in enumerate(key):
        data[index] ^= byte
        data_xor ^= data[index]
    return data_xor
    
def encrypt(data, key, rounds=1, size=(8, 255, 5)):     
    key = key[:]
    round_key = list(bytearray(len(key)))
    key_xor = xor_sum(key)
    data_xor = xor_sum(data)
    bit_width, mask, rotation_amount = size    
    
    for round in range(rounds):      
        
        key_xor = prp(key, key_xor, mask, rotation_amount, bit_width) # generate key        
        round_key[:] = key[:] # maintain invertible keyschedule
        
        prf(round_key, key_xor, mask, rotation_amount, bit_width) # one way extraction: class 2B keyschedule
        
        data_xor = xor_subroutine2(data, round_key) # pre-whitening                   
        data_xor = prp(data, xor_sum(data), mask, rotation_amount, bit_width) # high diffusion prp     
        data_xor = xor_subroutine2(data, round_key) # post_whitening

def invert_decorrelation_layer(data, bit_width):
    invert_shuffle_bytes(data)
    return bit_mixing(data, len(data) - 1, -1, bit_width)
    
def invert_prp(data, key, mask=255, rotation_amount=5, bit_width=8):    
    for index in reversed(range(len(data))):
        byte = data[index]
        key ^= byte                
        data[index] = ((mask + 1) + (rotate_right(byte, rotation_amount, bit_width) - key - index)) & mask        
        key ^= data[index]
    return invert_decorrelation_layer(data, bit_width)
              
def decrypt(data, key, rounds=1, size=(8, 255, 5)):
    round_keys = []
    key = key[:]
    round_key = list(bytearray(len(key)))
    key_xor = xor_sum(key)
    data_xor = xor_sum(data)
    bit_width, mask, rotation_amount = size
    
    for round in range(rounds):
        key_xor = prp(key, key_xor, mask, rotation_amount, bit_width)
        round_key[:] = key[:]
        prf(round_key, key_xor, mask, rotation_amount, bit_width)        
        round_keys.append(round_key[:])
      
    for round in reversed(range(rounds)):
        round_key = round_keys[round]

        data_xor = xor_subroutine2(data, round_key)                      
        data_xor = invert_prp(data, xor_sum(data), mask, rotation_amount, bit_width)               
        data_xor = xor_subroutine2(data, round_key)               
 
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
    
def test_encrypt_decrypt():
    byte_size = 8
    data = bytearray(16 * byte_size)    
    key = bytearray(16 * byte_size)
    data[-1] = 1
    rounds = 16
    
    bit_size = byte_size * 8
    size = (bit_size, ((2 ** bit_size) - 1), bit_size - (3 * byte_size))
    data = bytes_to_words(data, byte_size)    
    key = bytes_to_words(key, byte_size)
    plaintext = data[:]

    encrypt(data, key, rounds, size)        
    print ''.join(bytes(integer_to_bytes(block, byte_size)) for block in data)
    print [byte for byte in data]
    
    decrypt(data, key, rounds, size)
    assert data == plaintext, (data, plaintext)
        
def test_invert_prp():
    data = bytearray("Testing!" * 2)
    data_xor = prp(data, xor_sum(data))
    invert_prp(data, data_xor)
    assert data == "Testing!" * 2, data
    
def test_prp_cycle_length():
    from crypto.utilities import find_cycle_length_subroutine
    print len(find_cycle_length_subroutine(prp, bytearray("\x00\x01\x00"), 3))
    
def test_prp_metrics():
    from crypto.utilities import slide, xor_subroutine
    def test_hash(data):   
        size = len(data)
        data = data + ("\x00" * (16 - size))
        if size == 16:            
            output = bytearray(data)
            for round in range(1):
                prp(output, xor_sum(output))            
        else:
            output = bytearray(16)
            for block in slide(bytearray(data), 16):            
                prp(block, xor_sum(block))
                xor_subroutine(output, block)        
        return bytes(output)
        
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(test_hash)
        
def test_prp_s_box():  
    import collections
    
    s_box = collections.defaultdict(bytearray)
    rounds = 4
    for ending in range(256):
        data = bytearray(16)
        data[-1] = ending
        for round in range(rounds):            
            prp(data, xor_sum(data))                  
            s_box[round].append(data[-2])
    
    from differential import find_best_differential
    from linear import calculate_linearity

    for round in range(rounds):
        _s_box = s_box[round]
        print "Best differential after {} rounds: ".format(round + 1), find_best_differential(_s_box)
        print "Linearity after {} rounds: ".format(round + 1), calculate_linearity(_s_box)
    
def test_prf():    
    def test_hash(data):
        output = bytearray(16)        
        key = xor_sum(bytearray(data[:16]))
        for block in slide(bytearray(data), 16):            
            prf(block, xor_sum(block))            
            xor_subroutine(output, block)        
        return bytes(output)
        
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(test_hash)
        
def test_prp():       
    data = list(bytearray(16))
    data[-1] = 1
    
    data2 = list(bytearray(16))
    data2[-2] = 1    
    
    data3 = list(bytearray(16))
    data3[-2] = 2
    
    wordsize = 64
    size = (((2 ** wordsize) - 1), 40, wordsize)
    data_xor = prp(data, xor_sum(data), *size)
    prf(data, data_xor, *size)          
    #prp(data, xor_sum(data), *size)
    
    data_xor = prp(data2, xor_sum(data2), *size)
    prf(data2, data_xor, *size)    
    #prp(data2, xor_sum(data), *size)
    
    data_xor = prp(data3, xor_sum(data3), *size)
    prf(data3, data_xor, *size)    
    #prp(data3, xor_sum(data), *size)
   
    binary = lambda _data: ''.join(format(byte, 'b').zfill(wordsize) for byte in _data)  
    _bytes = lambda _data: ''.join(bytes(integer_to_bytes(word, wordsize / 8)) for word in _data)
    #print binary(data).count('1') / float(wordsize * 16)
    #print 
    #print binary(data2).count('1') / float(wordsize * 16) 
    #print 
    #print binary(data3).count('1') / float(wordsize * 16) 
    
    print _bytes(data)
    print
    print _bytes(data2)
    print
    print _bytes(data3)
    
if __name__ == "__main__":
    #test_invert_prp()
    #test_decorrelation_layer()
    #test_prp_cycle_length()
    #test_prp_metrics()    
    #test_prp_s_box()
    #test_encrypt_decrypt()
    #test_prf()    
    test_prp()
    