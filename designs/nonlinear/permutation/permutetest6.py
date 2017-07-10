from crypto.utilities import xor_sum, rotate_right, rotate_left

def permute(left_byte, right_byte, key_byte, modifier):                             
    right_byte = (right_byte + key_byte + modifier) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte
    
def pbox8(data, _storage=bytearray(8)): 
    for byte_index in range(8):     
        mask = 128 >> byte_index        
        _byte = 0
        for byte_position, byte in enumerate(data):
            _byte |= (((byte & mask) << byte_index) >> byte_position)
        _storage[byte_index] = _byte
    data[:] = _storage[:]        
                
def round_function(data, key, diffuser, index, tag, datasize, constants):        
    block = bytearray(8)            
    for _index, byte in enumerate((diffuser, key[index], constants[index], index)):             
        block[(_index * 2)] = byte >> 8
        block[(_index * 2) + 1] = byte & 255    
    
    for round in range(2):
        pbox8(block)                
        data_byte2, data_byte1 = permute(block[4] << 8 | block[5], # data_byte1 # swaps with data_byte2
                                         block[6] << 8 | block[7], # data_byte2
                                         block[2] << 8 | block[3], # key_byte
                                         block[0] << 8 | block[1]) # diffuser
        block[4] = data_byte1 >> 8
        block[5] = data_byte1 & 255
        block[6] = data_byte2 >> 8
        block[7] = data_byte2 & 255
        
    pbox8(block)
    key_material2, key_material1 = permute(block[4] << 8 | block[5], 
                                           block[6] << 8 | block[7], 
                                           block[2] << 8 | block[3], 
                                           block[0] << 8 | block[1])
                                           
    data[index] ^= (key_material1 >> 8) ^ (key_material1 & 255)
    tag[index] ^= (key_material2 >> 8) ^ (key_material2 & 255)
      
def crypt_bytes(data, key, start, direction, diffuser, tag, constants, rounds=2):    
    datasize = len(data)
    for round in range(rounds):
        index = start
        for counter in reversed(range(datasize)):
            diffuser ^= data[index]                    
            round_function(data, key, diffuser, index, tag, datasize, constants)        
            diffuser ^= data[index]        
            index += direction
        
def encrypt_block(data, key, tweak=tuple([0 for byte in range(256)])):
    data = bytearray(data)
    key = bytearray(key)
    crypt_bytes(data, key, 0, 1, xor_sum(data), [0] * len(data), tweak)
    return bytes(data)
    
def decrypt_block(data, key, tweak=tuple([0 for byte in range(256)])):
    data = bytearray(data)
    key = bytearray(key)
    crypt_bytes(data, key, len(data) - 1, -1, xor_sum(data), [0] * len(data), tweak)
    return bytes(data)
    
def test_pbox():
    data = bytearray("\x04" * 7)#7)
    data.append(133)
    data[1] = 25
    data[0] = 1
    print [byte for byte in data]
    pbox8(data)
    print [byte for byte in data]
    pbox8(data)
    print [byte for byte in data]
    
    data = list(bytearray("\x00" * 16))
    data[1] = 100
    data[-1] = 100
    print data
    pbox16(data)
    print data
    pbox16(data)
    print data
    
    
def test_encrypt_decrypt():
    data = ("\x00" * 5) + "\x00\x00\x00"
    key = "\x00" * 8
    ciphertext = encrypt_block(data, key)
    print "Ciphertext: ", ciphertext
    plaintext = decrypt_block(ciphertext, key)
    assert plaintext == data, (plaintext, data)
    
#import crypto
#
#class Test_Cipher(crypto.Cipher):
#        
#    def encrypt_block(self, data, key, 
    
if __name__ == "__main__":
    #test_encrypt_decrypt()
    test_pbox()
    