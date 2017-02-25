from crypto.designs.blockcipher.blockcipher2 import prp as old_prp
from streamcipher2 import prp as new_prp, xor_sum
from crypto.designs.hash.sponge import crypto.designs.hash.sponge_factory

def test_for_collisions():
    data1 = bytearray(16)
    data2 = bytearray(16)
    data1[0] = 1
    data2[1] = 1
    
    old_prp(data1, 1)
    old_prp(data2, 1)
    
    data3 = bytearray(16)
    data4 = bytearray(16)
    data3[0] = 1
    data4[1] = 1
    
    new_prp(data3, 1, key_slice=None)
    new_prp(data4, 1, key_slice=None)
    
    print "Old prp: "
    print "data1:\n", data1
    print
    print "data2:\n", data2
    
    print "With new prp: "
    print "data3:\n", data3
    print    
    print "data4:\n", data4
    
    hasher1 = sponge_factory(lambda data: old_prp(data, xor_sum(data)), rate=8, capacity=8)
    hasher2 = sponge_factory(lambda data: new_prp(data, xor_sum(data), key_slice=None), rate=8, capacity=8)
    
    null_string_hash = hasher1('')
    zero_hash = hasher1('0')
    
    null_string_hash2 = hasher2('')
    zero_hash2 = hasher2('0')
    
    print "Sponge outputs with old prp: "
    print "Null string hash:\n", null_string_hash
    print "\nZero hash:\n", zero_hash
    
    print "Sponge outputs with new prp: "
    print "Null string hash:\n", null_string_hash2
    print "\nZero hash:\n", zero_hash2
    
if __name__ == "__main__":
    test_for_collisions()   
    
    