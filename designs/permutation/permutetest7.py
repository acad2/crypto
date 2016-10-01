def permute(left, right, key, diffuser, bit_width_and_mask=(16, 65535)):
    bit_width, mask = bit_width_and_mask
    for round in range(4):
        right = (right + key + diffuser) & mask
        left = (left + (right >> 8)) & mask
        left ^= ((right >> 3) | (right << (bit_width - 3))) & mask
        
        left, right = right, left
    return left, right
    
def diffusion_layer(data, _storage=[0] * 16): 
    diffuser = 0
    # build the diffuser, and pbox the data
    for byte_index in range(16):     
        mask = 32768 >> byte_index        
        _byte = 0        
        for byte_position in range(16):            
            _byte |= (((data[byte_position] & mask) << byte_index) >> byte_position)
        _storage[byte_index] = _byte          
        diffuser ^= _byte
            
    for index in range(16):                
        data[index] = _storage[index]
    return diffuser
        
def xor_with_key(data, key):    
    for index in range(16):
        data[index] ^= key[index]
        
def key_schedule(key):
    for round in range(2):
        for index in reversed(range(16)):
            next_index = index - 1
            key[next_index], key[index] = permute(key[next_index], key[index], data[index], index)        
            
def crypt_bytes(data, key, tag, constants, diffuser, start, direction): 
    index = start
    for counter in range(16):
        diffuser ^= data[index]
        
        left_byte, right_byte = permute(constants[index], diffuser, key[index], index)
        left_byte, right_byte = permute(right_byte, left_byte, key[index], index)
        data[index] ^= right_byte            
        tag[index] ^= (left_byte >> 8) ^ (left_byte & 255)
        
        diffuser ^= data[index]  
        index += direction
        
def encrypt_bytes(data, key, tag, constants=tuple(0 for byte in range(256)), rounds=1):    
    for round in range(rounds):            
        xor_with_key(data, key)        
        diffuser = diffusion_layer(data)          
        crypt_bytes(data, key, tag, constants, diffuser, 0, 1)
             
def decrypt_bytes(data, key, tag, constants=tuple(0 for byte in range(256)), rounds=1):
    diffuser = 0
    for index in range(16):
        diffuser ^= data[index]
        
    for round in range(rounds):
        crypt_bytes(data, key, tag, constants, diffuser, len(data) - 1, -1)        
        diffuser = diffusion_layer(data)        
        xor_with_key(data, key)        
        
def test_encrypt_bytes():
    rounds = 1
    data = ([0] * 13) + [0, 0, 1]
    plaintext = data[:]
    key = ([0] * 14) + [1, 0]
    tag = [0] * 16
    print data
    encrypt_bytes(data, key, tag, rounds=rounds)
    print data
    decrypt_bytes(data, key, tag, rounds=rounds)
    assert data == plaintext, data
    assert tag == [0] * 16, tag
    print "Pass"
    
def pack_bytes_to_words(data):    
    return [data[index] << 8 | data[index + 1] for index in range(0, len(data), 2)]           
        
def unpack_words_to_bytes(data, output):    
    for index, byte in enumerate(data):
        output[(2 * index)] = byte >> 8
        output[(2 * index) + 1] = byte & 255        
            
import pride.crypto

class Test_Cipher(pride.crypto.Cipher):
        
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.blocksize = 32
        self.rounds = 2
        self.tweak = tuple(0 for byte in range(256))
                
    def encrypt_block(self, data, key, tag, tweak):        
        _data = pack_bytes_to_words(data)         
        encrypt_bytes(_data, key, tag, self.tweak, self.rounds)                
        unpack_words_to_bytes(_data, data)
                
    def decrypt_block(self, data, key, tag, tweak):
        _data = pack_bytes_to_words(data)                        
        decrypt_bytes(_data, key, tag, self.tweak, self.rounds)                
        unpack_words_to_bytes(_data, data)
                
if __name__ == "__main__":
    test_encrypt_bytes()
    Test_Cipher.test_encrypt_decrypt([0] * 16, "cbc")
    Test_Cipher.test_metrics([0] * 16, "\x00" * 32, tag=[0] * 16, blocksize=32)