def rotate_left(x, r, bit_width=8, _mask=dict((bit_width, ((2 ** bit_width) - 1)) for bit_width in (8, 16, 32, 64, 128))):  
    r %= bit_width
    return ((x << r) | (x >> (bit_width - r))) & _mask[bit_width]

def rotate_right(x, r, bit_width=8, _mask=dict((bit_width, ((2 ** bit_width) - 1)) for bit_width in (8, 16, 32, 64, 128))): 
    r %= bit_width
    return ((x >> r) | (x << (bit_width - r))) & _mask[bit_width]
    
def round_function(left_index, right_index, key, left_destination, right_destination, 
                   mask=255, rotation_amount=5, bit_width=8):
    left, right = data[left_index], data[right_index]        
    
    key ^= right                 
    right = rotate_left((right + key + right_index) & mask, rotation_amount, bit_width)                
    key ^= right
    
    key ^= left        
    left = (left + (right >> (bit_width / 2))) & mask                
    left ^= rotate_left(right, (right_index % bit_width) ^ rotation_amount)                    
    key ^= left
    
    data[left_destination], data[right_destination] = left, right   
    return key    
    
def prp(data, data_xor, data_size=16):                
    data_xor = round_function(14, 15, data_xor, 14, 15) # wait til wrap-around to transpose 15
           
    data_xor = round_function(13, 14, data_xor, 13, 2) # unrolled is unpythonic, but translates easy to C
    data_xor = round_function(12, 13, data_xor, 12, 10)
    data_xor = round_function(11, 12, data_xor, 11, 1)
    data_xor = round_function(10, 11, data_xor, 10, 8)
    data_xor = round_function(9,  10, data_xor, 9, 14)
    data_xor = round_function(8,   9, data_xor, 8, 3)
    data_xor = round_function(7,   8, data_xor, 7, 13)
    data_xor = round_function(6,   7, data_xor, 6, 0)
    data_xor = round_function(5,   6, data_xor, 5, 9)
    data_xor = round_function(4,   5, data_xor, 4, 6)
    data_xor = round_function(3,   4, data_xor, 3, 12)
    data_xor = round_function(2,   3, data_xor, 2, 15)
    data_xor = round_function(1,   2, data_xor, 1, 4)
    data_xor = round_function(0,   1, data_xor, 0, 5)
    
    data_xor = round_function(15, 0, data_xor, 7, 11)
    return data_xor
    
def prf(data, data_xor, data_size=16):
    data_xor ^= data[15]
    data_xor = round_function(14, 15, data_xor, 14, 15) # wait til wrap-around to transpose 15
    
    data_xor ^= data[14] # remove from data_xor so round_function puts it back in
    data_xor = round_function(13, 14, data_xor, 13, 2) # unrolled is unpythonic, but translates easy to C
    data_xor ^= data[13]
    data_xor = round_function(12, 13, data_xor, 12, 10)
    data_xor ^= data[12]
    data_xor = round_function(11, 12, data_xor, 11, 1)
    data_xor ^= data[11]
    data_xor = round_function(10, 11, data_xor, 10, 8)
    data_xor ^= data[10]
    data_xor = round_function(9,  10, data_xor, 9, 14)
    data_xor ^= data[9]
    data_xor = round_function(8,   9, data_xor, 8, 3)
    data_xor ^= data[8]
    data_xor = round_function(7,   8, data_xor, 7, 13)
    data_xor ^= data[7]
    data_xor = round_function(6,   7, data_xor, 6, 0)
    data_xor ^= data[6]
    data_xor = round_function(5,   6, data_xor, 5, 9)
    data_xor ^= data[5]
    data_xor = round_function(4,   5, data_xor, 4, 6)
    data_xor ^= data[4]
    data_xor = round_function(3,   4, data_xor, 3, 12)
    data_xor ^= data[3]
    data_xor = round_function(2,   3, data_xor, 2, 15)
    data_xor ^= data[2]
    data_xor = round_function(1,   2, data_xor, 1, 4)
    data_xor ^= data[1]
    data_xor = round_function(0,   1, data_xor, 0, 5)
    data_xor ^= data[0]    
    data_xor = round_function(15, 0, data_xor, 7, 11)
    return data_xor
        
def xor_sum(data):
    result = 0
    for byte in data:
        result ^= byte
    return result
    
def xor_subroutine(data, key):
    data_xor = 0
    for index, key_byte in enumerate(key):
        new_byte = data[index] ^ key_byte
        
        data[index] = new_byte
        data_xor ^= new_byte
    return data_xor
    
def generate_round_key(key, round):
    key_xor_sum = prp(key, xor_sum(key))
    round_key = key[:]
    
    prf(round_key, key_xor_sum)
    return round_key
    
def encrypt(data, key, rounds=1, bit_width=8):
    key = key[:]
    round_keys = [generate_round_key(key, round) for round in range(rounds + 1)] # + 1 is for output key
    
    # less pythonic, but translates easier to C
    # round_keys = []
    # key_xor_sum = xor_sum(key)
    # for round in range(rounds):        
    #     round_keys.append(generate_round_key(key, round))    
    for round_key in round_keys[:-1]:
        data_xor = xor_subroutine(data, round_key)
        prp(data, data_xor)
    xor_subroutine(data, round_keys[-1])
    
#def invert_round(left, right, key, index, mask=255, rotation_amount=5, bit_width=8):
#    key ^= left    
#    left ^= rotate_left(right, (index % bit_width) ^ rotation_amount)         
#    left = (256 + (left - (right >> bit_width / 2))) & mask
#    key ^= left;
#    
#    key ^= right        
#    right = (256 + (rotate_right(right, rotation_amount, bit_width) - key - index)) & mask 
#    key ^= right
#    return left, right, key
#    
#def invert_shuffle_bytes(state, temp=list(range(16))):       
#    temp[11] = state[0]
#    temp[5] = state[1]
#    temp[4] = state[2]
#    temp[15] = state[3]
#    temp[12] = state[4]
#    temp[6] = state[5]
#    temp[9] = state[6]
#    temp[0] = state[7]
#    temp[13] = state[8]
#    temp[3] = state[9]
#    temp[14] = state[10]
#    temp[8] = state[11]
#    temp[1] = state[12]
#    temp[10] = state[13]
#    temp[2] = state[14]
#    temp[7] = state[15]
#    
#    state[:] = temp[:]
#    
#def invert_prp(data, data_xor, data_size=16):
#    left, right = data[15], data[0]
#    left, right, data_xor = invert_round(left, right, data_xor, 0)
#    data[15], data[0] = left, right
#    
#    for index in reversed(range(data_size)):
#        left, right = data[index - 1], data[index]
#        left, right, data_xor = invert_round(left, right, data_xor, index)
#        data[index - 1], data[index] = left, right
#        
#    invert_shuffle_bytes(data)
#    return data_xor
    
def decrypt(data, key, rounds=1, bit_width=8):
    key = key[:]
    round_keys = reversed([generate_round_key(key, round) for round in range(rounds + 1)])
    
    data_xor = xor_subroutine(data, next(round_keys))
    for round_key in round_keys:        
        invert_prp(data, data_xor)
        data_xor = xor_subroutine(data, round_key)
    
def test_encrypt_decrypt():
    plaintext = bytearray("Testing!" * 2)
    key = bytearray("\x00" * 16)
    ciphertext = plaintext[:]
    encrypt(ciphertext, key)
    
    print "Ciphertext: ", ciphertext
    decrypt(ciphertext, key)
    assert ciphertext == plaintext, (ciphertext, plaintext)   
        

try:
    import pride.crypto
except ImportError:
    pass
else:
    class Test_Cipher(pride.crypto.Cipher):
                
                
        def __init__(self, *args):
            super(Test_Cipher, self).__init__(*args)
            self.blocksize = 16
            
        def encrypt_block(self, data, key, tag=None, tweak=None):        
            encrypt(data, key)    
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    try:
        Test_Cipher.test_metrics("\x00" * 16, "\x00" * 16, avalanche_test=False, randmoness_test=False)
    except NameError:
        pass
        
    