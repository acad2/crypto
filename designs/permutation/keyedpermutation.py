from crypto.utilities import rotate_left, xor_subroutine

def keyed_permutation(data, key, rounds=1, modulus=256):
    data_size = len(data)
    for round in range(rounds):
        for index in range(data_size):                
            key_material = key[rotate_left(data[index] ^ index, 1, 8)]                                    
            xor_subroutine(data, key_material)
            # instead of branching in the addition loop, subtract the current byte out            
            data[index] ^= key_material[index]
            data[index] = rotate_left(data[index], round + index, 8)
            
                
def test_keyed_permutation():
    blocksize = 16
    key = [[item % 256 for item in range(index + 1, index + 1 + blocksize)] for index in range(256)]
   # for byte in range(256):
   #     data = bytearray(8)
   #     data[0] = byte
   #     keyed_permutation(data, key)
   #     print data    
    from crypto.analysis.metrics import test_permutation
    def test_function(data):
        data = bytearray(data)
        keyed_permutation(data, key)
        return bytes(data)
    test_permutation(test_function, blocksize)
    
    
if __name__ == "__main__":
    test_keyed_permutation()
    