from crypto.utilities import cast, replacement_subroutine, xor_subroutine
from crypto.utilities import rotate_left, rotate_right
import crypto

NUMBER_OF_ROUNDS = {(64, 2) : 32, (64, 3) : 33, (64, 4) : 34,
                    (48, 2) : 28, (48, 3) : 29, 
                    (32, 3) : 26, (32, 4) : 27,
                    (24, 3) : 22, (24, 4) : 23,
                    (16, 4) : 22}
    
def speck_round(left, right, key, modulus):
    left = rotate_right(left, 7)        
    left = (left + right) % modulus    
    left ^= key    
    right = rotate_left(right, 3)    
    right ^= left
    return left, right
            
def invert_speck_round(left, right, key, modulus):
    right ^= left
    right = rotate_right(right, 3)
    left ^= key    
    left = (modulus + (left - right)) % modulus    
    left = rotate_left(left, 7)
    return left, right
    
def word_to_integer(word):
    return cast(cast(bytes(word), "binary"), "integer")
    
class Speck(crypto.Cipher):
       
    def _crypt_block(self, data, key):    
        size = len(data) / 2
        modulus = 2 ** (8 * size)
        left, right = data[:size], data[size:]
        leftkey, rightkey = key[:size], key[size:]
        round_info = (len(left) * 8, 2) # only support 2 keys for now
        return (word_to_integer(left), word_to_integer(right), 
                word_to_integer(leftkey), word_to_integer(rightkey), 
                modulus, round_info)
        
    def encrypt_block(self, data, key):     
        left, right, leftkey, rightkey, modulus, round_info = self._crypt_block(data, key)      
        speck_round(left, right, leftkey, modulus)        
        print left, right
        for round in range(1, 4):#NUMBER_OF_ROUNDS[round_info]):
            leftkey, rightkey = speck_round(rightkey, leftkey, round, modulus)
            left, right = speck_round(left, right, leftkey, modulus)
            print left, right
        replacement_subroutine(data, cast(left, "bytes") + cast(right, "bytes")) 
        print left, right
        print data
        print word_to_integer(data[:len(data) / 2]), word_to_integer(data[len(data) / 2:])
        
    def decrypt_block(self, data, key):   
        print "Decrypting\n", data
        left, right, leftkey, rightkey, modulus, round_info = self._crypt_block(data, key)   
        print left, right
        for round_number in range(1, 4):#NUMBER_OF_ROUNDS[round_info]):            
            leftkey, rightkey = speck_round(rightkey, leftkey, round_number, modulus)
        
        print left, right
        for round in reversed(range(1, 4)):#NUMBER_OF_ROUNDS[round_info])):
            left, right = invert_speck_round(left, right, leftkey, modulus)
            print left, right
            leftkey, rightkey = invert_speck_round(rightkey, leftkey, round, modulus)
        left, right = invert_speck_round(left, right, leftkey, modulus)
        replacement_subroutine(data, cast(left, "bytes") + cast(right, "bytes"))
        
def test_speck_round():
    left = right = cast(cast("\x01" * 3, "binary"), "integer")
    leftkey = rightkey = left
    
  #  print left, right
    left, right = speck_round(left, right, leftkey, 2 ** (3 * 8))
  #  print left, right
    left, right = invert_speck_round(left, right, leftkey, 2 ** (3 * 8))
  #  print left, right
    
def test_speck_Cipher():
    cipher = Speck("\x00" * 16, "cbc")
    data = bytearray("\x00" * 16)
    key = data[:]
    
    cipher.encrypt_block(data, key)
    #print data
    cipher.decrypt_block(data, key)
    #print data
    
def visualize_speck():
    left = 0
    right = 1
    key = 2
    modulus = 0xFFFFFFFFFFFFFFFF
    from crypto.analysis.visualization import test_4x64_function, print_state_4x64_256
    test_4x64_function(speck_round, (left, right, key, modulus), print_function=lambda data: print_state_4x64_256(data))
    
if __name__ == "__main__":
    #test_speck_round()
    test_speck_Cipher()
    #visualize_speck()
    