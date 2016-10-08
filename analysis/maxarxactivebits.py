import itertools

def _add(in1, in2, wordsize_mask=0xFF):
    return (in1 + in2) & wordsize_mask, in2
    
def _xor(in1, in2):
    return in1 ^ in2, in2

def _rotate(in1, in2, amount=3):
    return ((in1 << amount) | (in1 >> (8 - amount))) & 0xFF, in2

ARX_FUNCTIONS = (_add, _rotate, _xor)
 
def hamming_weight(*inputs):
    for _input in inputs:
        return format(_input, 'b').count('1')
        
def estimate_active_bits(function, input_count=2, bitsize=8):
    active_bits = set()    
    test_inputs = set([1 << shift for shift in range(bitsize)] + [(3 << shift) % (2 ** bitsize) for shift in range(bitsize)])
    inputs = itertools.product(*(test_inputs for count in range(input_count)))
    next(inputs) # ignore f(0, 0)    
    
    last_output = function(*next(inputs))
    for input_pair in inputs:
        output = function(*input_pair)            
        number_different_bits = sum(hamming_weight(last_output[index] ^ output[index]) for index in range(input_count))        
        active_bits.add(number_different_bits)
        last_output = output

    return active_bits
    
def find_max_active_bits_for_operations(functions, operation_count):
    current_max = 0
    for operations in itertools.product(*(functions for count in range(operation_count))):        
        if len(set(operations)) < 3: 
            continue
            
        def test_function(value1, value2):
            for operation in operations:
                value2, value1 = operation(value1, value2)
                value1, value2 = operation(value1, value2)
            return value1, value2
            
        active_bits = estimate_active_bits(test_function)
        
        if min(active_bits) >= current_max:            
            current_max = min(active_bits)
            output_function = test_function
            print current_max, operations
    return (current_max, output_function)
    
def test_find_max_active_bits_for_operations():
    print find_max_active_bits_for_operations(ARX_FUNCTIONS, 3)
        
if __name__ == "__main__":
    test_find_max_active_bits_for_operations()
    