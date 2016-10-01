def permute(left_byte, right_byte, key_byte, modifier):                             
    right_byte = (right_byte + key_byte + modifier) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte
    
def permutation(data, key, modifier):
    for round in range(2):
        for index in reversed(range(len(data))):
            next_index = index - 1
            left_byte, right_byte = permute(data[next_index], data[index], key[index], modifier + index)
            data[next_index] = left_byte
            data[index] = right_byte
        
def diffusion_layer(data, _storage=[0] * 16): 
    diffuser = 0
    for byte_index in range(16):     
        mask = 32768 >> byte_index        
        _byte = 0        
        for byte_position in range(16):            
            _byte |= (((data[byte_position] & mask) << byte_index) >> byte_position)
        
        _storage[byte_index] = _byte      
        diffuser ^= _byte
        
    for index in range(16): # probably just swap pointers in x86?      
        data[index] = _storage[index]
    return diffuser
    
def encipher(data, key):
    diffuser = diffusion_layer(data)
    permutation(data, key, diffuser)
    
def decipher(data, key):
    inverse_permutation(data, key
def crypt_bytes(data, key, rounds):
    for round in range(rounds):        
        cipher(key, key)
        cipher(data, key)
        
def test_crypt_bytes():
    data = ([0] * 14) + [0, 0]
    key = ([0] * 14) + [0, 0]
    rounds = 1
    
    crypt_bytes(data, key, rounds)
    print "Ciphertext: ", data
    crypt_bytes(data, key, rounds)
    print "Plaintext: ", data
    
if __name__ == "__main__":
    test_crypt_bytes()
    