import itertools

from crypto.utilities import slide, cast, rotate, replacement_subroutine

DEFAULT_FUNCTION_NAME = "S-BOX"

def get_xor_expression(*args, **kwargs):
    function_name = kwargs.get("function_name", DEFAULT_FUNCTION_NAME)
    arguments = []
    for arg in args:
        if isinstance(arg, tuple) or isinstance(arg, list):       
            line = "\n      {}[".format(function_name)
            line += get_xor_expression(*arg) + ']'   
            arguments.append(line)
        else:
            arguments.append(arg)
    return " xor ".join(arguments)
    
def test_get_xor_expression():
    cipher_bytes = []
    data = ["B{}".format(count) for count in range(8)]
    _key = key = ["K{}".format(count) for count in range(8)]
    expressions = []
    for index in range(8):
        expressions.append("(C{} = {}) # end C{}\n".format(index, get_xor_expression(data.pop(0), 
                                                                                   key.pop(0),
                                                                                   cipher_bytes + data + key),
                                                         index))
        cipher_bytes.append(expressions[-1])         
    return expressions
    
def p_box(input_bytes):    
    """ Data concentrating permutation box. Evenly distributes input bits amongst output. """
    bits = cast(bytes(input_bytes), "binary")      
    # if a 64 bit block was acceptable, the operation would be this simple:
    #   for index, byte in enumerate(int(bits[index::8], 2) for index in range(8)):
    #       input_bytes[index] = byte  
    
    bit_count = len(bits)
    word_size = bit_count / 8
    word_size_in_bytes = word_size / 8
    for index in range(8):
        bits_at_index = bits[index::word_size]
        _index = index * word_size_in_bytes    
        
        for offset, _bits in enumerate(slide(bits_at_index, 8)):   
            input_bytes[_index + offset] = int(_bits, 2)
           
def bit_shuffle(data, key, indices):
    for index in indices:
        data = rotate(data[:index], key[index]) + data[index:]
    return data
    
SUBSTITUTION = dict((x, pow(251, x, 257) % 256) for x in xrange(1024 * 1024))
            
def prime_generator():
    """ Generates prime numbers in successive order. """
    primes = [2]
    yield 2
    for test_number in itertools.count(3, 2):
        for prime in primes:
            if not test_number % prime:
                break
        else:
            yield test_number
            primes.append(test_number)

generator = prime_generator()
#PRIMES = [next(generator) for count in range(2048)]
del generator          
# end of helper functions
                                                
def unpack_factors(bits, initial_power=0, initial_output=1, power_increment=1):   
    """ Unpack encoded (prime, power) pairs and compose them into an integer.
        Each contiguous 1-bit increments the exponent of the current prime.
        Each zero advances to the next prime and composes the current prime and
        exponent into the output.
        
        For example:
            
            11001101
            
        Is interpreted to mean:
            
            (2 ** 2) * (3 ** 0) * (5 ** 2) * (7 ** 1)
            
        The bits that previously represented the number 205 are composed and 
        result in the integer 700. """    
    if '1' not in bits:
        return 0 
    variables = iter(PRIMES)#prime_generator()
    variable = next(variables)
    power = initial_power
    output = initial_output   
    last_bit = len(bits) - 1
    for bit in bits[:-1]:
        if bit == '1':
            power += power_increment
        else:                        
            output *= variable ** power
            power = initial_power        
            variable = next(variables)              
    if bits[-1] == '1':
        power += power_increment    
    output *= variable ** power       
    return output            
        
aes_s_box = [0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5, 0x30, 0x01, 0x67,
            0x2b, 0xfe, 0xd7, 0xab, 0x76, 0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59,
            0x47, 0xf0, 0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0, 0xb7,
            0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc, 0x34, 0xa5, 0xe5, 0xf1,
            0x71, 0xd8, 0x31, 0x15, 0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05,
            0x9a, 0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75, 0x09, 0x83,
            0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0, 0x52, 0x3b, 0xd6, 0xb3, 0x29,
            0xe3, 0x2f, 0x84, 0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b,
            0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf, 0xd0, 0xef, 0xaa,
            0xfb, 0x43, 0x4d, 0x33, 0x85, 0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c,
            0x9f, 0xa8, 0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5, 0xbc,
            0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2, 0xcd, 0x0c, 0x13, 0xec,
            0x5f, 0x97, 0x44, 0x17, 0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19,
            0x73, 0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88, 0x46, 0xee,
            0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb, 0xe0, 0x32, 0x3a, 0x0a, 0x49,
            0x06, 0x24, 0x5c, 0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
            0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9, 0x6c, 0x56, 0xf4,
            0xea, 0x65, 0x7a, 0xae, 0x08, 0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6,
            0xb4, 0xc6, 0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a, 0x70,
            0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e, 0x61, 0x35, 0x57, 0xb9,
            0x86, 0xc1, 0x1d, 0x9e, 0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e,
            0x94, 0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf, 0x8c, 0xa1,
            0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68, 0x41, 0x99, 0x2d, 0x0f, 0xb0,
            0x54, 0xbb, 0x16]    
            
def invert_sbox(sbox):
    inverted = bytearray(len(sbox))
    for index, byte in enumerate(sbox):
        inverted[byte] = index
    return inverted
    
def generate_sboxes():
    """ Finds the all N < 256 for N ** exponent mod 257 mod 256 that produce one to one mappings,
        and their inverses. """
    sboxes = []
    for number in range(256):
        values = bytearray()
        for exponent in range(256):
            values.append(pow(number, exponent, 257) % 256)
        if len(set(values)) == 256:
            sboxes.append(values)
    
    inverses = []
    for sbox in sboxes:
        inverses.append(invert_sbox(sbox))
    sboxes.extend(inverses)
    return sboxes
    
def shuffle(data, key, indices):
    output = data[:]
    for index, place in indices:        
        output = rotate(output[:index + 1], key[index]) + output[index + 1:]    
    replacement_subroutine(data, output)            
    
def exotic_padding(hash_input, rate):
    hash_input += '1'
    while len(hash_input) < rate: 
        hash_input = cast(unpack_factors(cast(hash_input, "binary")), "bytes")
    return hash_input
    
def test_shuffle():
    data = bytearray("Testing")
    key = bytearray("0123456")
    indices = zip((1, 3, 0, 2, 6, 5, 4), range(7))
    shuffled = shuffle(data, key, indices)    
    unshuffled = shuffle(shuffled, tuple(-byte for byte in key), reversed(indices))
    assert unshuffled == data, (unshuffled, data)
    
if __name__ == "__main__":
    test_shuffle()
    