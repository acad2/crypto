import pprint
from crypto.utilities import hamming_weight

#def build_test(sbox):
#    approximations = {}
#    for byte in range(256):
#        for operator in (operator.xor, operator.and_, modular_addition, 
#                         modular_multiplication, moduler_exponentiation,
#                         rotate, 
#        for value in range(1, 256):
#            first_input = byte
#            second_input = byte & value
    
    
def build_linear_approximation_table(sbox, exhaustive=False):
    approximations = {}
    sbox_size = len(sbox)
    if exhaustive:
        for byte in range(sbox_size):        
            for mask1 in range(1, sbox_size):                       
                for mask2 in range(1, sbox_size):                    
                    input = byte
                    input_parity = hamming_weight(input & mask1) % 2
                    output_parity = hamming_weight(sbox[input] & mask2) % 2
                                    
                    if input_parity == output_parity:
                        try:
                            approximations[(mask1, mask2)] += 1
                        except KeyError:
                            approximations[(mask1, mask2)] = 1
    else:
        for byte in range(sbox_size):        
            for mask1 in range(1, sbox_size):                     
                mask2 = mask1 
                input = byte
                input_parity = hamming_weight(input & mask1) % 2
                output_parity = hamming_weight(sbox[input] & mask2) % 2
                                
                if input_parity == output_parity:
                    try:
                        approximations[(mask1, mask2)] += 1
                    except KeyError:
                        approximations[(mask1, mask2)] = 1        
    return approximations
    
def find_best_linear_approximation(sbox):
    table = build_linear_approximation_table(sbox)
    max_value = max_key = 0
    for key, value in table.iteritems():
        if value > max_value:
            max_value = value
            max_key = key
    return (max_key, max_value)
    
def calculate_linearity(sbox, bits=8, max_key_max_value=None):
    if not max_key_max_value:
        max_key_max_value = find_best_linear_approximation(sbox)
    return max_key_max_value[0], abs(max_key_max_value[1] - ((2 ** bits) / 2))

def dump_linear_approximation_table(sbox, filename, exhaustive=True):
    table = build_linear_approximation_table(sbox, exhaustive)
    with open(filename, 'w') as _file:
        _file.write(pprint.pformat(table))
        
def test_dump_linear_approximation_table():
    from crypto.designs.blockcipher.aes_procedures import S_BOX
    dump_linear_approximation_table(S_BOX, "aes_sbox_lat", False)
    
def test_build_linear_approximation_table():
    from crypto.designs.blockcipher.blockcipher import S_BOX as sbox
    approximations = build_linear_approximation_table(sbox)
    import pprint
    pprint.pprint(approximations)
    
def test_find_best_linear_approximation():
    from crypto.designs.blockcipher.aes_procedures import S_BOX
    best_approximation = find_best_linear_approximation(S_BOX)
    print "Best approximation: ", best_approximation
    
if __name__ == "__main__":
    #test_build_linear_approximation_table()    
    test_find_best_linear_approximation()
    test_dump_linear_approximation_table()
    