from rng import random_bytes as stream_cipher
from pride.crypto.utilities import xor_subroutine, xor_sum, rotate_left, rotate_right

def shuffle_bytes(_state, temp=list(range(16))):          
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
    
def invert_decorrelation_layer(data, bit_width):
    invert_shuffle_bytes(data)
    return bit_mixing(data, len(data) - 1, -1, bit_width)
    
def prp(data, key, mask=255, rotation_amount=5, bit_width=8): 
    key = decorrelation_layer(data, bit_width)
    for index in range(len(data)):
        byte = data[index]
        key ^= byte                          
        data[index] = rotate_left((byte + key + index) & mask, rotation_amount, bit_width)        
        key ^= data[index]                    
    return key
    
def invert_prp(data, key, mask=255, rotation_amount=5, bit_width=8):    
    for index in reversed(range(len(data))):
        byte = data[index]
        key ^= byte                
        data[index] = ((mask + 1) + (rotate_right(byte, rotation_amount, bit_width) - key - index)) & mask        
        key ^= data[index]
    return invert_decorrelation_layer(data, bit_width)
    
def stream_to_block_encrypt(data, key, seed, blocksize=32):
    key_material = stream_cipher(len(data), seed, key)
    for block in slide(data, blocksize):
        xor_subroutine(data, key_material)
        prp(data, xor_sum(data))
        xor_subroutine(data, key_material)
        
def block_to_stream_decrypt(data, key, seed, blocksize=32):
    key_material = stream_cipher(len(data), seed, key)
    for block in reversed(list(slide(data, blocksize))):
        xor_subroutine(data, key_material)
        invert_prp(data, xor_sum(data))
        xor_subroutine(data, key_material)
        
def encrypt(data, key, seed, blocksize=32):
    stream_to_block_encrypt(data, key, seed, blocksize)
    
def decrypt(data, key, seed, blocksize=32):
    block_to_stream_decrypt(data, key, seed, blocksize)
    
def test_encrypt_decrypt():
    data = bytearray(range(16))
    key = bytearray(16)
    seed = bytearray(16)
    
    encrypt(data, key, seed, 16)
    print data
    decrypt(data, key, seed, 16)
    assert data == bytearray(range(16)), data
    
    plaintext = bytearray(range(16))
    ciphertext = plaintext[:]
    encrypt(ciphertext, key, seed, 16)
    
    for ending in range(256):
        _ciphertext = ciphertext[:]
        _ciphertext[-2] = ending
        decrypt(_ciphertext, key, seed, 16)
        if _ciphertext == plaintext and ending != 15:
            print "Bad decryption: ", ending, list(_ciphertext)     
        
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    