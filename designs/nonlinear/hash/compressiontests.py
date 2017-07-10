from os import urandom
from crypto.utilities import shuffle, pad_input, xor_subroutine

def _hash(data, key=0, mask32=(2 ** 32) - 1):    
    for index, word32 in data:
        key = (key + word32) & mask32
        permutation(key)
        key = (key + word32) & mask32
        
if __name__ == "__main__":
    pass
    