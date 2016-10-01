from pride.crypto.utilities import bytes_to_longs, longs_to_bytes

def rotl32(word, amount, _mask=0xFFFFFFFF):    
    return ((word << amount) | (word >> (32 - amount))) & _mask 
    
def rotr32(word, amount, _mask=0xFFFFFFFF):    
    return ((word >> amount) | (word << (32 - amount))) & _mask 
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))  
    
def permutation(a, b, c, d, mask=0xFFFFFFFF):    
    for round in range(1):
        a = rotl32((a + (b ^ c ^ d)) & mask, 1)
        a = rotl32((a ^ choice(b, c, d)) & mask, 11)
        
        b = rotl32((b + (a ^ c ^ d)) & mask, 2)
        b = rotl32((b ^ choice(c, d, a)) & mask, 7)
        
        c = rotl32((c + (a ^ b ^ d)) & mask, 3)
        c = rotl32((c ^ choice(d, a, b)) & mask, 13)
        
        d = rotl32((d + (a ^ b ^ c)) & mask, 5)  
        d = rotl32((d ^ choice(a, b, c)) & mask, 17)                
                     
    return a, b, c, d    
    
def invert_permutation(a, b, c, d, mask=0xFFFFFFFF, modulus=2 ** 32):
    raise NotImplementedError()
    for round in range(20):
        d = rotr32(d, 29) ^ choice(a, b, c)
        c = rotr32(c, 23) ^ choice(d, a, b)
        b = rotr32(b, 17) ^ choice(c, d, a)
        a = rotr32(a, 11) ^ choice(b, c, d)
            
        d = (modulus + (rotr32(d, 7) - (a ^ b ^ c))) % modulus
        c = (modulus + (rotr32(c, 5) - (a ^ b ^ d))) % modulus
        b = (modulus + (rotr32(b, 3) - (a ^ c ^ d))) % modulus
        a = (modulus + (rotr32(a, 1) - (b ^ c ^ d))) % modulus
    return a, b, c, d    
    
def permutation_on_state(data, mask=0xFFFFFFFFFFFFFFFF):
    a, b, c, d = bytes_to_longs(bytearray(data))
    a, b, c, d = permutation(a, b, c, d)
    return bytes(longs_to_bytes(a, b, c, d))    
    
def permutation_subroutine(data, mask=0xFFFFFFFFFFFFFFFF):
    a, b, c, d = bytes_to_longs(bytearray(data))
    a, b, c, d = permutation(a, b, c, d)
    data[:] = bytes(longs_to_bytes(a, b, c, d))

def invert_permutation_subroutine(data, mask=0xFFFFFFFFFFFFFFFF):
    a, b, c, d = bytes_to_longs(bytearray(data))
    a, b, c, d = invert_permutation(a, b, c, d)
    data[:] = bytes(longs_to_bytes(a, b, c, d))  
    
def test_permutation():
    from pride.crypto.analysis.metrics import test_permutation             
    test_permutation(permutation_on_state, 16)
    
def visualize_permutation():
    from pride.crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
       
def test_invert_permutation():
    from os import urandom
    inputs = tuple(bytearray(urandom(4)))#(1, 2, 3, 4)
    outputs = permutation(*inputs)
    _inputs = invert_permutation(*outputs)
    assert _inputs == inputs, (_inputs, inputs)
    
def test_active_bits():
    active_bits = []
    for in1 in range(256):
        for in2 in reversed(range(256)):                        
            if not in1 and not in2:
                continue
            output1 = permutation(0, 0, 0, in1)
            output2 = permutation(0, 0, in2, 0)
            difference = [output1[index] ^ output2[index] for index in range(4)]
            weight = sum(format(word, 'b').count('1') for word in difference)
            active_bits.append(weight)
    print("Minimum # active bits: {}".format(min(active_bits)))
    print("Median  # active bits: {}".format(active_bits[len(active_bits) / 2]))
    print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
    print("Maximum # active bits: {}".format(max(active_bits)))
    print sorted(active_bits)[:20] 
    
def search_minimum_active_bits():   
    from pride.crypto.utilities import integer_to_bytes
    active_bits = set()
    weights = []
    last_output = permutation(0, 0, 0, 1)
    minimum_weight = 0
    minimum_weight2 = 0
    
    for x in xrange(2, 2 ** 24):
        output = permutation(*integer_to_bytes(x, 4))        
        weights.append(sum(format(word, 'b').count('1') for word in output))        
        weight = sum(format(word, 'b').count('1') for word in (last_output[index] ^ output[index] for index in xrange(4)))
        active_bits.add(weight)
        if not x % 65536:
            minimum_weight = min(active_bits) 
            print("\n" + ('-' * 79))
            print("Minimum # active bits: {}".format(min(active_bits)))
            print("Median  # active bits: {}".format(sorted(active_bits)[len(active_bits) / 2]))
            print("Average # active bits: {}".format(sum(active_bits) / len(active_bits)))
            print("Maximum # active bits: {}".format(max(active_bits)))
            
            print("Minimum state weight : {}".format(min(weights)))
    
if __name__ == "__main__":
    #test_permutation()
    #visualize_permutation()
    #test_invert_permutation()
    #test_active_bits()
    search_minimum_active_bits()
    