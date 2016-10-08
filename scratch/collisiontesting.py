#1 0 0000...
#0 1 0000...
#
#B A xxxx...
#D C xxxx...
#
#if a ^ b == d ^ c:
#    F E yyyy...
#    H G yyyy...
#    
#    if f ^ e == 

import os
from streamcipher2 import prp

def find_equivalent_xor_probability():    
    outputs = 0
    for counter in range(65536):
        a, b, c, d = bytearray(os.urandom(4))
        if a ^ b == c ^ d:
            outputs += 1
    print outputs, counter, (float(outputs) / counter)
    
def test_xor_difference(function, data_size):    
    outputs = 0
    for input_one in range(256):
        for input_two in range(256):
            input_one, input_two = bytearray(os.urandom(2))
            data = bytearray(data_size)
            data[0] = input_one
            data[1] = input_two
            data = bytearray(function(data))
            
            data2 = bytearray(data_size)
            data2[0] = input_two
            data2[1] = input_one
            data = bytearray(function(data2))
            
            if data[0] ^ data[1] == data2[0] ^ data2[1]:
                outputs += 1
    return outputs

def test_for_collisions():
    data = bytearray(16)
    data[0] = 1
    
    hash_digest = data[:]
    prp(hash_digest, 1, key_slice=None)    
    print hash_digest, len(hash_digest), [byte for byte in hash_digest[8:]]
        
    for index2 in range(11, 16):
        print index2
        for byte in range(256):
            for byte2 in range(256):
                hash_digest2 = data[:]
                hash_digest2[9] = byte
                hash_digest2[index2] = byte2
                prp(hash_digest, 1 ^ byte ^ byte2, key_slice=None)
                
                if hash_digest2[:8] == hash_digest[:8]:
                    print "Collision: ", byte
    
        
        
def test_prp():    
    print test_xor_difference(lambda data: prp(data, xor_sum(data)), 16)
        
def test_prp_sponge():
    import crypto.designs.hash.sponge
    import streamcipher2
    from crypto.utilities import xor_sum
    
    #prp_hash = sponge.sponge_factory(lambda data: streamcipher2.prp(data, xor_sum(data)), capacity=8, rate=8)
    #print prp_hash("Testing")
    #import crypto.analysis.metrics
    
    prp = sponge.sponge_factory(lambda data: streamcipher2.prp(data, xor_sum(data)), capacity=8, rate=8, output_size=8)
    print test_xor_difference(prp, 8)
    metrics.test_hash_function(prp)
    
    
if __name__ == "__main__":
    #find_equivalent_xor_probability()
    #test_prp()
    #test_prp_sponge()
    test_for_collisions()
    