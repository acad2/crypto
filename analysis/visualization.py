from crypto.utilities import slide

def hamming_weight(word):
    return format(word, 'b').count('1')
    
def print_state_4x64_256_as_16x16(inputs):    
    for word in inputs:
        print '\n'.join(slide(' '.join(list(format(word, 'b').zfill(64))), 32))
 
def print_state_4x64_256_as_4x64(inputs): 
    _print_state(inputs, 64)
    
def _print_state(inputs, bits): 
    weight_total = 0
    print inputs
    for word in inputs:
        print word
        weight = hamming_weight(word)
        weight_total += weight
        print("{} ({}/{})".format(''.join(bit for bit in format(word, 'b').zfill(bits)), weight, bits))
    print("{} ({}/{})".format(' ' * bits, weight_total, (bits * len(inputs))))
    
def print_state_4x32_128_as_4x32(inputs, message=''):
    if message:
        print message
    _print_state(inputs, 32)
    
def print_state_4x32_128_as_8x16(inputs):    
    for word in inputs:
        print '\n'.join(slide(format(word, 'b').zfill(32), 16))
        
def print_state_16x16(inputs_16x16):    
    _print_state(inputs_16x16, 16)
        
def print_state_8x8(inputs):
    _print_state(inputs, 8)
                     
def print_state_16x8(inputs):
    _print_state(inputs, 8)

def print_state_64x8(inputs):
    _print_state(inputs, 8)         
            
def print_state_32x32(inputs):
    _print_state(inputs, 32)
    
def test_8x8_function(function, inputs, print_function=print_state_8x8):
    test_function(function, inputs, print_function)
    
def test_16x8_function(function, inputs, print_function=print_state_16x8):
    test_function(function, inputs, print_function)
    
def test_32x32_function(function, inputs, print_function=print_state_32x32):
    test_function(function, inputs, print_function)
    
def test_4x32_function(function, inputs, print_function=print_state_4x32_128_as_4x32):
    test_function(function, inputs, print_function)
            
def test_4x64_function(function, inputs, print_function=print_state_4x64_256_as_4x64):    
    test_function(function, inputs, print_function)
    
def test_64x8_function(function, inputs, print_function=print_state_64x8):
    test_function(function, inputs, print_function)
        
def test_function(function, inputs, print_function):
    print("Testing {} with inputs: ".format(function))
    print_function(inputs)
    while not raw_input("any key+enter to finish, enter to continue: "):
        inputs = function(*inputs)
        print("\n")
        print_function(inputs) 
        