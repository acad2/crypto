from os import urandom

from crypto.utilities import xor_subroutine, rotate_left

def generate_key(size=16):
    assert size == 16
    return [bytearray(urandom(16)) for count in range(256)]
    
def permutation(data, key=generate_key(), size=16, output=bytearray(16)):    
    assert len(data) == size
    output[:] = data   
    print "\npermutation\n"    
    #for round in range(2):        
    for index1 in range(size):  
     #       byte = output[index1]
     #       xor_subroutine(output, key[byte])
     #       output[index1] = byte

        new_byte = 0
        for index2 in range(size):
            new_byte ^= rotate_left((output[index2] + index2) % 256, index2, 8)
        xor_subroutine(output, key[new_byte])                         
        output[index1] = new_byte  
        

        
        print output
    return bytes(output)
    
def visualize_permutation():
    from crypto.analysis.visualization import test_16x8_function
    test_data = [0 for count in range(16)]
    test_data[0] = 1
    test_16x8_function(lambda *args: bytearray(permutation(args)), test_data)
        
def test_permutation_metrics():
    from crypto.analysis.metrics import test_permutation     
    test_permutation(permutation, 16)#, avalanche_test=False, randomness_test=False, bias_test=False, period_test=False)
    
def test_permutation():
    data = bytearray(16)
    data2 = data[:]
    data[-1] = 1
    data2[-2] = 1
    output = permutation(data)
    output2 = permutation(data2)
        
if __name__ == "__main__":    
    visualize_permutation()
    #test_permutation_metrics()
    test_permutation()
    