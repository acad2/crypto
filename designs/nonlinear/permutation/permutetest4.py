def permute(left_byte, right_byte, key_byte, modifier):        
    right_byte = (right_byte + key_byte + modifier) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte

# psuedocode for permute:    
#def permute(a, b, c):
#    b += c
#    a += b >> 8
#    a ^= rotate_right(b, 3)
    
def invert_permute(left_byte, right_byte, key_byte, modifier):    
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535   
    left_byte = (65536 + (left_byte - (right_byte >> 8))) & 65535       
    right_byte = (65536 + (right_byte - key_byte - modifier)) & 65535   
    return left_byte, right_byte
    
def permute_subroutine(data, key, index, modifier):   
    data[index - 1], data[index] = permute(data[index - 1], data[index], key[index], modifier)    
    
def invert_permute_subroutine(data, key, index, modifier):    
    data[index - 1], data[index] = invert_permute(data[index - 1], data[index], key[index], modifier)    
    
def permutation(data, key, modifier):        
    for round in range(2):
        for index in reversed(range(len(data))):        
            permute_subroutine(data, key, index, modifier)            
    
def invert_permutation(data, key, modifier):    
    for round in range(2):
        for index in range(len(data)):
            invert_permute_subroutine(data, key, index, modifier)            
    
def encrypt_bytes(data, key, tag, rounds=1):
    size = len(data)    
    assert isinstance(data, list), type(data)
    assert isinstance(key, list), type(key)
    for index in range(size):
        data[index] = (data[index] & 255) | (tag[index] << 8)                      
    
    for round in range(rounds):                
        permutation(key, key, 0)#round + 1)          
        permutation(data, key, 0)#round + 1)        
            
    for index in range(size):    
        tag[index] = data[index] >> 8
        data[index] = data[index] & 255
        
def decrypt_bytes(data, key, tag, rounds=1):
    size = len(data)    
    for index in range(size):
        data[index] = (data[index] & 255) | (tag[index] << 8)        
        
    keys = []    
    for round in range(rounds):                
        permutation(key, key, 0)#round + 1)        
        keys.append(key[:])
        
    for round in reversed(range(rounds)):           
        invert_permutation(data, keys[round], 0)#round + 1)                        
        
    for index in range(size):
        tag[index] = data[index] >> 8           
        data[index] = data[index] & 255
        
import crypto
from crypto.utilities import replacement_subroutine

class Test_Cipher(crypto.Cipher):
    
    def _get_key(self):
        return list(self._key)
    def _set_key(self, value):
        self._key = value
    key = property(_get_key, _set_key)
    
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.rounds = 1
        self.blocksize = 8
        key = self.key
        self.key = [key[index] | (key[index + 1] << 8) for index in range(0, len(key), 2)]
    #def encrypt_block(self, data, key, tag):        
    #    _data = list(data)        
    #    encrypt_bytes(_data, list(key), tag, self.rounds)        
    #    replacement_subroutine(data, _data)
         
    def encrypt_block(self, plaintext, key, tag):            
        #assert tag
        data = list(plaintext)
        assert isinstance(key, list)
        encrypt_bytes(data, key[:], tag)        
        for index, byte in enumerate(data):
            plaintext[index] = byte 
            
    def decrypt_block(self, data, key, tag):        
        _data = list(data)
        decrypt_bytes(_data, key[:], tag, self.rounds)        
        replacement_subroutine(data, _data)        
        
    def encrypt(self, data, iv=None, tag=None, authenticated_data=''): 
        assert tag is not None
        data = bytearray(data)       
        ciphertext = super(Test_Cipher, self).encrypt(data, iv, tag)
        #if authenticated_data:
        #    super(Test_Cipher, self).encrypt(authenticated_data, iv, tag)
        return bytes(data)            
        
    def decrypt(self, ciphertext, iv, tag, initial_tag, authenticated_data=''):
        plaintext = super(Test_Cipher, self).decrypt(ciphertext, iv, tag)
        #if authenticated_data:
        #    super(Test_Cipher, self).encrypt(authenticated_data, iv, tag)
        if tag == initial_tag:
            print "Tag valid!"  
        assert tag == initial_tag, (tag, initial_tag, plaintext)
        return plaintext

    @classmethod
    def test_encrypt_decrypt(cls, *args, **kwargs):
        cipher = cls(*args, **kwargs)
        message = "\x00" * 16
        iv = "\x00" * 16
        tag = [0 for byte in range(16)]
        initial_tag = tag[:]
        ciphertext = cipher.encrypt(message, iv, tag)        
        plaintext = cipher.decrypt(ciphertext, iv, tag, initial_tag)
        assert message == plaintext, (message, plaintext)
        
def test_crypt_bytes():
    tag = [1, 1, 1, 1]
    data = [0, 0, 0, 0]            
    key = [0, 0, 0, 0]
    rounds = 2
    encrypt_bytes(data, key[:], tag, rounds)
    print data, tag
    decrypt_bytes(data, key[:], tag, rounds)
    print data, tag
    
    cipher = Test_Cipher([0] * 16, "cbc")
    cipher.encrypt_block(data, key, tag)
    print data, tag
    cipher.decrypt_block(data, key, tag)
    print data, tag
    
def test_cipher_hash():
    cipher = Test_Cipher([0 for byte in range(16)], "ecb")
    cipher.blocksize = 16
    print cipher.hash("\x00", [0xff] * 16)
   
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(cipher.hash)
    
if __name__ == "__main__":
    test_crypt_bytes()
    #test_cipher_hash()
    Test_Cipher.test_encrypt_decrypt([0 for byte in range(16)], "cbc")
    #Test_Cipher.test_metrics([0 for count in range(16)], "\x00" * 16)