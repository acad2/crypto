import itertools

raise NotImplementedError()

def weight(words):
    return sum(format(word, 'b').count('1') for word in words)

def xor_words(words1, word2):
    return [word ^ word2[index] for index, word in enumerate(words1)]
            
def branch_number(function, input_generator, input_generator2, difference_function=xor_words):
    values = set()
    for function_input in input_generator:
        for function_input2 in input_generator2:
            if function_input == function_input2:
                continue                
            print function_input, function_input2
            value = weight(difference_function(function_input, function_input2))                        
            output1 = function(list(function_input))
            output2 = function(list(function_input2))
            value += weight(difference_function(output1, output2))
            values.add(value)
            print min(values)
    return min(value)
    
def generate_input(size, test_size, input_function):
    return itertools.product(*(input_function(test_size) for count in range(size)))
    
def generate_16x8_input(test_size=2):
    return [0 for count in range(16 - test_size)] + [range(256) for count in range(test_size)]

def generate_4x32_input(test_size=1):
    return [0 for count in range(4 - test_size)] + [itertools.count() for count in range(test_size)]
    
def test_branch_number():
    from crypto.designs.blockcipher._aes import aes_round
    print branch_number(aes_round, generate_16x8_input(), generate_16x8_input())
    
if __name__ == "__main__":
    test_branch_number()
    