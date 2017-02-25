from os import urandom
from utilities import addition_subroutine, modular_subtraction, subtraction_subroutine, multiplication_subroutine, modular_inverse

DEFAULT_MODULUS = 256

def encode(data, modulus=DEFAULT_MODULUS):
    """ Return a randomized representation of data.
        Output is twice the size of the input.
        Output consists of random byte pairs that sum together to produce the data.
        Preserves additive homomorphic property. """    
    size = len(data)    
    output = list(bytearray(urandom(size)))
    for index, data_byte in enumerate(data):                        
        other_key_byte = modular_subtraction(data_byte, output[index], modulus)        
        output.append(other_key_byte)
    return output

def decode(encoded_data, modulus=DEFAULT_MODULUS):
    """ Returns data from encoded data. Output is half the size of encoded data. """
    data_size = len(encoded_data) / 2
    output = encoded_data[:]
    for index in range(data_size):        
        output[index] = (output[index] + output[index + data_size]) % modulus
    return output[:data_size]
    
def generate_key(data_size):
    return bytearray(urandom(data_size * 3))
    
def encrypt(message, key, key_addition_subroutine=multiplication_subroutine, modulus=DEFAULT_MODULUS):
    message_size = len(message)        
    key = [byte | 1 for byte in key]
    key_addition_subroutine(message, key[:message_size], modulus)
    message[:] = encode(message)          
    key_addition_subroutine(message, key[message_size:], modulus)    
    return message
            
def decrypt(ciphertext, key, key_removal_subroutine=multiplication_subroutine, modulus=DEFAULT_MODULUS, multiplier=1):   
    message_size = len(ciphertext) / 2
    key = [pow(modular_inverse(byte | 1, DEFAULT_MODULUS), multiplier, modulus) for byte in key]    
    key_removal_subroutine(ciphertext, key[message_size:], modulus)
    ciphertext[:] = decode(ciphertext)         
    key_removal_subroutine(ciphertext, key[:message_size], modulus)
    return ciphertext                
        
def test_encode_decode():
    data1 = list(bytearray(8))
    data2 = list(bytearray(8))
    data1[0] = 1
    data2[0] = 2
    _data1 = encode(data1)
    _data1 = decode(_data1)
    assert _data1 == data1, (_data1, data1)
    
    correct_answer = data1[:]        
    addition_subroutine(correct_answer, data2, DEFAULT_MODULUS)
        
    data1 = encode(data1)
    data2 = encode(data2)    
    addition_subroutine(data1, data2, DEFAULT_MODULUS)    
    answer = decode(data1)
    assert answer == correct_answer     
        
def test_encrypt_decrypt():
    data_size = 8
    message = list(bytearray(data_size))
    _message = message[:]
    key = generate_key(data_size)
    encrypt(message, key)    
    decrypt(message, key)
    assert message == _message, (message, _message)
    
    message2 = list(bytearray(range(8)))
    message3 = list(bytearray(reversed(range(8))))
    answer = list(bytearray((message2[index] + message3[index]) % DEFAULT_MODULUS for index in range(8)))
    answer2 = list(bytearray((message2[index] * message3[index]) % DEFAULT_MODULUS for index in range(8)))
    encrypt(message2, key)
    encrypt(message3, key)
    _m2, _m3 = message2[:], message3[:]
    addition_subroutine(message2, message3, DEFAULT_MODULUS)
    multiplication_subroutine(_m2, _m3, DEFAULT_MODULUS)
    
    _message2 = decrypt(message2, key, multiplier=1)
    __m2 = decrypt(_m2, key, multiplier=2)
   # print [byte for byte in _message2], [byte for byte in answer]
   # print [byte for byte in __m2], [byte for byte in answer2], __m2 == answer2, len(__m2), len(answer2), type(__m2), type(answer2)
    if _message2 == answer:
        print("Ciphertexts support addition")
    else:
        print("Ciphertexts do not support addition")
    if __m2 == answer2:
        print("Ciphertexts support multiplication")
    else:
        print("Ciphertexts do not support multiplication")
        
    def test_function(data, key, iv, mode=None):
        keysize, data_size = len(key), len(data) / 2
        key = bytearray(key)
        if keysize < data_size * 3:
            key.extend(urandom((data_size * 3) - keysize))
        data = bytearray(data[:data_size])
        encrypt(data, bytearray(key))
        return bytes(data)
            
    #from crypto.analysis.metrics import test_block_cipher
    #test_block_cipher(test_function, generate_key(16), "\x00" * 16)
    
if __name__ == "__main__":
    test_encode_decode()
    test_encrypt_decrypt()
    