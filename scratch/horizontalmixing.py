from pride.crypto.utilities import rotate_left

def bit_shuffle(word0, key):
    current_bit = 1
    for i in reversed(range(1, 8)):                        
        other_bit = rotate_left(current_bit, key & current_bit) & (i - 1)
        
        bit0 = word0 & current_bit
        bit1 = word0 & other_bit
        print bit0, bit1
       # bit0 ^= bit1
       # bit1 ^= bit0
       # bit0 ^= bit1                             
      
        word0 ^= bit0
        bit0 ^= word0
        word0 ^= bit0
        
        word0 ^= bit1
        bit1 ^= word0
        word0 ^= bit1
        #word0 ^= bit0 ^ bit1
        print bit0, bit1
        current_bit <<= 1
    return word0    
    
def test_bit_shuffle():
    word = 1
    key = 1
    
    while not raw_input("any key + enter to finish, or enter to continue: "):
        print("{}\n".format(word, 'b').zfill(8))
        word = bit_shuffle(word, key)
        
if __name__ == "__main__":
    test_bit_shuffle()
    