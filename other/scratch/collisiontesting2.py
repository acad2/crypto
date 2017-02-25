from hashlib import *

import cryptanalysis

def collision_test(hash_function):
    for index in range(20):
        sbox = []
        for byte in range(256):
            _input = bytearray(20)
            _input[index] = byte
            sbox.append(ord(hash_function(_input)[index]))
        
        cryptanalysis.summarize_sbox(sbox)
    
def test_collision_test():
    hash_function = lambda data: sha1(data).digest()
    collision_test(hash_function)
    
if __name__ == "__main__":
    test_collision_test()
    
        