from pride.crypto.utilities import slide

def rotl16(word, amount, _mask=0xFFFF):
    amount %= 16
    return ((word << amount) | (word >> (16 - amount))) & _mask 
  
def rotl64(word, amount, _mask=0xFFFFFFFFFFFFFFFF):
    amount %= 64
    return ((word << amount) | (word >> (64 - amount))) & _mask 
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))  
    
def shuffle_and_shift(a, b, c, d, word_0=0xFFFF000000000000, word_1=0x0000FFFF00000000, word_2=0x00000000FFFF0000, word_3=0x000000000000FFFF):   
    temp = a
    tempb = b
    tempc = c
    register0 = (rotl16((d & word_0)    >> 48, 0 ) << 48) | (rotl16((b & word_3)    << 0 , 1 ) << 32) | (rotl16((b & word_2)    >> 16, 2 ) << 16) | rotl16((c & word_0) >> 48, 3 )
    register1 = (rotl16((temp & word_3) >> 0 , 4 ) << 48) | (rotl16((c & word_2)    >> 16, 5 ) << 32) | (rotl16((b & word_1)    >> 32, 6 ) << 16) | rotl16((d & word_3) >> 0 , 7 )
    register2 = (rotl16((c & word_3)    >> 0 , 8 ) << 48) | (rotl16((d & word_1)    >> 32, 9 ) << 32) | (rotl16((temp & word_0) >> 48, 10) << 16) | rotl16((d & word_2) >> 16, 11)
    register3 = (rotl16((tempb & word_0)>> 48, 12) << 48) | (rotl16((temp & word_1) >> 32, 13) << 32) | (rotl16((tempc & word_1)>> 32, 14) << 16) | rotl16((temp & word_2) >> 16, 15)
    return register0, register1, register2, register3          
      
def shuffle_bytes_and_shift_rows(_state):

    temp = _state[0]

    _state[0]  = rotl16(_state[11], 0 )
    _state[11] = rotl16(_state[8] , 11)
    _state[8]  = rotl16(_state[13], 8 )
    _state[13] = rotl16(_state[10], 13)
    _state[10] = rotl16(_state[14], 10)
    _state[14] = rotl16(_state[2] , 14)
    _state[2]  = rotl16(_state[4] , 2 )
    _state[4]  = rotl16(_state[12], 4 )
    _state[12] = rotl16(_state[1] , 12)
    _state[1]  = rotl16(_state[5] , 1 )
    _state[5]  = rotl16(_state[6] , 5 )
    _state[6]  = rotl16(_state[9] , 6 )
    _state[9]  = rotl16(_state[3] , 9 )
    _state[3]  = rotl16(_state[15], 3 )
    _state[15] = rotl16(_state[7] , 15)
    _state[7]  = rotl16(temp      , 7 )

    
def mix_quarters(a, b, c, d):   
    a ^= choice(b, c, d)
    b ^= choice(c, d, a)
    c ^= choice(d, a, b)
    d ^= choice(a, b, c)   
    return a, b, c, d
  
def shuffle_mix(a, b, c, d):    
    a, b, c, d = shuffle_and_shift(a, b, c, d)
    a, b, c, d = mix_quarters(a, b, c, d)
    return a, b, c, d
 
from pride.crypto.designs.ciphercomponents import mixRow, rotate_left
from pride.crypto.utilities import integer_to_bytes    
    
def invert(a):
    return ~a & 0xFFFFFFFFFFFFFFFF
    
def shift_rows(a, b, c, d, MASK16=0xFFFF):           
    #a = (rotl16((a >> 48) & MASK16, 0) << 48) | (rotl16((a >> 32) & MASK16, 0) << 32) | (rotl16((a >> 16) & MASK16, 0) << 16) | (rotl16((a >> 0 ) & MASK16, 0) << 0 )
    #b = (rotl16((b >> 48) & MASK16, 1) << 48) | (rotl16((b >> 32) & MASK16, 1) << 32) | (rotl16((b >> 16) & MASK16, 1) << 16) | (rotl16((b >> 0 ) & MASK16, 1) << 0 )    
    #c = (rotl16((c >> 48) & MASK16, 2) << 48) | (rotl16((c >> 32) & MASK16, 2) << 32) | (rotl16((c >> 16) & MASK16, 2) << 16) | (rotl16((c >> 0 ) & MASK16, 2) << 0 )    
    #d = (rotl16((d >> 48) & MASK16, 3) << 48) | (rotl16((d >> 32) & MASK16, 3) << 32) | (rotl16((d >> 16) & MASK16, 3) << 16) | (rotl16((d >> 0 ) & MASK16, 3) << 0 )  

    # rotate each row of a 16x16 matrix of bits by row number % 4
    
    a = (rotl16((a >> 48) & MASK16, 0) << 48) | (rotl16((a >> 32) & MASK16, 1) << 32) | (rotl16((a >> 16) & MASK16, 2) << 16) | (rotl16((a >> 0 ) & MASK16, 3) << 0 )
    b = (rotl16((b >> 48) & MASK16, 0) << 48) | (rotl16((b >> 32) & MASK16, 1) << 32) | (rotl16((b >> 16) & MASK16, 2) << 16) | (rotl16((b >> 0 ) & MASK16, 3) << 0 )
    c = (rotl16((c >> 48) & MASK16, 0) << 48) | (rotl16((c >> 32) & MASK16, 1) << 32) | (rotl16((c >> 16) & MASK16, 2) << 16) | (rotl16((c >> 0 ) & MASK16, 3) << 0 )
    d = (rotl16((d >> 48) & MASK16, 0) << 48) | (rotl16((d >> 32) & MASK16, 1) << 32) | (rotl16((d >> 16) & MASK16, 2) << 16) | (rotl16((d >> 0 ) & MASK16, 3) << 0 )
   
    
    a = rotl64(a, 0 ) # inter-row mixing
    b = rotl64(b, 16)
    c = rotl64(c, 32)
    d = rotl64(d, 48)
    return b, c, d, a
    
def test_shift_rows():
    from pride.crypto.analysis.visualization import test_4x64_function
    test_4x64_function(shift_rows, [1 | (1 << 16) | (1 << 32) | (1 << 48) for count in range(4)])            
            
def _test_mixer(a, b, c, d, mask=0xFFFFFFFFFFFFFFFF):     
    a = rotl64((a + (b ^ c ^ d)) & mask, 1)
    b = rotl64((b + (a ^ c ^ d)) & mask, 3)
    c = rotl64((c + (a ^ b ^ d)) & mask, 5)
    d = rotl64((d + (a ^ b ^ c)) & mask, 7)    
    
    a = rotl64(a ^ choice(b, c, d), 11)
    b = rotl64(b ^ choice(c, d, a), 17)
    c = rotl64(c ^ choice(d, a, b), 23)
    d = rotl64(d ^ choice(a, b, c), 29)
    
    return a, b, c, d    
    
def test_test_mixer():
    from pride.crypto.analysis.visualization import test_4x64_function, print_state_4x64_256_as_4x64
    test_4x64_function(_test_mixer, (0, 0, 0, 1 << 1), print_state_4x64_256_as_4x64)# [1 | (1 << 16) | (1 << 32) | (1 << 48) for count in range(4)])
    
def test_round_differentials():
    rounds = 2
    sboxes = dict()
    for sbox_entry in range(256):
        a, b, c, d = 0, 0, 0, sbox_entry                          
        for round in range(rounds):
            a, b, c, d = _test_mixer(a, b, c, d)
        
        
        #print format(d, 'b').zfill(64)        
        for word in "abcd":
            for shift in reversed(range(0, 64, 8)): 
                _word = locals()[word]
                try:
                    sboxes[(word, shift)].append((_word >> shift) & 255)                    
                except KeyError:                                        
                    sboxes[(word, shift)] = bytearray()
                    sboxes[(word, shift)].append((_word >> shift) & 255)
                
    from cryptanalysis import summarize_sbox
    
    for sbox in sboxes.values():                
        #print type(sbox), len(sbox), sbox
        summarize_sbox(sbox)
        
    
def print_state_4x64(inputs_4x64):    
    for word in inputs_4x64:
        print '\n'.join(slide(format(word, 'b').zfill(64), 16))
            
def test_shuffle_and_shift():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]   
    inputs[0] = 1
    print("Testing shuffle and shift: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = shuffle_and_shift(*inputs)
        print("\n")
        print_state_4x64(inputs)  
        
def test_shuffle_mix():
    inputs = [1 | (1 << 16) | (1 << 32) | (1 << 48), 0, 0, 0]               
    print("Testing shuffle mix: ")
    print_state_4x64(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = shuffle_mix(*inputs)
        print("\n")
        print_state_4x64(inputs)  

if __name__ == "__main__":
    #test_shuffle_mix()
    #test_round_differentials()
    #test_shift_rows()
    test_test_mixer()#
    