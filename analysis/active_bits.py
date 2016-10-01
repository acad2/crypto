from math import log

from pride.crypto.utilities import integer_to_bytes, bytes_to_integer, slide

def hamming_weight(word):
    return format(word, 'b').count('1')
    
def search_minimum_active_bits(permutation, argument_function, output_function, test_length=256, display_progress=True):  
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
    active_bits = set()
    weights = list()
    last_output = output_function(permutation(argument_function(0, 0, 0, 1)))
    minimum_weight = 0
    minimum_weight2 = 0
        
    for x in xrange(1, test_length + 1): # itertools.product isn't as useful because of the print statements every 65536 iterations
        for y in xrange(256):
            for z in xrange(256):
                output = output_function(permutation(argument_function(0, x, y, z)))               
                output_hamming_weight = sum(hamming_weight(word) for word in output)                
                weights.append(output_hamming_weight)
                
                number_different_bits = sum(hamming_weight(word) for word in (last_output[index] ^ _output for index, _output in enumerate(output)))
                active_bits.add(number_different_bits)
        if display_progress:
            minimum_weight = min(active_bits)
            print("\n" + ('-' * 79))
            print("Minimum # active bits: {}".format(min(active_bits)))
            print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
            print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
            print("Maximum # active bits: {}".format(max(active_bits)))        
            print("Minimum state weight : {}".format(min(weights)))        
                
    print("\nSearch complete" + ('-' * (80 - len("\nSearch complete"))))
    print("Search space: 2 ** {}".format(log((256 * 256) * test_length, 2)))
    print("Minimum # active bits: {}".format(min(active_bits)))
    print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
    print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
    print("Maximum # active bits: {}".format(max(active_bits)))        
    print("Minimum state weight : {}".format(min(weights)))       
    
    
def test_search_minimum_active_bits():
    from pride.crypto.designs.permutation import permutation3
    search_minimum_active_bits(lambda args: permutation3.permutation(*args), lambda *args: args, lambda args: args)
    
def demo_aes_active_bits():    
    from pride.crypto.designs.blockcipher.aes_procedures import aes_round_no_key
    
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
    