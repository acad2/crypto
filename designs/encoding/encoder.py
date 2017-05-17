from crypto.utilities import random_bits, random_bytes, slide

from transposition import bit_transposition

def encoder(data_bits, encode_bit):
    output = []
    for index, bit in enumerate(data_bits):
        output.extend(encode_bit(bit))
    return output
    
def decoder(encoded_bits, decode_bit, block_size):    
    return [decode_bit(block) for block in slide(encoded_bits, block_size)]        
    
def keyed_encoder(data_bits, encode_bit, key):
    encoded_bits = encoder(data_bits, encode_bit)
    transposed_bits = bit_transposition(encoded_bits, *key)
    return transposed_bits        
    
def test_encoder_decoder():    
    bits = random_bits(16)
    keys = [((item & 15) | 1) for item in bytearray(random_bytes(16))]
    
    import majorityencoding
    import choiceencoding    
    print ''.join((str(item) for item in bits))
    for encode_bit, decode_bit in [(item.encode_bit, item.decode_bit) for item in (majorityencoding, choiceencoding)]:
        encoded_bits = encoder(bits, encode_bit)                
        decoded_bits = decoder(encoded_bits, decode_bit, 3)
        assert decoded_bits == bits
    
    bits = [0] * 43
    encoded_bits = encoder(bits, choiceencoding.encode_bit)
    assert len(encoded_bits) == 128, len(encoded_bits)
    print encoded_bits
    
if __name__ == "__main__":
    test_encoder_decoder()