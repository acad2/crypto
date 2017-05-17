from crypto.utilities import random_bits
import math

# majority with variable length input
def majority(bits):    
    if not len(bits) % 2: 
        raise ValueError("len(bits) must be odd to calculate majority")    
    return int(math.floor(.5 + (float(sum(bits)) / len(bits))))             
    
def encode_bit(data_bit, encoding_size=3):
    encoded_bit = random_bits(encoding_size)    
    while majority(encoded_bit) != data_bit:
        encoded_bit = random_bits(encoding_size)  
    return encoded_bit
    
def decode_bit(encoded_bits):
    return majority(encoded_bits)
            
def test_encode_bit_decode_bit():
    for count in range(3, 32, 2):
        for bit in range(2):            
            encoded_bit =  encode_bit(bit, count)           
            decoded_bit = decode_bit(encoded_bit)            
            assert decoded_bit == bit
    print("majority encode_bit/decode_bit unit test passed")
                    
if __name__ == "__main__":
    test_encode_bit_decode_bits()    
        