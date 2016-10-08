from crypto.utilities import xor_subroutine, xor_sum, rotate_left, rotate_right

def bit_transposition(self):
    output = bytearray(16)
    for index in range(8):
        output[index] = 0
        for index2 in range(8):            
            byte = state[index2]
            output[index] |= ((byte & 1) << index2) & 255
            state[index2] = rotate_right(byte, 1)        
        
        output[index + 8] = rotate_left(state[index + 8], 1)
    
    state[:] = output[:]    
        
def p_box_half(state, temp=bytearray(8)):    
    temp[0] = ((state[0] & 1) | ((state[1] & 1) << 1) | ((state[2] & 1) << 2) | ((state[3] & 1) << 3) |
              ((state[4] & 1) << 4) | ((state[5] & 1) << 5) | ((state[6] & 1) << 6) | ((state[7] & 1) << 7))
    
    temp[1] = (((state[0] & 2) >> 1) | (state[1] & 2) | ((state[2] & 2) << 1) | ((state[3] & 2) << 2) |
               ((state[4] & 2) << 3) | ((state[5] & 2) << 4) | ((state[6] & 2) << 5) | ((state[7] & 2) << 6))
              
    temp[2] = (((state[0] & 4) >> 2) | ((state[1] & 4) >> 1) | (state[2] & 4) | ((state[3] & 4) << 1) |
               ((state[4] & 4) << 2) | ((state[5] & 4) << 3) | ((state[6] & 4) << 4) | ((state[7] & 4) << 5))              
    
    temp[3] = (((state[0] & 8) >> 3)| ((state[1] & 8) >> 2) | ((state[2] & 8) >> 1) | (state[3] & 8) |
               ((state[4] & 8) << 1) | ((state[5] & 8) << 2) | ((state[6] & 8) << 3) | ((state[7] & 8) << 4))

    temp[4] = (((state[0] & 16) >> 4) | ((state[1] & 16) >> 3) | ((state[2] & 16) >> 2) | ((state[3] & 16) >> 1) |
                (state[4] & 16) | ((state[5] & 16) << 1) | ((state[6] & 16) << 2) | ((state[7] & 16) << 3))

    temp[5] = (((state[0] & 32) >> 5) | ((state[1] & 32) >> 4) | ((state[2] & 32) >> 3) | ((state[3] & 32) >> 2) |
               ((state[4] & 32) >> 1) | (state[5] & 32) | ((state[6] & 32) << 1) | ((state[7] & 32) << 2))

    temp[6] = (((state[0] & 64) >> 6) | ((state[1] & 64) >> 5) | ((state[2] & 64) >> 4) | ((state[3] & 64) >> 3) |
               ((state[4] & 64) >> 2) | ((state[5] & 64) >> 1) | (state[6] & 64) | ((state[7] & 64) << 1))
              
    temp[7] = (((state[0] & 128) >> 7) | ((state[1] & 128) >> 6) | ((state[2] & 128) >> 5) | ((state[3] & 128) >> 4) |
               ((state[4] & 128) >> 3) | ((state[5] & 128) >> 2) | ((state[6] & 128) >> 1) | (state[7] & 128))   
    state[:8] = temp[:]
   
def p_box(state, temp=bytearray(16)):  
    #0 0 0 0 0 0 0 0 # state[
    #0 0 0 0 0 0 0 0  
    #0 0 0 0 0 0 0 0    
    #0 0 0 0 0 0 0 0    
    #0 0 0 0 0 0 0 0
    #0 0 0 0 0 0 0 0    
    #0 0 0 0 0 0 0 0
    
    #(& 1) >> index
    #   (& 2) >> -1 + index
    #     (& 4) >> -2 + index 
        
    temp[0] = ((state[0] & 1) | ((state[1] & 1) << 1) | ((state[2] & 1) << 2) | ((state[3] & 1) << 3) |
              ((state[4] & 1) << 4) | ((state[5] & 1) << 5) | ((state[6] & 1) << 6) | ((state[7] & 1) << 7))
    
    temp[1] = (((state[0] & 2) >> 1) | (state[1] & 2) | ((state[2] & 2) << 1) | ((state[3] & 2) << 2) |
               ((state[4] & 2) << 3) | ((state[5] & 2) << 4) | ((state[6] & 2) << 5) | ((state[7] & 2) << 6))
              
    temp[2] = (((state[0] & 4) >> 2) | ((state[1] & 4) >> 1) | (state[2] & 4) | ((state[3] & 4) << 1) |
               ((state[4] & 4) << 2) | ((state[5] & 4) << 3) | ((state[6] & 4) << 4) | ((state[7] & 4) << 5))              
    
    temp[3] = (((state[0] & 8) >> 3)| ((state[1] & 8) >> 2) | ((state[2] & 8) >> 1) | (state[3] & 8) |
               ((state[4] & 8) << 1) | ((state[5] & 8) << 2) | ((state[6] & 8) << 3) | ((state[7] & 8) << 4))

    temp[4] = (((state[0] & 16) >> 4) | ((state[1] & 16) >> 3) | ((state[2] & 16) >> 2) | ((state[3] & 16) >> 1) |
                (state[4] & 16) | ((state[5] & 16) << 1) | ((state[6] & 16) << 2) | ((state[7] & 16) << 3))

    temp[5] = (((state[0] & 32) >> 5) | ((state[1] & 32) >> 4) | ((state[2] & 32) >> 3) | ((state[3] & 32) >> 2) |
               ((state[4] & 32) >> 1) | (state[5] & 32) | ((state[6] & 32) << 1) | ((state[7] & 32) << 2))

    temp[6] = (((state[0] & 64) >> 6) | ((state[1] & 64) >> 5) | ((state[2] & 64) >> 4) | ((state[3] & 64) >> 3) |
               ((state[4] & 64) >> 2) | ((state[5] & 64) >> 1) | (state[6] & 64) | ((state[7] & 64) << 1))
              
    temp[7] = (((state[0] & 128) >> 7) | ((state[1] & 128) >> 6) | ((state[2] & 128) >> 5) | ((state[3] & 128) >> 4) |
               ((state[4] & 128) >> 3) | ((state[5] & 128) >> 2) | ((state[6] & 128) >> 1) | (state[7] & 128))           
              
              
    temp[8] = ((state[8] & 1) | ((state[9] & 1) << 1) | ((state[10] & 1) << 2) | ((state[11] & 1) << 3) |
              ((state[12] & 1) << 4) | ((state[13] & 1) << 5) | ((state[14] & 1) << 6) | ((state[15] & 1) << 7))
    
    temp[9] = (((state[8] & 2) >> 1) | (state[9] & 2) | ((state[10] & 2) << 1) | ((state[11] & 2) << 2) |
               ((state[12] & 2) << 3) | ((state[13] & 2) << 4) | ((state[14] & 2) << 5) | ((state[15] & 2) << 6))
              
    temp[10] = (((state[8] & 4) >> 2) | ((state[9] & 4) >> 1) | (state[10] & 4) | ((state[11] & 4) << 1) |
               ((state[12] & 4) << 2) | ((state[13] & 4) << 3) | ((state[14] & 4) << 4) | ((state[15] & 4) << 5))              
    
    temp[11] = (((state[8] & 8) >> 3)| ((state[9] & 8) >> 2) | ((state[10] & 8) >> 1) | (state[11] & 8) |
               ((state[12] & 8) << 1) | ((state[13] & 8) << 2) | ((state[14] & 8) << 3) | ((state[15] & 8) << 4))

    temp[12] = (((state[8] & 16) >> 4) | ((state[9] & 16) >> 3) | ((state[10] & 16) >> 2) | ((state[11] & 16) >> 1) |
                (state[12] & 16) | ((state[13] & 16) << 1) | ((state[14] & 16) << 2) | ((state[15] & 16) << 3))

    temp[13] = (((state[8] & 32) >> 5) | ((state[9] & 32) >> 4) | ((state[10] & 32) >> 3) | ((state[11] & 32) >> 2) |
               ((state[12] & 32) >> 1) | (state[13] & 32) | ((state[14] & 32) << 1) | ((state[15] & 32) << 2))

    temp[14] = (((state[8] & 64) >> 6) | ((state[9] & 64) >> 5) | ((state[10] & 64) >> 4) | ((state[11] & 64) >> 3) |
               ((state[12] & 64) >> 2) | ((state[13] & 64) >> 1) | (state[14] & 64) | ((state[15] & 64) << 1))
              
    temp[15] = (((state[8] & 128) >> 7) | ((state[9] & 128) >> 6) | ((state[10] & 128) >> 5) | ((state[11] & 128) >> 4) |
               ((state[12] & 128) >> 3) | ((state[13] & 128) >> 2) | ((state[14] & 128) >> 1) | (state[15] & 128))     
                   
    state[:] = temp[:]
    
def test_pbox():
    data = bytearray(range(16))
    p_box(data)
    shuffle_bytes(data)
    invert_shuffle_bytes(data)
    p_box(data)
    assert data == bytearray(range(16)), data
    
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
    
def test_shuffle_invert_shuffle():
    data = range(16)
    shuffle_bytes(data)
    print data
    invert_shuffle_bytes(data)
    assert data == range(16)
    print data
    
def encrypt(state, key, rounds=1):    
    xor_subroutine(state, key)
    p_box_half(state) # makes halves orthogonal - 8 bytes vertical, 8 bytes horizontal  
        
    for round in range(rounds):        
        p_box(state)          
        shuffle_bytes(state)                
        round_key = xor_sum(state)
       # print "State at round start: ", round, round_key, state
        for index in reversed(range(16)):
            left, right = state[index - 1], state[index]
            round_key ^= left ^ right
            
         #   print "\nIndex: ", index
         #   print "Left: ", left
         #   print "Right: ", right
         #   print "Round key: ", round_key
         #   print "Key: ", key[index]
            
            right = (right + round_key + key[index]) & 255
            left = (left + (right >> 4)) & 255
            left ^= rotate_left(right, 5)
            
            round_key ^= left ^ right            
            state[index - 1], state[index] = left, right
        
def test_vector():
    data = bytearray(16)
    key = bytearray(16)
    key[-1] = 1
    key[0] = 233
    
    encrypt(data, key)
    print [byte for byte in data]
    decrypt(data, key)
    assert data == bytearray(16), data
    
def encrypt_unrolled(state, key, rounds=1, temp=bytearray(16)):
    xor_subroutine(state, key)
    p_box_half(state)
    round_key = xor_sum(state)
    print "Beginning unrolled"
    for round in range(rounds):
        print "Before: ", state
        p_box(state)
        print "After: ", state
        left, right = state[2], state[7]
        round_key ^= left ^ right
        
        right = (right + round_key + key[15]) & 255
        temp[15] = right
        round_key ^= right           
        
        left, right = state[10], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)        
        round_key ^= left
        
        right = (right + round_key + key[14]) & 255
        temp[14] = right
        round_key ^= right          
        
        left, right = state[1], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[13]) & 255
        temp[13] = right
        round_key ^= right
        
        left, right = state[8], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[12]) & 255
        temp[12] = right
        round_key ^= right
        
        left, right = state[14], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[11]) & 255
        temp[11] = right
        round_key ^= right    
        
        left, right = state[3], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[10]) & 255
        temp[10] = right
        round_key ^= right  
        
        left, right = state[13], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[9]) & 255
        temp[9] = right
        round_key ^= right 
        
        left, right = state[0], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[8]) & 255
        temp[8] = right
        round_key ^= right 
        
        left, right = state[9], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[7]) & 255
        temp[7] = right
        round_key ^= right  
    
        left, right = state[6], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[6]) & 255
        temp[6] = right
        round_key ^= right  
    
        left, right = state[12], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[5]) & 255
        temp[5] = right
        round_key ^= right  
        
        left, right = state[15], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[4]) & 255
        temp[4] = right
        round_key ^= right
    
        left, right = state[4], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[3]) & 255
        temp[3] = right
        round_key ^= right
    
        left, right = state[5], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[2]) & 255
        temp[2] = right
        round_key ^= right
        
        left, right = state[11], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[1]) & 255
        temp[1] = right
        round_key ^= right
    
        left, right = temp[15], ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)    
        round_key ^= left
        
        right = (right + round_key + key[0]) & 255
        temp[0] = right
        round_key ^= right
    
        left = ((left + (right >> 4)) & 255) ^ rotate_left(right, 5)
        temp[15] = left
        round_key ^= left        
        
        state[:] = temp[:]
           
def decrypt(state, key, rounds=1):
    
    for round in range(rounds):
   #     print "\nBeginning of round:\n", state
        round_key = xor_sum(state)
        for index in range(16):
            left, right = state[index - 1], state[index]
            
            round_key ^= left ^ right            
            left ^= rotate_left(right, 5)
            left = (255 + 1 + (left - (right >> 4))) & 255            
            right = (255 + 1 + (right - round_key - key[index])) & 255
    #        print left, right, round_key, key[index]
            
            round_key ^= left ^ right
            state[index - 1], state[index] = left, right        
    #    print "Before invert shuffle: ", state
        invert_shuffle_bytes(state)
    #    print "After invert shuffle: ", state
        p_box(state)
    #    print "After invert pbox: ", state
    p_box_half(state)
    xor_subroutine(state, key)
    
def test_encrypt_decrypt():
    data = bytearray(16)
    key = bytearray(16)
    key[-1] = 1
    
    encrypt(data, key)
    ciphertext = data[:]
    print ciphertext
    
    decrypt(data, key)
    assert data == bytearray(16), data
    
    #encrypt_unrolled(data, key)
    #assert data == ciphertext, (data, ciphertext)    
    
import crypto

class Test_Cipher(crypto.Cipher):
            
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.blocksize = 16
        
    def encrypt_block(self, data, key, tag=None, tweak=None):
        encrypt(data, key)
                
if __name__ == "__main__":
    #Test_Cipher.test_metrics("\x01" * 16, "\x00" * 16)#, randomness_test=False, avalanche_test=False, bias_test=False, period_test=False)
    
    #test_encrypt_decrypt()
    test_shuffle_invert_shuffle()
    #test_pbox()
    #test_vector()
    