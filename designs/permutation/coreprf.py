from pride.crypto.utilities import bytes_to_integer, integer_to_bytes, rotate_left, xor_subroutine, slide

def decorrelation_layer(state, state2):
    # top half   
    # the strange ordering applies shuffle_bytes before the bit permutation
 
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
            
    state =  (y << 32) | t        
    state2 = (y2 << 32) | t2          
    return state, state2
    
def prp(slice1, slice2, key, index, mask=0xFFFFFFFFFFFFFFFF, rotations=41, bit_width=64):
    key ^= slice1 ^ slice2    
    slice1 = rotate_left((slice1 + key + index) & mask, rotations, bit_width=bit_width)    

    slice2 = (slice2 + (slice1 >> 32)) & mask    
    slice2 ^= rotate_left(slice1, index, bit_width=bit_width) 
    key ^= slice1 ^ slice2
            
    return slice1, slice2, key
    
def unpack_state(state):
    a, b, c, d = (bytes_to_integer(state[offset:offset + 8]) for offset in range(0, 32, 8))      
    return a, b, c, d
    
def pack_state(a, b, c, d, data_xora, data_xorb, data_xorc, data_xord):
    return (integer_to_bytes(a, 8) + integer_to_bytes(b, 8) + integer_to_bytes(c, 8) + integer_to_bytes(d, 8) +
            integer_to_bytes(data_xora, 8) + integer_to_bytes(data_xorb, 8) + integer_to_bytes(data_xorc, 8) + integer_to_bytes(data_xord, 8))    
            
def initialize_state(state):    
    a, b, c, d = unpack_state(state)
    data_xor = a ^ b ^ c ^ d 
    data_xora = data_xorb = data_xorc = data_xord = data_xor # set them all to the same, initially
    a, c = decorrelation_layer(a, c) # polarize state
    return pack_state(a, b, c, d, data_xora, data_xorb, data_xorc, data_xord)
    
def core(state, rounds):    
    a, b, c, d = unpack_state(state[:32])
    data_xora, data_xorb, data_xorc, data_xord = unpack_state(state[32:64])
    for round in range(rounds):
        a, b = decorrelation_layer(a, b)                
        c, d = decorrelation_layer(c, d)
                
        b, c = decorrelation_layer(b, c)        
        d, a = decorrelation_layer(d, a)    
            
        a, b, data_xora = prp(a, b, data_xora, round)                                                   
        c, d, data_xorc = prp(c, d, data_xorc, round + 2)                       
        
        b, c, data_xorb = prp(b, c, data_xorb, round + 1)                
        d, a, data_xord = prp(d, a, data_xord, round + 3)  
    state[:] = pack_state(a, b, c, d, data_xora, data_xorb, data_xorc, data_xord)                
           
def _setup_state_encrypt(key, nonce, rounds):    
    # absorb key    
    assert 16 <= len(key) <= 32
    state = initialize_state(bytearray(key))
    core(state, rounds)                
    print sum(format(byte, 'b').count('1') for byte in state)
    # absorb nonce
    assert 8 <= len(nonce) <= 32
    nonce = bytearray(nonce)
    xor_subroutine(state, nonce)
    state[:len(nonce)] = nonce
    core(state, rounds)
    print sum(format(byte, 'b').count('1') for byte in state)
    return state
    
def encrypt(data, key, nonce, rounds=1):       
    state = _setup_state_encrypt(key, nonce, rounds)
        
    blocksize = 32
    ciphertext = bytearray()
    for index, block in enumerate(slide(bytearray(data), 32)):         
        xor_subroutine(block, state[:32])       
        ciphertext.extend(block)
        
        state[index * blocksize:(index * blocksize) + len(block)] = block           
        core(state, rounds)
        
    return state[:32], ciphertext
    
def decrypt(tag, data, key, nonce, rounds=1):    
    state = _setup_state_encrypt(key, nonce, rounds)
        
    blocksize = 32
    plaintext = bytearray()    
    for index, block in enumerate(slide(bytearray(data), 32)):
        _block = block[:]
        xor_subroutine(block, state[:32])        
        plaintext.extend(block)
        
        state[index * blocksize:(index * blocksize) + len(block)] = _block        
        core(state, rounds)        
    if tag != state[:32]:
        return -1 # raising exceptions takes notably longer then not raising one in python
    else:
        return plaintext
        
def test_encrypt_decrypt():
    plaintext = "\x00" * 32
    key = "\x00" * 32
    nonce = "\x00" * 32
    rounds = 1
    tag, ciphertext = encrypt(plaintext, key, nonce, rounds)   
    _plaintext = decrypt(tag, ciphertext, key, nonce, rounds)
    
    assert plaintext == _plaintext, (plaintext, _plaintext)
    
def _print_active_sbox_info(function, function_args, bit_width=64, 
                            active_bytes=True, active_bits=True,
                            bit_strings=True):    
    output = function(*function_args)      
    bits = [' '.join(slide(format(word, 'b').zfill(bit_width), 8)) for word in output]
    
    if active_bytes:
        for bit_string in bits:
            actives = [(index, byte) for index, byte in enumerate(bit_string.split()) if '1' in byte]
            print "Non-zero bytes: {} {}".format(len(actives), [index for index, byte in actives])
        
    if bit_strings:
        for word in bits:
            print word

    if active_bits:
        for word in bits:
            actives = [index for index, bit in enumerate(''.join(word.split())) if bit == '1']
            print "Set bits: {} {}".format(len(actives), actives)
    return output
    
def test_prp_active_sboxes():    
    bit_strings = False
    rounds = 4
  #  def test_function(top, bottom, key, index):        
  #      
  #      decorrelation_layer(top, bottom)
        
    top = 0
    bottom = 1
    key = top ^ bottom
    
    from pride.crypto.designs.blockcipher.aes_procedures import mixColumns
    
    def prp_8_bit(top, bottom, key, index):
        return prp(top, bottom, key, index, mask=0xFF, rotations=5, bit_width=8)
        
    def prp_finer_grain(state, key):
        for index in reversed(range(1, 16)):
            left, right = state[(index - 1)], state[index]
            state[(index - 1)], state[index], key = prp_8_bit(left, right, key, index)            
        
        left, right = state[15], state[0]
        state[15], state[0], key = prp_8_bit(left, right, key, 0)                     
        return key
    
    def test_function(top, bottom, key, index):
        top, bottom = decorrelation_layer(top, bottom)
        state = integer_to_bytes(top, 8) + integer_to_bytes(bottom, 8)
       # mixColumns(state)
        
        key = prp_finer_grain(state, key)
        top = bytes_to_integer(state[:8])
        bottom = bytes_to_integer(state[8:])
        return top, bottom, key
        #return prp(top, bottom, key, index)
        
    for index in range(rounds):       
        print "\nAfter round: {}".format(index)     
        bottom, top, key = _print_active_sbox_info(test_function, (top, bottom, key, index), bit_strings=bit_strings)                                        
        index += 1      
    
    print "\nInput difference\n" + "-" * 20
    top =  0    
    bottom = 2 << 1
    key = top ^ bottom   
        
    for index in range(rounds):                    
        print "\nAfter round: {}".format(index)          
        
        bottom, top, key = _print_active_sbox_info(test_function, (top, bottom, key, index), bit_strings=bit_strings)
        index += 1
            
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    #test_prp_active_sboxes()
    