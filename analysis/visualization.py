from pride.crypto.utilities import slide

def hamming_weight(word):
    return format(word, 'b').count('1')
    
def print_state_4x64_256_as_16x16(inputs):    
    for word in inputs:
        print '\n'.join(slide(' '.join(list(format(word, 'b').zfill(64))), 32))
 
def print_state_4x64_256_as_4x64(inputs):   
    weight_total = 0
    for word in inputs:
        weight = hamming_weight(word)
        weight_total += weight
        print("{} ({}/64)".format(''.join(bit for bit in format(word, 'b').zfill(64)), weight))
    print("{} ({}/256)".format(' ' * 64, weight_total))
    
def print_state_4x32_128_as_4x32(inputs):
    for word in inputs:
        print format(word, 'b').zfill(32)  
    
def print_state_4x32_128_as_8x16(inputs):
    for word in inputs:
        print '\n'.join(slide(format(word, 'b').zfill(32), 16))
        
def print_state_16x16(inputs_16x16):    
    for word in inputs_16x16:
        print format(word, 'b').zfill(16)
        
def test_4x32_function(function, inputs, print_function=print_state_4x32_128_as_4x32):
    test_function(function, inputs, print_function)
            
def test_4x64_function(function, inputs, print_function=print_state_4x64_256_as_16x16):
    print print_function
    test_function(function, inputs, print_function)
    
def test_function(function, inputs, print_function):
    print("Testing {} with inputs: ".format(function))
    print_function(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = function(*inputs)
        print("\n")
        print_function(inputs) 