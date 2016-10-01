def rotate_left(x, r, bit_width=8, _mask=dict((bit_width, ((2 ** bit_width) - 1)) for bit_width in (8, 16, 32, 64, 128))):  
    r %= bit_width
    return ((x << r) | (x >> (bit_width - r))) & _mask[bit_width]
    
def permutation(x, bit_width=128):
    modulus = 2 ** bit_width    
    for t in (3, 5, 7, 13, 23, 43):
        x ^= rotate_left(x, t, bit_width=bit_width)
        x = (3 * x) % modulus
    return x
 
# not tested yet 
#def memory_hard_function(_input, w=7, k=32):
#    D = _input
#    memory = list()
#    for C in reversed(range(2 ** (k - w))):
#        list.append(D)
#        
#    A = 0
#    modulus = 2 ** (k - w)
#    for C in reversed(range(2 ** n - 1)):
#        A ^= permutation(D ^ C)
#        address = A % modulus
#        R = memory[address]
#        memory[address] = D
#        D ^= permutation(R ^ C)
#    return D        
        
def test_permutation():
    from cryptanalysis import summarize_sbox
    sbox = list()
    for value in range(256):
        sbox.append(permutation(value))
        print format(sbox[-1], 'b').zfill(80)[:79]
    #import pprint
    #pprint.pprint([format(word, 'b').zfill(128) for word in sbox])
    summarize_sbox([word & 255 for word in sbox])
    
def test_sub_sboxes():    
    sboxes = dict()
    for sbox_entry in range(256):                              
        output = permutation(sbox_entry)
        print format(output, 'b').zfill(128)
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
        print("\nSbox size: {}".format(len(set(sbox))))
        print("Subsection index: {}".format(shift / 8))
        summarize_sbox(sbox)
        
if __name__ == "__main__":
    #test_permutation()
    test_sub_sboxes()
    