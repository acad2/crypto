from pride.crypto.utilities import slide, pad_input, rotate_left

def hamming_weight(byte):
    # from http://stackoverflow.com/a/109025/3103584
    # "you are not meant to understand or maintain this code, just worship the gods that revealed it to mankind. I am not one of them, just a prophet"
    byte = byte - ((byte >> 1) & 0x55555555)
    byte = (byte & 0x33333333) + ((byte >> 2) & 0x33333333)
    return (((byte + (byte >> 4)) & 0x0F0F0F0F) * 0x01010101) >> 24  
    
def compression_function(eight_bytes):
    output = 0    
    for index, byte in enumerate(eight_bytes):
        output |= (hamming_weight(byte) << (3 * (7 - index)))        
    return output, output2
    
def extraction_function(eight_bytes):
    output = 0
    for index, byte in enumerate(eight_bytes):
        print format(abs(hamming_weight(byte) - hamming_weight(eight_bytes[(index + 1) % 8])) << (3 * (7 - index)), 'b').zfill(48)
        output |= abs(hamming_weight(byte) - hamming_weight(eight_bytes[(index + 1) % 8])) << (3 * (7 - index))
    return output
    
def test_extraction_function():
    _input = bytearray(8)
    for byte in range(256):
        _input[-1] = byte
        print (extraction_function(_input), 'b')#.zfill(24)
    
    
def choice(a, b, c):
    return (a & b) ^ (b | c)
    
def cast(_input, _type):
    if _type == "integer":        
        output = 0
        input_size = len(_input)
        for index, byte in enumerate(_input):
            output |= (byte << (8 * (input_size - 1 - index)))
        return output
        
def hamming_weight_hash(data, output_size=32):
    accumulator = 0    
    data = bytearray(pad_input(data[:], 32))    
    output = bytearray(output_size)
    for counter, word in enumerate(slide(data, 4)):
        word_weight = hamming_weight(cast(word, "integer"))
        accumulator += word_weight + choice(accumulator, word_weight, counter) + counter            
        output[counter] = (output[counter] + accumulator)
    return output
    
def test_hamming_weight_hash():
    input = bytearray(8)
    for byte in range(16):
        input[-1] = byte
        print hamming_weight_hash(input)
        
    #from pride.crypto.analysis.metrics import test_hash_function
    #test_hash_function(hamming_weight_hash)
    
if __name__ == "__main__":
    #test_hamming_weight_hash()
    test_extraction_function()
    