import pride.crypto.designs.hash.sponge
from pride.crypto.designs.hash.sponge import symmetric_primitive_factory
from pride.crypto.utilities import slide, xor_sum, generate_s_box

ASCII_CONSTANT = ''.join(chr(x) for x in xrange(256))
                                
def one_way_function_base_conversion(old_value, tweak=ASCII_CONSTANT):
    new_base = tweak           
    old_base_mapping = {}
    old_value = ''.join(reversed(bytes(old_value)))
    for index, symbol in enumerate(slide(old_value, 2)):
        old_base_mapping[symbol] = index
   
    _old_value = bytearray(old_value)    
    
    xor_key = xor_sum(_old_value)    
    old_base_size = len(old_base_mapping)    
    decimal_value = (xor_key +
                     sum(((xor_key ^ old_base_mapping[value_representation]) * (old_base_size ** power) for
                           power, value_representation in enumerate(slide(old_value, 2)))))
    #decimal_value = xor_key
    #for power, value_representation in enumerate(slide(old_value, 2)):
    #    decimal_value += (xor_key ^ old_base_mapping[value_representation]) * (old_base_size ** power)                                
        
    new_value = ''    
    new_base_size = len(new_base)    
    new_value = ''
    while decimal_value > 0 or not new_value: # divmod = divide and modulo in one action 
        decimal_value, digit = divmod(decimal_value, new_base_size)
        new_value += new_base[digit]
    return ''.join(reversed(new_value))
              
S_BOX = generate_s_box(lambda number: pow(251, number, 257) % 256)

def one_way_function_s_box(data, s_box=S_BOX): 
    """ Non invertible function. Uses an s_box, so is vulnerable to timing attacks.
        The default s_box has a bad differential characteristic, but can be 
        changed to any 8x8 bit nonlinear mapping. """
    state = xor_sum(data)    
    for index, byte in enumerate(data):        
        data[index] = s_box[s_box[byte] ^ s_box[index] ^ state] 
        
def permute(data, key, index):
    right_byte = data[index] # right_byte = 16 bit unsigned int
    right_byte += key[index] # increment, potentially overflowing low order byte
    data[index - 1] = (data[index - 1] + (right_byte >> 8)) & 255 # add any bits in high order byte to next byte
    
    right_byte &= 255 # mask to 8 bit unsigned int, truncating the high order byte that was just used
    data[index] = right_byte                    
    
    data[index - 1] ^= ((right_byte >> 3) | (right_byte << (8 - 3))) & 255 # rotate and xor; helps nonlinearity + diffusion
    
def permutation(data, key):    
    size = len(data)
    for index in reversed(xrange(1, size)):  
        permute(data, key, index)        
    # wrap the first byte around to the last byte
    index = 0
    permute(data, key, index)

def _permute_hash(data):
    key = range(len(data))    
    for round in range(2):
        permutation(data, key)             
    return data        
    
sbox_hash, sbox_hash_encrypt, sbox_hash_decrypt = symmetric_primitive_factory(one_way_function_s_box)
base_conversion_hash, base_conversion_encrypt, base_conversion_decrypt = symmetric_primitive_factory(one_way_function_base_conversion)
permute_hash, permute_encrypt, permute_decrypt = symmetric_primitive_factory(_permute_hash)                                                                
                                 
def test_one_way_function():
    from os import urandom
    print one_way_function("\x00")#chr(123)), chr(123)
    print
    print one_way_function("The quick brown fox jumps over the lazy dog" * 20)
    print
    print one_way_function("The quick brown fox jumps over the lazy cog" * 20)
    outputs = []
    import itertools
    for _bytes in (chr(byte1) + chr(byte2) for byte1, byte2 in itertools.product(range(256), range(256))):        
        output = one_way_function(_bytes)
        outputs.append(output)
     #   print output
    print len(set(outputs)), len(outputs), set([len(output) for output in outputs])
    
if __name__ == "__main__":
    from pride.crypto.analysis.metrics import test_hash_function, test_block_cipher
    #test_hash_function(sbox_hash)
    #test_hash_function(base_conversion_hash)
    #test_hash_function(permute_hash)
    #test_block_cipher(permute_encrypt, "\x00" * 32, "\x00" * 32)
    test_block_cipher(sbox_hash_encrypt, "\x00" * 32, "\x00" * 32)
    