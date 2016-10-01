from pride.crypto.utilities import xor_subroutine, rotate_left, rotate_right, find_long_cycle_length, find_long_cycle_length_subroutine

def n_byte_addition(amount, _bytes):
    last_byte = _bytes[-1] + amount
    _bytes[-1] = last_byte & 255
    for offset in reversed(range(len(_bytes) - 1)):
        current_byte = _bytes[offset] + (last_byte >> 8)
        last_byte = current_byte
        _bytes[offset] = current_byte & 255
    return _bytes

def twenty_four_bit_addition(left_byte, middle_byte, right_byte, amount):
    right_byte += amount
    middle_byte = (middle_byte + (right_byte >> 8))    
    left_byte = (left_byte + (middle_byte >> 8)) & 255    
    return left_byte, middle_byte & 255, right_byte & 255
    
def sixteen_bit_addition(left_byte, right_byte, amount):
    #return n_byte_addition(amount, [left_byte, right_byte])
    
    right_byte += amount
    # add the overflow from the right byte to the left    
    left_byte = (left_byte + (right_byte >> 8)) & 255 
    return left_byte, right_byte & 255 # mask to 8-bit size
    
def permute(data):    
    for index in reversed(xrange(1, len(data))):
        data[index - 1], data[index] = sixteen_bit_addition(data[index - 1], data[index], index + index + 1)  
    data[0] = (data[0] + 3) & 255        
    return data
    
def keyed_permute(data, key):    
    assert len(data) == len(key), (len(data), len(key))
    for index in reversed(xrange(1, len(data))):        
        data[index - 1], data[index] = sixteen_bit_addition(data[index - 1], data[index], key[index])  
    data[0] = (data[0] + key[0]) & 255      
    return data
    
def keyed_permute_diffusion(data, key):    
    assert len(data) <= len(key), (len(data), len(key))
    for index in reversed(xrange(1, len(data))):        
        data[index - 1], data[index] = sixteen_bit_addition(data[index - 1], data[index], key[index])
        data[index - 1] ^= rotate_right(data[index], 5)        
    data[0] = (data[0] + key[0]) & 255        
    return data
    
def keyed_permute_diffusion_inline(data, key):
    for index in reversed(xrange(1, len(data))):        
        right_byte = data[index] # right_byte = 16 bit unsigned int
        right_byte += key[index] # increment, potentially overflowing low order byte
        data[index - 1] = (data[index - 1] + (right_byte >> 8)) & 255 # add any bits in high order byte to next byte
        data[index] = right_byte & 255 # mask to 8 bit unsigned int
                        
        data[index - 1] ^= rotate_left(data[index], 5) # provides diffusion
    data[0] = (data[0] + key[0]) & 255     
    return data
    
def permute2(data):
    for index in reversed(xrange(2, len(data))):
        (data[index - 2], 
         data[index - 1], 
         data[index]) = twenty_four_bit_addition(data[index - 2],
                                                 data[index - 1],
                                                 data[index],
                                                 index + index + 1)
    data[0], data[1] = sixteen_bit_addition(data[0], data[1], 7)
    data[0] = (data[0] + 3) & 255    
    return data
    
def permute_n(data, n):
    for index in reversed(xrange(n - 1, len(data))):
        new_bytes = n_byte_addition(index + index + 1, data[index - n:index])
        for offset in range(len(new_bytes)):
            data[index - offset] = new_bytes[n - offset]  
    print range(n, len(data)), n, len(data)
    return data
    
def shuffle(data, key):     
    for i in reversed(range(1, len(data))):
        # Fisher-Yates shuffle
        j = key[i] & (i - 1)  
                
        #for index2 in range(i): # wayyyy too slow. damn.
        #    if index2 == j:
        #        data[i], data[j] = data[j], data[i]
        #    else:
        #        data[i], data[i] = data[i], data[i]
        
from pride.crypto.designs.hash.sponge import pride.crypto.designs.hash.sponge_factory
tweak = list(set((x | 1 for x in range(256)))) # some odd numbers
permute_hash = sponge_factory(lambda data: keyed_permute_diffusion(data, tweak),
                              output_size=2, rate=2, capacity=1)      

#def permute_hash(data):        
#    if not data:
#        return data
#    
#   # from pride.crypto.utilities import xor_sum
#   # state = xor_sum(data) | 1
#    tweak = list(set((x | 1 for x in range(256))))[-len(data):] # some odd numbers
#    for round in range(1):                
#        keyed_permute_diffusion(data, tweak)   
#       # data = bytearray(reversed(data))
#        #keyed_permute(data, tweak)
#    #permute(key_material)
#    
#    #xor_subroutine(data, key_material)        
#   # print data
#    return data
    
def test_permute():    
    data = bytearray("\x00" * 3)
    key = [17, 3, 251]
    try:
        for progress in find_long_cycle_length((2 ** (len(data) * 8)), 1024, keyed_permute_diffusion, data, key[:len(data)]):
            print progress - 0
    except TypeError:
        print len(progress)
    #cycle = find_cycle_length(permute, data)
    #print len(cycle)

def test_prp():
    from streamcipher2 import prp, xor_sum
    def test_prp(data):        
        before = data[:]
        prp(data, xor_sum(data))        
        assert before != data
    
    data = bytearray("\x00" * 16)
    try:
        for progress in find_long_cycle_length_subroutine(2 ** (3 * 8), 1024, test_prp, data):
            print progress - 0
    except TypeError:
        print len(progress)
        
if __name__ == "__main__":
    test_permute()
    #test_prp()
    #from pride.crypto.analysis.metrics import test_hash_function, test_collisions
    #test_collisions(lambda data: bytes(permute_hash(bytearray(data))))
    #test_hash_function(lambda data: bytes(permute_hash(bytearray(data))))#permute_hash, collision_test=False)
    