from os import urandom
from math import log

hamming_weight_for_size = {128 : (40, 64, 90)}

# 128 bit key: hamming weight of 40 to 90 , average=64
# 64 bit key : hamming weight of 16 to 50, average=32
# 32 bit key : hamming weight of 3 to 29, average=16

def test_average_hamming_weight():
    _samples = []
    sample_size = 16
    for count in range(1024 * 100):
        samples = bytearray(urandom(sample_size))
        weight = sum(format(byte, 'b').zfill(8).count('1') for byte in samples)
        _samples.append(weight)
    print "Minimum weight: {}".format(min(_samples))
    print "Average weight: {}".format(sum(_samples) / len(_samples))
    print "Median  weight: {}".format(_samples[len(_samples) / 2])
    print "Maximum weight: {}".format(max(_samples))
    
def test_duplicate_chance():    
    sample_size = 2
    samples = urandom(sample_size)
    for count in xrange(2 ** (sample_size * 8)):
        if urandom(sample_size) == samples:
            break
    print "Regenerated identical samples after: {} (2 ** {})".format(count, log(count, 2))

def next_bit_permutation(v):    
    # from http://graphics.stanford.edu/~seander/bithacks.html#NextBitPermutation
    t = (v | (v - 1)) + 1;  
    return t | ((((t & -t) / (v & -v)) >> 1) - 1);
    
def hamming_weight(data, word_size=8):
    return sum(format(byte, 'b').zfill(word_size).count('1') for byte in data)
    
def find_duplicate_via_prng():    
    import random
    import itertools
    from crypto.utilities import slide, bytes_to_longs
    from crypto.designs.ciphercomponents import optimized_bit_byte_transposition_words as prng_of_hamming_weight
    sample_size = 16
    weight = 64
    test_sample = list(('1' * weight).zfill(128))
    target_sample = bytearray(16)
    while sum(format(byte, 'b').zfill(8).count('1') for byte in target_sample) != weight:
        target_sample[:] = urandom(16)
    
    random.shuffle(test_sample)
    test_sample = tuple(int(word, 2) for word in slide(''.join(test_sample), 32))
    target_sample = bytes_to_longs(target_sample)
    failed = True
    outputs = set()
    for counter in itertools.count():
        if test_sample == target_sample:
            break
        if test_sample in outputs:
            print "Entered cycle after {} without finding target".format(counter)
            outputs.remove(test_sample)
            failed = True
            #break
        else:
            outputs.add(test_sample)
        test_sample = prng_of_hamming_weight(*test_sample)
        
    else:
        print "Failed to find identical sample after 2 ** {}".format(log(counter, 2))
        failed = True
    if not failed:
        print "Regenerated identical samples after: {} (2 ** {})".format(counter, log(counter, 2))
    
def find_duplicate2():
    from crypto.utilities import bytes_to_integer
    target_weight = 19
    target_sample = bytearray(8)
    samples = []
    while hamming_weight(target_sample) != target_weight:        
        target_sample = bytearray(urandom(8))
    test_sample = bytearray(8)
    test_sample[-2:] = (255, 255)
    test_sample[-3] = 7
    assert hamming_weight(test_sample) == hamming_weight(target_sample)
    
    print "Searching for duplicate"
    target_sample, test_sample = bytes_to_integer(target_sample), bytes_to_integer(test_sample)    
    counter = 0
    while test_sample != target_sample:
        counter += 1
        test_sample = next_bit_permutation(test_sample)
    print "Found duplicate after: {}".format(counter)    
        
    
if __name__ == "__main__":
    #test_average_hamming_weight()
    #test_duplicate_chance()
    #find_duplicate_via_prng()
    find_duplicate2()
    
    