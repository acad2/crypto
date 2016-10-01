def _bytes_to_integer(data):
    output = 0
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def _integer_to_bytes(integer, _bytes=16):
    output = bytearray()
    _bytes /= 2
    for byte in range(_bytes):        
        output.append((integer >> (8 * (_bytes - 1 - byte))) & 255)
    return output

def _setup(data, key, bit_width_and_mask=(64, (2 ** 64) - 1)):
    bit_width, mask = bit_width_and_mask 
    size = len(data) / 2
    left = _bytes_to_integer(data[:size])
    right = _bytes_to_integer(data[size:])
    key = _bytes_to_integer(key)
    return left, right, key, mask, bit_width
            
def rotate_left(byte, amount, bit_width, mask):
    return ((byte >> amount) | (byte << (bit_width - amount))) & mask  
    
def _encrypt(left, right, key, mask, bit_width, rounds):        
    for round_index in range(rounds): 
        right = (right + key + (left ^ key) + round_index) & mask
        left = ((left + (right >> 32)) & mask) ^ rotate_left(right, 5, bit_width, mask)
                        
        left, right = right, left            
    right = (right + key + (left ^ key) + round_index + 1) & mask
    left, right = right, left  
    return left, right
        
def encrypt(data, key, rounds=5, bit_width_and_mask=(64, (2 ** 64) - 1)):  
    left, right = _encrypt(*_setup(data, key, bit_width_and_mask) + (rounds, ))
    return _integer_to_bytes(left) + _integer_to_bytes(right)    
    
def _decrypt(left, right, key, mask, bit_width, rounds):        
    left = (mask + 1 + ((left - key) - (right ^ key) - rounds)) & mask        
    for round_index in range(rounds):               
        left = (mask + 1 + ((left ^ rotate_left(right, 5, bit_width, mask)) - (right >> 32))) & mask
        right = (mask + 1 + ((right - key) - (left ^ key) - (rounds - 1 - round_index))) & mask                
        
        left, right = right, left    
        
    left, right = right, left
    return left, right
    
def decrypt(data, key, bit_width_and_mask=(64, (2 ** 64) - 1), rounds=5, constants=range(256)):
    left, right = _decrypt(*_setup(data, key, bit_width_and_mask) + (rounds, ))
    return _integer_to_bytes(left) + _integer_to_bytes(right)
        
def test_encrypt_decrypt():    
    data = bytearray("\x00" * 16)
    key = bytearray("\x01" * 8)
    ciphertext = encrypt(data, key)        
    print "Ciphertext:\n", ciphertext
        
    plaintext = decrypt(ciphertext, key)
    print "Plaintext: ", plaintext
    
def test_integer_to_bytes():
    data = bytearray("Testing!" * 2)
    left, right, _, _, _ = _setup(data, bytearray(16))
    _data = _integer_to_bytes(left) + _integer_to_bytes(right)
    assert _data == data, _data
    
import pride.crypto
from pride.crypto.utilities import replacement_subroutine

class Test_Cipher(pride.crypto.Cipher):
        
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.size_constants = (64, (2 ** 64) - 1)
        self.rounds = 5
        self.blocksize = 16
        
    def encrypt_block(self, data, key, tag=None, tweak=None):            
        ciphertext = encrypt(data, self.key, self.rounds, self.size_constants)        
        replacement_subroutine(data, ciphertext)        
        
    def decrypt_block(self, data, key, tag=None, tweak=None):
        plaintext = decrypt(data, self.key, self.size_constants, self.rounds)
        replacement_subroutine(data, plaintext)
                
if __name__ == "__main__":
    #test_integer_to_bytes()
    test_encrypt_decrypt()
    Test_Cipher.test_encrypt_decrypt("\x01" * 16, "cbc")
    #Test_Cipher.test_metrics("\x00" * 16, "\x00" * 16)
    Test_Cipher.test_performance("\x00" * 8, "cbc")