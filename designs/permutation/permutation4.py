from crypto.utilities import bytes_to_longs, longs_to_bytes

def rotl32(word, amount, _mask=0xFFFFFFFF):    
    return ((word << amount) | (word >> (32 - amount))) & _mask 
    
def rotr32(word, amount, _mask=0xFFFFFFFF):    
    return ((word >> amount) | (word << (32 - amount))) & _mask 
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))  

def addition(a, b):
    return a ^ b ^ ((a & b) << 1)

def permutation(a, b, c, d, mask=0xFFFFFFFF):    
    for round in range(1):        
        a = rotl32((addition(a, b ^ c ^ d)) & mask, 1)
        b = rotl32((addition(b, a ^ c ^ d)) & mask, 3)
        c = rotl32((addition(c, a ^ b ^ d)) & mask, 5)
        d = rotl32((addition(d, a ^ b ^ c)) & mask, 7)    
        
        a = rotl32(a ^ choice(b, c, d), 11)
        b = rotl32(b ^ choice(c, d, a), 17)
        c = rotl32(c ^ choice(d, a, b), 23)
        d = rotl32(d ^ choice(a, b, c), 29)    
  #  print format(a, 'b').zfill(32)
  #  print format(b, 'b').zfill(32)
  #  print format(c, 'b').zfill(32)
  #  print format(d, 'b').zfill(32)
  #  raw_input("\n")
    return a, b, c, d    
    
def invert_permutation(a, b, c, d, mask=0xFFFFFFFF, modulus=2 ** 32):
    raise notImplementedError()
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
    from crypto.analysis.metrics import test_permutation             
    test_permutation(permutation_on_state, 16)
    
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
       
def test_invert_permutation():
    from os import urandom
    inputs = tuple(bytearray(urandom(4)))#(1, 2, 3, 4)
    outputs = permutation(*inputs)
    _inputs = invert_permutation(*outputs)
    assert _inputs == inputs, (_inputs, inputs)
        
def test_sub_sboxes(permutation, argument_function, output_function):    
    sboxes = dict()
    for sbox_entry in range(256):                              
        output = output_function(permutation(*argument_function(sbox_entry)))        
        for shift in reversed(range(0, 128, 8)):    
            try:
                sboxes[shift].append((output >> shift) & 255)                    
            except KeyError:                    
                sboxes[shift] = bytearray()
                sboxes[shift].append((output >> shift) & 255)
            
    from cryptanalysis import summarize_sbox
   # print sboxes.values()
    for shift in sorted(sboxes.keys()):    
        sbox = sboxes[shift]
        print("\nSbox size: {}/{}".format(len(set(sbox)), len(sbox)))
        print("Subsection index: {}".format(shift / 8))
        summarize_sbox(sbox)
        
    
if __name__ == "__main__":
    #test_permutation()
    visualize_permutation()
    #test_invert_permutation()
    #test_sub_sboxes(permutation, lambda byte: (0, 0, 0, byte), lambda output: (output[3] << 96) | (output[2] << 64) | (output[1] << 32) | output[0])
    