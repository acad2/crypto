import os    

import crypto
from crypto.utilities import xor_sum, xor_subroutine, replacement_subroutine

def convert(old_value, old_base, new_base):
    old_base_size = len(old_base)    
    old_base_mapping = dict((symbol, index) for index, symbol in enumerate(old_base))
            
    for leading_zero_count, symbol in enumerate(old_value):
        if old_base_mapping[symbol]:
            break
    zero_padding = new_base[0] * leading_zero_count
    
    decimal_value = sum((old_base_mapping[value_representation] * (old_base_size ** power) for
                         power, value_representation in enumerate(reversed(old_value))))
    
    # this is the above in a potentially more readable format:
    # decimal_value = 0    
    # for power, value_representation in enumerate(reversed(old_value)):
    #     decimal_value += old_base_mapping[value_representation]*(old_base_size**power)
                            
    if decimal_value:
        new_base_size = len(new_base)    
        new_value = ''
        while decimal_value > 0: # divmod = divide and modulo in one action
            decimal_value, digit = divmod(decimal_value, new_base_size)
            new_value += new_base[digit]
    return zero_padding + ''.join(reversed(new_value))  
    
def shuffle(data, key): 
    n = len(data)
    for i in reversed(range(1, n)):
        j = key[i] & (i - 1)
        data[i], data[j] = data[j], data[i]
    
def generate_key(size=256, seed=None):
    if seed is None:
        key = bytearray(range(size))            
    else:
        key = bytearray(seed)
        size = len(seed)
    _key = bytearray(os.urandom(size))
    shuffle(key, _key)    
    return key
    
def diffusion_transformation(_bytes):
    state = xor_sum(_bytes)
    size = len(_bytes)
    for index, byte in enumerate(_bytes):                        
        state ^= _bytes[index]
        _bytes[index] = (_bytes[index] + state + index) % 256
        state ^= _bytes[index]
        
    #    random_index = (state + index) % size
    #    state ^= _bytes[random_index]
    #    _bytes[random_index] = (_bytes[random_index] + state + index) % 256
    #    state ^= _bytes[random_index]
    #    
        state ^= _bytes[index]
        _bytes[index] = (_bytes[index] + state + index) % 256
        state ^= _bytes[index]

def invert_diffusion_transformation(_bytes):
    state = xor_sum(_bytes)
    size = len(_bytes) - 1
    for index, byte in enumerate(reversed(_bytes)):
        index = size - index        
        state ^= _bytes[index]        
        _bytes[index] = (256 + (_bytes[index] - (state + index))) % 256
        state ^= _bytes[index]
        
     #   random_index = (state + index) % size
     #   state ^= _bytes[random_index]
     #   _bytes[random_index] = (256 + (_bytes[random_index] - (state + index))) % 256
     #   state ^= _bytes[random_index]
     #   
        state ^= _bytes[index]
        _bytes[index] = (256 + (_bytes[index] - (state + index))) % 256
        state ^= _bytes[index]
            
def test_diffusion_transformation():
    inputs = bytearray(range(16))
    inputs2 = bytearray(range(15) + [16])
    print [byte for byte in inputs]
    print [byte for byte in inputs2]
    for x in range(4):
        print "Round: ", x
        print
        diffusion_transformation(inputs)    
        diffusion_transformation(inputs2)
        print inputs
        print
        print inputs2
        
    for x in range(4):
        invert_diffusion_transformation(inputs)
       # print inputs
        
def test_convert():
    
    key1, key2 = generate_key(), generate_key()

    assert len(set(key2)) == 256
    assert len(set(key1)) == len(set(key2))
    message = "Test message!"
    key1, key2 = bytes(key1), bytes(key2)
    converted = convert(message, key1, key2)
  #  print
  #  print
  #  print converted
  #  print
  #  print
    _message = convert(converted, key2, key1)
    assert _message == message, _message
    
    message2 = "Test message" + chr(ord('!') - 1)
    converted2 = convert(message2, key1, key2)
  #  print
  #  print converted2
    
    
def key_schedule(key):
    conversion_key = bytearray(range(256))
    shuffle(conversion_key, key)
    conversion_key2 = conversion_key[:]
    shuffle(conversion_key2, conversion_key2)  
    return conversion_key, conversion_key2
    
def encrypt(data, key, conversion_key, conversion_key2):
    xor_subroutine(data, key)                  
    
    diffusion_transformation(data)         
    converted = convert(bytes(data), bytes(conversion_key), bytes(conversion_key2))
    replacement_subroutine(data, converted)   
    
    xor_subroutine(data, key)
    return bytes(data)
    
def decrypt(data, key, conversion_key, conversion_key2):
    xor_subroutine(data, key)
        
    converted = convert(bytes(data), bytes(conversion_key2), bytes(conversion_key))
    replacement_subroutine(data, converted)        
    invert_diffusion_transformation(data)
    
    xor_subroutine(data, key)
    return bytes(data)
    
class Test_Cipher(crypto.Cipher):
     
    def __init__(self, *args):
        super(Test_Cipher, self).__init__(*args)
        self.key = os.urandom(256)
        self.blocksize = 256
        self.conversion_key, self.conversion_key2 = key_schedule(self.key)
        
    def encrypt_block(self, data, key):
        return encrypt(data, key, self.conversion_key, self.conversion_key2)
        
    def decrypt_block(self, data, key):
        return decrypt(data, key, self.conversion_key, self.conversion_key2)
        
        
def test_encrypt_decrypt():
    message = "\x00" * 16#    "A particularly excellent Test message of arbitrary length ;)"
    data = bytearray(message)
    key = bytearray(os.urandom(256))
    conversion_key, conversion_key2 = key_schedule(key)
  #  print data
    ciphertext = encrypt(data, key, conversion_key, conversion_key2)    
  #  print "Ciphertext: "
  #  print
    print ciphertext
  #  print
    plaintext = decrypt(bytearray(ciphertext), key, conversion_key, conversion_key2)
    assert plaintext == message, plaintext
    
    for x in range(1, 256):
        data2 = bytearray(message[:-1] + chr(x))
    #  print data2
        ciphertext2 = encrypt(data2, key, conversion_key, conversion_key2)
        print ciphertext2
    #  print
        plaintext2 = decrypt(bytearray(ciphertext2), key, conversion_key, conversion_key2)
        assert plaintext2 == message[:-1] + chr(x)
                               
if __name__ == "__main__":
    #test_convert()
    test_diffusion_transformation()
    #test_encrypt_decrypt()
    #Test_Cipher.test_metrics(avalanche_test=False)