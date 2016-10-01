from pride.crypto.utilities import xor_sum, rotate_left, rotate_right, slide, xor_subroutine, integer_to_bytes, bytes_to_words, words_to_bytes

def shuffle_bytes(_state, temp=list(range(16))):          
    temp[7] = _state[0] 
    temp[12] = _state[1]
    temp[14] = _state[2]
    temp[9] = _state[3]
    temp[2] = _state[4]
    temp[1] = _state[5]
    temp[5] = _state[6]
    temp[15] = _state[7]
    temp[11] = _state[8]
    temp[6] = _state[9]
    temp[13] = _state[10]
    temp[0] = _state[11]
    temp[4] = _state[12]
    temp[8] = _state[13]
    temp[10] = _state[14]
    temp[3] = _state[15]
            
    _state[:] = temp[:]
           
def prp(data, mask=255, rotation_amount=5, bit_width=8):     
    shuffle_bytes(data)
    key = xor_sum(data)
    
    key ^= data[0]
    data[0] = (data[0] + key) & mask
    key ^= data[0]
        
    for index in range(len(data)):       
        left, right = data[index], data[(index + 1) % 16]
        
        key ^= right
        right = rotate_left((right + key + index) & mask, rotation_amount, bit_width)
        key ^= right
        
        key ^= left
        left = (left + (right >> (bit_width / 2))) & mask
        left ^= rotate_left(right, rotation_amount)
        key ^= left
        
        #print "\nSet left:", index, left
        #print "Set right: ", (index + 1) % 16, right
        data[index], data[(index + 1) % 16] = left, right                 
    
    return key
        
def prf(data, key, mask=255, rotations=5, bit_width=8):    
    for index in range(len(data)):        
        new_byte = rotate_left((data[index] + key + index) & mask, rotations, bit_width)
        key ^= new_byte
        data[index] = new_byte            
                  
def stream_cipher(data, seed, key, size=(8, 255, 5)):     
    key = list(key)
    seed = list(seed)
    key_material = list()
    key_xor = xor_sum(key)    
    bit_width, mask, rotation_amount = size    
        
    block_count, extra = divmod(len(data), 16)   
    
    for block in range(block_count + 1 if extra else block_count):       
    
        key_xor = prp(key, mask, rotation_amount, bit_width) 
        round_key = key[:]
        prf(round_key, key_xor, mask, rotation_amount, bit_width)
                
        xor_subroutine(seed, round_key)                           
        prp(seed, mask, rotation_amount, bit_width)                
        xor_subroutine(seed, round_key)
        
        prf(seed, xor_sum(seed), mask, rotation_amount, bit_width)        
        
        key_material.extend(seed)
    xor_subroutine(data, key_material)    
    
from streamcipher2 import stream_cipher
    
def encrypt(data, key, seed, size=(8, 255, 5)):
    stream_cipher(data, seed, key, size)
    
def decrypt(data, key, seed, size=(8, 255, 5)):
    encrypt(data, key, seed, size)
    
import pride.crypto

class Stream_Cipher(pride.crypto.Cipher):
    
    def encrypt(self, data, key, iv, size=(8, 255, 5)): 
        key += "\x00" * (16 - len(key))                        
        iv += "\x00" * (16 - len(iv))                
        output = bytearray(data)
        encrypt(output, bytearray(key), bytearray(iv), size)
        return bytes(output)
        
    def decrypt(self, data, key, iv):
        return self.encrypt(data, key, iv)
     
    @classmethod
    def test_encrypt_decrypt(cls, *args, **kwargs):
        cipher = cls(*args, **kwargs)
        
        message = bytearray(16)
        iv = bytearray(16)        
        message[-1] = 1
        
        ciphertext = cipher.encrypt(message, "\x00" * 16, iv)        
        print ciphertext
        plaintext = cipher.decrypt(ciphertext, "\x00" * 16, iv)
        assert message == plaintext, (message, plaintext)
        print "Passed encrypt/decrypt test"
        
    @classmethod
    def test_performance(cls, *args, **kwargs):  
        from pride.crypto.analysis.metrics import test_cipher_performance
        cipher = cls("\x00" * 16, None)
        test_cipher_performance((32, 1500, 4096, 1024 * 1024), cipher.encrypt, "\x00" * 16, "\x00" * 16)
    
    @classmethod
    def test_metrics(cls, *args, **kwargs):
        from pride.crypto.analysis.metrics import test_stream_cipher
        cipher = cls(*args)
        test_stream_cipher(cipher.encrypt, "\x00" * 16, "\x00" * 16, **kwargs)
        
        
class Stream_Cipher64(Stream_Cipher):
            
    def encrypt(self, data, key, iv, size=(64, (2 ** 64) - 1, 40)):
        word64 = lambda _data: bytes_to_words(bytearray(_data), 8)
        output = word64(data)
        key += "\x00" * (128 - len(key))        
        key = word64(key)
        assert len(key) == 16, len(key)
        iv += "\x00" * (128 - len(iv))
        assert len(iv) == 128, len(iv)
        iv = word64(iv)
        assert len(iv) == 16, len(iv)
        encrypt(output, key, iv, size)
        return bytes(words_to_bytes(output, 8))
        
        
def generate_params_for_wordsize(wordsize):    
    wordsize_bits = wordsize * 8
    mask = (2 ** wordsize_bits) - 1
    rotations = 5 * wordsize
    size = (wordsize_bits, mask, rotations)
    return size
    
def test_stream_cipher_diffusion():
    wordsize = 1
    size = generate_params_for_wordsize(wordsize)    
    seed = bytes_to_words(bytearray(16 * wordsize), wordsize)
    
    key = seed[:]
    seed2 = key[:]  
    seed3 = key[:]
    
    seed2[-2] = 1 
    seed3[-2] = 2
    data = seed[:]
    data2 = data[:]
    data3 = data[:]
        
    stream_cipher(data, seed, key, size)
    stream_cipher(data2, seed2, key[:15] + [1], size)
    stream_cipher(data3, seed3, key[:14] + [1, 0], size)
    
    _bytes = lambda _data: words_to_bytes(_data, wordsize)
    bits = lambda _data: ''.join(format(byte, 'b').zfill(8) for byte in _bytes(_data))
    
    print _bytes(data)
    #print
    #print _bytes(data2).count('1')
    #print
    #print _bytes(data3).count('1')
    
    #seed = bytearray(16)
    #key = seed[:]
    #seed2 = seed[:]
    #key2 = seed[:]
    #key2[-1] = 1
    #
    #data = bytearray(stream_cipher(seed, key))
    #data2 = bytearray(stream_cipher(seed2, key2))
    #
    #print [format(byte, 'b').zfill(8) for byte in data]
    #print
    #print [format(byte, 'b').zfill(8) for byte in data2]
    
def test_prp_diffusion():
    data = bytearray(16)
    data2 = data[:]
    data3 = data2[:]
    data[-1] = 0
    data2[-1] = 2
    data3[-2] = 1
    for round in range(1):
        xor = prp(data)
        print xor
        prf(data, xor)
        #prp(data2)
        #prp(data3)
    
    print data
    print [byte for byte in data]
    
    #binary = lambda _data: ''.join(format(byte, 'b').zfill(8) for byte in _data)
    #print binary(data)
    #print
    #print binary(data2)
    #print
    #print binary(data3)
    #
    #xor_subroutine(data, data3)
    #print binary(data).count('1')
    #xor_subroutine(data2, data3)
    #print binary(data2).count('1')
    
        
if __name__ == "__main__":
    #Stream_Cipher64.test_encrypt_decrypt("\x00" * 16, "stream!")
    Stream_Cipher64.test_metrics("\x00" * 16, "\x00" * 16)
    #Stream_Cipher.test_performance()
    #Stream_Cipher.test_metrics("\x00" * 16, "\x00" * 16)
    #test_stream_cipher_diffusion()
    #test_prp_diffusion()
    