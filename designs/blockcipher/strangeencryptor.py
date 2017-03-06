""" The branch function produces permutations of a set of n-bit blocks. The 8-bit branch function here produces a permutation of 5-bit blocks, with the upper 3 bits of the branch function input acting as the key, and the lower 5 bits acting as the data block. The output spans a range of 32 different values, which are decoded to interpret the values 0-31 (0 to 2 ** 5). """

from crypto.utilities import rotate_left, slide, odd_size_to_bytes

ROUNDS = 1

def branch(word): 
    # 0 1 2 3 4 5 6 7
    # 03 14 25 36 47 50 61 72
    # 61 72 03 14 25 36 47 50
    # 0136 1247 0235 1346 2457 0356 1467 0257
    
    # 0136 1247 0235 1346 2457 0356 1467 0257
    # 1346 2457 0356 1467 0257 0136 1247 0235 
    # 04 15 26 37 04 15 26 37
            
    word ^= rotate_left(word, 3, 8)
    word ^= rotate_left(word, 6, 8)
    return word
    
KEY = list(set([branch(word) for word in range(32)]))
KEY = dict((entry, KEY.index(entry)) for entry in KEY)
_KEY = dict((value, key) for key, value in KEY.items())

def encrypt(data, key, decoder=KEY, rounds=ROUNDS):
    key <<= 5
    for round in range(rounds):
        data ^= key
        data = decoder[branch(data)]
    return data
    
def decrypt(data, key, encoder=_KEY, rounds=ROUNDS):
    key <<= 5
    for round in range(rounds):
        data = unbranch(encoder[data])
        data ^= key               
        
def test_encrypt():
    ciphertexts = []
    key = 0
    for byte in range(32):
        ciphertext = encrypt(byte, key)
        ciphertexts.append(ciphertext)
    print len(set(ciphertexts)), ciphertexts
    
if __name__ == "__main__":
    test_encrypt()
    