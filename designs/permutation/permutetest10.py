from permutetest9 import _encrypt, _integer_to_bytes, _bytes_to_integer

def round_function(data, key, mask=(2 ** 64) - 1):                                      
    left, right = _encrypt(data >> 64, data & mask, key, mask, 64, 5)
    return (left << 64) | right
    
def crypt(left, right, key, mask, rounds, start=0, direction=1, constants=range(256)):    
    index = start
    for counter in range(rounds):
        round_key = round_function(key, (key + index) & mask)                
        left ^= round_function(right, ((right ^ round_key) + round_key) & mask)        
        left, right = right, left
        index += direction
        
    left, right = right, left
    return left, right
    
def encrypt(data, key, rounds=5, mask=(2 ** 128) - 1, _start=0, _direction=1):     
    left = _bytes_to_integer(data[:16])
    right = _bytes_to_integer(data[16:])
    left, right = crypt(left, right, _bytes_to_integer(bytearray(key)), mask, rounds, _start, _direction)    
    return _integer_to_bytes(left, 32) + _integer_to_bytes(right, 32)
    
def test_encrypt():
    message = bytearray(("\x01" * 31) + "\x00")
    key = bytearray("\x00" * 16)
    ciphertext = encrypt(message, key)
    print ciphertext
    print encrypt(ciphertext, key, _start=4, _direction=-1)
    
    
import pride.crypto
from pride.crypto.utilities import replacement_subroutine

class Test_Cipher(pride.crypto.Cipher):
        
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.blocksize = 32
        
    def encrypt_block(self, data, key, tweak=None, tag=None):        
        _data = encrypt(data, key)
        replacement_subroutine(data, _data[:len(data)])
        
    def decrypt_block(self, data, key, tweak=None, tag=None):
        _data = encrypt(data, key, _start=5 - 1, _direction=-1)
        replacement_subroutine(data, _data[:len(data)])
        
if __name__ == "__main__":
    test_encrypt()
    Test_Cipher.test_encrypt_decrypt("\x01" * 16, "cbc")
    #Test_Cipher.test_metrics("\x01" * 16, "\x00" * 32)
    Test_Cipher.test_performance("\x01" * 32, "cbc")