import itertools
from math import log

from crypto.utilities import integer_to_bytes, bytes_to_integer, slide, rotate_left

def next_bit_permutation(v, mask=0xFFFFFFFF):
    t = (v | (v - 1)) + 1
    return (t | ((((t & -t) / (v & -v)) >> 1) - 1)) & mask
    
def invert(word, mask=0xFFFFFFFF):
    return word ^ mask
    
def bit_generator(seed_weight, mask=0xFFFFFFFF):    
    _seed_weight = seed_weight    
    while True:                
        yield seed_weight    
        if not seed_weight:            
            break        
        seed_weight = next_bit_permutation(seed_weight, mask)    
    
   # seed_weight = _seed_weight
   # while True:                
   #     _seed_weight = invert(seed_weight, mask)     
   #     #yield _seed_weight
   #     if not seed_weight:
   #         break            
   #     seed_weight = next_bit_permutation(seed_weight, mask)
        
def hamming_weight(word):
    return format(word, 'b').count('1')
    
QUICK_TEST = lambda: bit_generator(1)
THOROUGH_TEST = lambda: itertools.chain(bit_generator(1), bit_generator(3))

def count_active_bits(function_input, output, last_input, last_output, active_bits):            
    number_different_bits = sum(hamming_weight(word) for word in (last_output[index] ^ _output for index, _output in enumerate(output)))            
   
    if number_different_bits: # hack; get rid of duplicate inputs   
        input_difference = sum(hamming_weight(word) for word in (last_input[index] ^ _input for index, _input in enumerate(function_input)))
        active_bits.append(number_different_bits + input_difference)
        
def display_active_bits_progress(active_bits, weights):            
    print("Minimum # active bits: {}".format(min(active_bits)))
    print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
    print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
    print("Maximum # active bits: {}".format(max(active_bits)))        
    print("Minimum state weight : {}".format(min(weights)))
    
def count_active_sboxes(function_input, output, last_input, last_output, active_words, sbox_size=8):
    state = bytearray()
    _function_input = []
    _output = []
    _last_input = []
    _last_output = []
    for index in range(len(function_input)):
        _function_input.extend(integer_to_bytes(function_input[index], 4))
        _output.extend(integer_to_bytes(output[index], 4))
        _last_input.extend(integer_to_bytes(last_input[index], 4))
        _last_output.extend(integer_to_bytes(last_output[index], 4))
    
    count_active_words = lambda input1, input2: sum(1 for index, item in enumerate(input1) if item != input2[index])
    #assert len(_function_input) == len(last_input), (_function_input, 
    input_difference = count_active_words(_function_input, _last_input)    
    output_difference = count_active_words(_output, _last_output)    
    active_words.append(input_difference + output_difference)    
        
def display_active_words_progress(active_words, weights):            
    print("Minimum # active words: {}".format(min(active_words)))
    print("Median  # active words: {}".format(sorted(active_words)[len(active_words) / 2]))
    print("Average # active words: {}".format(sum(active_words) / len(active_words)))
    print("Maximum # active words: {}".format(max(active_words)))        
    print("Minimum state weight : {}".format(min(weights)))
    
def search_minimum_active_bits(permutation, argument_function, output_function, display_progress=True, 
                               test_inputs=QUICK_TEST, count_active_word_function=count_active_bits, 
                               display_progress_function=display_active_bits_progress):
    """ Searches for the minimum number of active bits for permutation.
        
        - permutation is the function to be tested. 
        
        - argument_function receives test inputs and returns them an a form appropriate for the interface of the permutation function
            - argument_function is used to adapt the test inputs to your functions interface
            - Arguments are the series (1, 0, 0, 0), (1, 0, 0, 1), (1, 0, 0, 2), (1, 0, 0, 3) ... (1, 0, 0, 255), (1, 0, 1, 0) ...
                - only probes a maximum of 2 ** 32 possibilities that represent some of the worst case scenario states
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
    last_input = (1, 0, 0, 0)
    last_output = output_function(permutation(argument_function(1, 0, 0, 0)))
    _inputs = set()
    for x, y in itertools.product(test_inputs(), test_inputs()):        
        for count, z in enumerate(test_inputs()):                                   
            output = output_function(permutation(argument_function(1, x, y, z)))
            
            output_hamming_weight = sum(hamming_weight(word) for word in output)           
            weights.append(output_hamming_weight)

            count_active_word_function((1, x, y, z), output, last_input, last_output, active_bits)            
            last_input = (1, x, y, z)
                                    
        if display_progress and x != last_x:
            last_x = x            
            print("\n" + ('-' * 79))
            display_progress_function(active_bits, weights)
            
    weights.pop(-1) # remove the 0, 0, 0 entries
    active_bits.pop(-1)
    print("\nSearch complete" + ('-' * (80 - len("\nSearch complete"))))
    print("Search space: 2 ** {}".format(log(count ** 3, 2)))
    display_progress_function(active_bits, weights)
        
def test_8x64_function(function, arguments):
    search_minimum_active_bits(lambda args: function(args), lambda *args: args, lambda args: args)            
            
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
    