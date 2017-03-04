from crypto.utilities import pad_input, slide, bytes_to_words, words_to_bytes

from roundfunction2 import round_function

ROUNDS = 32
INTEGER64_OVERFLOW = (2 ** 64) - 1 # 0xFFFFFFFFFFFFFFFF
    
def add_block(a, b, c, d, in0, in1, in2, in3, counter):
    a ^= in0 ^ counter; b ^= in1 ^ counter; c ^= in2 ^ counter; d ^= in3 ^ counter;    
    return a, b, c, d
    
def compression_function(data, rounds=ROUNDS):
    data = bytes_to_words(data, 8) # convert 8-bit words to 64-bit words
    a, b, c, d = (0, 0, 0, 0)
    counter = 1
    for in0, in1, in2, in3 in slide(data, 4): # work on 4 64-bit words at a time (256 bit state)    
       # print "Digesting: ", in0, in1, in2, in3
        a, b, c, d = add_block(a, b, c, d, in0, in1, in2, in3, 0)        
        
        assert counter <= INTEGER64_OVERFLOW
        for round in range(rounds):    
            a, b, c, d = round_function(a, b, c, d)
        a, b, c, d = add_block(a, b, c, d, in0, in1, in2, in3, 0)
        counter += 1    
    a, b, c, d = round_function(a, b, c, d)    
    return bytes(words_to_bytes((a, b, c, d), 8))
    
def hash_function(data):
    data = pad_input(bytearray(data), 32)
    return compression_function(data)
    
def test_hash_function():
    print hash_function("\x01")
    print hash_function("\x02")
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function, avalanche_test=False)        
        
if __name__ == "__main__":    
    test_hash_function()
    
    