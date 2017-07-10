from crypto.utilities import xor_subroutine, bytes_to_words, words_to_bytes, pad_input
from crypto.designs.permutation.arxcalibur512 import permutation, generate_constant

# "minimal" padding (BLAKE2)
# "split" padding http://iacr.org/archive/asiacrypt2008/53500275/53500275.pdf


def compression_function(data, words_per_block=16):
    state = [0] * 16
    for counter in range(len(data) / words_per_block):
        data_block = data[counter * words_per_block:(counter + 1) * words_per_block]
        
        diffused_counter = generate_constant(counter + 1)        
        xor_subroutine(data_block, diffused_counter)
        xor_subroutine(data_block, state)
        
        data_block = permutation(*[counter] + data_block)
        xor_subroutine(state, data_block)   
        
    return state

def hash_function(data):
    data = bytes_to_words(pad_input(bytearray(data), 64), 4)
    return bytes(words_to_bytes(compression_function(data), 4))
        
def test_hash_function():
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function)
    
if __name__ == "__main__":
    test_hash_function()
        
        
        #state = G(F(input), state)