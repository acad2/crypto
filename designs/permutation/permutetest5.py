from pride.crypto.utilities import pad_input, slide

def permute(left_byte, right_byte, key_byte, modifier):        
    right_byte = (right_byte + key_byte + modifier) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte
    
def permute_subroutine(data, key, index):   
    data[index - 1], data[index] = permute(data[index - 1], data[index], key[index], index)    
    
def permutation(data, key):        
    for round in range(2):
        for index in reversed(range(len(data))):        
            permute_subroutine(data, key, index) 
            
def permute_hash(data, rounds=1, blocksize=16):
    data = list(bytearray(pad_input(data, blocksize)))    
    output = [0 for byte in range(blocksize)]
    key = data[:blocksize]
    for round in range(rounds):
        for data_block in slide(data, blocksize):                
            permutation(data_block, key)
            key = data_block           
            
    return bytes(bytearray((byte >> 8) ^ (byte & 255) for byte in data_block))
    
def test_permute_hash():
    data = "\x01"
    print permute_hash(data, blocksize=8)
    from pride.crypto.analysis.metrics import test_hash_function
    test_hash_function(permute_hash)
    
if __name__ == "__main__":
    test_permute_hash()
    