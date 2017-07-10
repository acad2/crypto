from crypto.utilities import random_bits

# choice encoding?
# represent input as a, b, c where choice(a, b, c) == input
# tranpose a, b, c
# output a, b, c

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def encode_bit(bit):
    a, b, c = random_bits(3)
    while choice(a, b, c) != bit:
        a, b, c, = random_bits(3)
    return a, b, c
    
def decode_bit(bits):    
    return choice(*bits)
    
def test_encode_bit_decode_bit():
    outputs = []
    for count in range(32):
        for bit in random_bits(8):            
            encoded_bit = choice_encode_bit(bit)
            decoded_bit = choice_decode_bit(encoded_bit)
            assert decoded_bit == bit
            outputs.append(encoded_bit)            
    print("choice_encode_bit/choice_decode_bit unit test passed")
    
if __name__ == "__main__":
    test_choice_encode_bit_choice_decode_bit()    