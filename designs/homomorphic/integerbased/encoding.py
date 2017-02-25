from os import urandom

from utilities import addition_subroutine, modular_inverse, multiplication_subroutine, modular_subtraction, slide
from constants import DEFAULT_MODULUS
            
def encode(data, modulus=DEFAULT_MODULUS):
    """ usage: encode(data, modulus=DEFAULT_MODULUS) => encoded_data
    
        Given data, returns encoded data.
        Encoding process:
            - Generate a random_byte
            - Generate a corresponding_byte: (message_byte - random_byte)
            - Output random_byte, corresponding_byte
            - Repeat for consecutive inputs

        The goal of the encoding is to imbue a successive encryption with resistance to chosen plaintext attack.
        If the ciphertext is to have a homomorphic property, then the encoding operation must support the desired homomorphic property. """         
    size = len(data)    
    output = list(bytearray(urandom(size)))
    for index, data_byte in enumerate(data):          
        other_key_byte = (data_byte + output[index]) % DEFAULT_MODULUS
        output.append(other_key_byte)
    return output

def decode(encoded_data, modulus=DEFAULT_MODULUS):  
    """ usage: decode(encoded_data, modulus=DEFAULT_MODULUS) => decoded data
    
        Given encoded data, returns data
        Decoding process:
            - For each random_byte, corresponding_byte pair, output random_byte + corresponding_byte """            
    data_size = len(encoded_data) / 2
    output = encoded_data[:]
    for index in range(data_size):        
        output[index] = modular_subtraction(output[index + data_size], output[index], modulus)
    return output[:data_size]

def test_encode_decode():
    data1 = bytearray(1)
    data2 = bytearray(1)
    data1[0] = 1
    data2[0] = 2
    encoded_data1 = encode(data1)
    encoded_data2 = encode(data2)    
    addition_subroutine(encoded_data1, encoded_data2, DEFAULT_MODULUS)
    assert decode(encoded_data1)[0] == 3, (decode(encoded_data1)[0], 3)
    
if __name__ == "__main__":
    test_encode_decode()
    
    