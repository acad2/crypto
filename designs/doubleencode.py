# encode(a) = 00000111
# encode(b) = 00001100
# encode(c) = 00011000
# encode(d) = 00110000
# encode(e) = 01100000
# encode(f) = 10101000
# encode(g) = 01000101
# encode(h) = 10110010

# |-0---0---0---0---0---1---1---1
# |-0---0---0---0---1---1---0---0
# |-0---0---0---1---1---0---0---0
# |-0---0---1---1---0---0---0---0
# |-0---1---1---0---0---0---0---0
# |-1---0---1---0---1---0---0---0
# |-0---1---0---0---0---1---0---1
# |-1---0---1---1---0---0---1---0
#   s   t   u   v   w   x   y   z
# encode each vertical column of bits

# encode(s) == encode(10100000) = ...
# encode(t) == encode(01010000) = ...
# encode(u) == encode(10111000) = ...
# encode(v) == encode(10001100) = ...
# encode(w) == encode(00100110) = ...
# encode(x) == encode(01000011) = ...
# encode(y) == encode(10000001) = ...
# encode(z) == encode(01000001) = ...
from crypto.utilities import rotate_left, rotate_right

def encode8(word): 
    # 0 1 2 3 4 5 6 7
    # 03 14 25 36 47 50 61 72
    # 61 72 03 14 25 36 47 50
    # 0136 1247 0235 1346 2457 0356 1467 0257            
    word ^= rotate_left(word, 3, 8)
    word ^= rotate_left(word, 6, 8)
    return word

def encode8b(word):
    word ^= rotate_left(word, 1, 8)
    word ^= rotate_left(word, 3, 8)
    return word
    
def transpose8x8(state):
    assert len(state) == 8
    output = bytearray(8)
    state = state[:]
    for index in range(8):
        output[index] = 0
        for index2 in range(8):            
            byte = state[index2]
            output[index] |= ((byte & 1) << index2) & 255
            state[index2] = rotate_right(byte, 1)                            
    state[:] = output[:]    
    return state
    
def test_encode():
    values = range(1, 9)
    print "Initial values: "
    print '\n'.join(format(word, 'b').zfill(8) for word in values)
    encoded_once = [encode8(word) for word in values]
    print "First encoding: "
    print '\n'.join(format(word, 'b').zfill(8) for word in encoded_once)
    rotated = transpose8x8(encoded_once)
    print "Rotated: "
    print '\n'.join(format(word, 'b').zfill(8) for word in rotated)
    encoded_twice = [encode8b(word) for word in rotated]
    print "Second encoding: "
    print '\n'.join(format(word, 'b').zfill(8) for word in encoded_twice)
    #rotated_twice = transpose8x8(encoded_twice)
    #print "Rotated twice: "
    #print '\n'.join(format(word, 'b').zfill(8) for word in rotated_twice)
    #encoded_thrice = [encode8b(word) for word in rotated_twice]   
    #print "Third encoding: "
    #print '\n'.join(format(word, 'b').zfill(8) for word in encoded_thrice)
    
    possible_encodings = [encode8(word) for word in range(32)]
    possible_encodings2 = [encode8b(word) for word in range(32)]
    print [(word in possible_encodings) or (word in possible_encodings2) for word in encoded_once]
    print [(word in possible_encodings) or (word in possible_encodings2) for word in rotated]  
    print [(word in possible_encodings) or (word in possible_encodings2) for word in encoded_twice]
    #print [word in possible_encodings for word in rotated_twice]
    #print [word in possible_encodings for word in encoded_thrice]
    
if __name__ == "__main__":
    test_encode()
    
    