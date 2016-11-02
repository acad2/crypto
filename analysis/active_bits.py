import itertools
from math import log

from crypto.utilities import integer_to_bytes, bytes_to_integer, slide, rotate_left

def next_bit_permutation(v, mask=0xFFFFFFFF):
    t = (v | (v - 1)) + 1
    return (t | ((((t & -t) / (v & -v)) >> 1) - 1)) & mask
    
def bit_generator(seed_weight, mask=0xFFFFFFFF):    
    while True:    
        print format(seed_weight, 'b').zfill(32)
        yield seed_weight
        if not seed_weight:
            break        
        seed_weight = next_bit_permutation(seed_weight, mask)    
            
def hamming_weight(word):
    return format(word, 'b').count('1')
    
QUICK_TEST = lambda:  bit_generator(int(('1' * 31) + '0', 2)) #itertools.chain(bit_generator(1), bit_generator(int('0' + ('1' * 31), 2)))
THOROUGH_TEST = lambda: itertools.chain(bit_generator(1), bit_generator(int('0' + ('1' * 31), 2)), bit_generator(3))

def search_minimum_active_bits(permutation, argument_function, output_function, display_progress=True, test_inputs=QUICK_TEST):
    """ Searches for the minimum number of active bits for permutation.
        
        - permutation is the function to be tested. 
        
        - argument_function receives test inputs and returns them an a form appropriate for the interface of the permutation function
            - argument_function is used to adapt the test inputs to your functions interface
            - Arguments are the series (1, 0, 0, 0), (1, 0, 0, 1), (1, 0, 0, 2), (1, 0, 0, 3) ... (1, 0, 0, 255), (1, 0, 1, 0) ...
            - Arguments are supplied to argument_function, which should return inputs in an appropriate form for the interface of the permutation
            - A permutation function which accepts as arguments 4 integers can use an argument_function that simply returns the inputs.
        
        - output_function receives as input the outputs of the permutation, and returns them in form (a, b, c, d)
            - Does the opposite of argument_function, adapts the permutations output to the interface of the test
            
        Example:                
        
            def permutation_function(a, b, c, d):
                # permute stuff
                ...
                return a, b, c, d
                
            def argument_function(a, b, c, d):
                # no change needed because permutation operates on 4 inputs already        
                return a, b, c, d
            
            def output_function(a, b, c, d):
                # no change needed because permutation outputs 4 items already
                return a, b, c, d"""                                  
    active_bits = list()
    weights = list()    
                              
    last_x = 0
    last_output = output_function(permutation(argument_function(1, 0, 0, 0)))
    for x, y in itertools.product(test_inputs(), test_inputs()):        
        for count, z in enumerate(test_inputs()):                
            output = output_function(permutation(argument_function(0, x, y, z)))                  
            output_hamming_weight = sum(hamming_weight(word) for word in output)                
            weights.append(output_hamming_weight)
            
            number_different_bits = sum(hamming_weight(word) for word in (last_output[index] ^ _output for index, _output in enumerate(output)))
            active_bits.append(number_different_bits)
        
        if display_progress and x != last_x:
            last_x = x            
            print("\n" + ('-' * 79))
            print("Minimum # active bits: {}".format(min(active_bits)))
            print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
            print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
            print("Maximum # active bits: {}".format(max(active_bits)))        
            print("Minimum state weight : {}".format(min(weights)))
            
    weights.pop(-1) # remove the 0, 0, 0 entries
    active_bits.pop(-1)
    print("\nSearch complete" + ('-' * (80 - len("\nSearch complete"))))
    print("Search space: 2 ** {}".format(log(count ** 3, 2)))
    print("Minimum # active bits: {}".format(min(active_bits)))
    print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
    print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
    print("Maximum # active bits: {}".format(max(active_bits)))        
    print("Minimum state weight : {}".format(min(weights)))
        
def test_search_minimum_active_bits():
    from crypto.designs.permutation import permutation3
    search_minimum_active_bits(lambda args: permutation3.permutation(*args), lambda *args: args, lambda args: args)
    
def demo_aes_active_bits():    
    from crypto.designs.blockcipher.aes_procedures import aes_round_no_key
    
    def test_function(state):
        aes_round_no_key(state)
        aes_round_no_key(state)
        return state
        
    def argument_function(a, b, c, d):
        return integer_to_bytes(a, 4) + integer_to_bytes(b, 4) + integer_to_bytes(c, 4) + integer_to_bytes(d, 4)                
        
    def output_function(state):
        return tuple(bytes_to_integer(section) for section in slide(state, 4))
    
    search_minimum_active_bits(test_function, argument_function, output_function)
    
if __name__ == "__main__":
    test_search_minimum_active_bits()
    #demo_aes_active_bits()
    