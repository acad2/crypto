""" The branch function produces permutations of a set of n-bit blocks. The 8-bit branch function here produces a permutation of 5-bit blocks, with the upper 3 bits of the branch function input acting as the key, and the lower 5 bits acting as the data block. The output spans a range of 32 different values, which are decoded to interpret the values 0-31 (0 to 2 ** 5). """

from crypto.utilities import rotate_left, slide, odd_size_to_bytes

ROUNDS = 1

def branch(word): 
    # 0 1 2 3 4 5 6 7
    # 03 14 25 36 47 50 61 72
    # 61 72 03 14 25 36 47 50
    # 0136 1247 0235 1346 2457 0356 1467 0257
    
    # 0136 1247 0235 1346 2457 0356 1467 0257
    # 1247 0235 1346 2457 0356 1467 0257 0136 # rotate left by 1
    # 023467 013457 012456 123567 023467 012456 123567
    
    # 0136 1247 0235 1346 2457 0356 1467 0257
    # 0235 1346 2457 0356 1467 0257 0136 1247 
    
    
    
    # 0136 1247 0235 1346 2457 0356 1467 0257
    # 1346 2457 0356 1467 0257 0136 1247 0235  # rotate left by 4
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
        print "Data: ", data
        data ^= key
        print "Data ^ key: ", data
        data = branch(data)
        print "Branch(data): ", data
        data = decoder[data]
        print "Decoder[data]: ", data
    return data
    
def decrypt(data, key, encoder=_KEY, rounds=ROUNDS):
    key <<= 5
    for round in range(rounds):
        print "Data: ", data
        data = encoder[data]
        print "Encoded data: ", data
        data ^= key               
        print "Data ^ key: ", data
    return data
    
def test_encrypt():
    ciphertexts = []
    key = 0
    for byte in range(32):
        ciphertext = encrypt(byte, key)
        plaintext = decrypt(ciphertext, key)
        assert plaintext == byte, (plaintext, byte)        
        ciphertexts.append(ciphertext)
    print len(set(ciphertexts)), ciphertexts
    
def search_for_inverse_branch(): # not so simple, unfortunately; no valid inverses produced this way.
    solutions = []
    for byte in range(32):
        branched = branch(byte)
        for r1 in range(8):
            for r2 in range(8):
                def inverse_branch(word):
                    word ^= rotate_left(word, r1, 8)
                    word ^= rotate_left(word, r2, 8)
                    return word
                if inverse_branch(branched) == byte:
                    solutions.append((r1, r2, inverse_branch))
    for r1, r2, inverse in set(solutions):
        for byte in range(32):
            branched = branch(byte)
            if inverse(branched) != byte:
                print "Invalid inverse: ", r1, r2, byte
                break
        else:
            print "Valid inverse: ", r1, r2
    
if __name__ == "__main__":
    test_encrypt()
    #search_for_inverse_branch()
    