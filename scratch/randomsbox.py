import os
from differential import find_best_differential
from linear import calculate_linearity

def shuffle(array, key):
    for index in reversed(range(1, len(array))):
        other_index = key[index] & (index - 1)
        array[index], array[other_index] = array[other_index], array[index]
        

for x in range(16):
    sbox = bytearray(range(256))
    key = bytearray(os.urandom(256))
    shuffle(sbox, key)
    key = bytearray(os.urandom(256))
    shuffle(sbox, key)    
    shuffle(sbox, key)
    print find_best_differential(sbox)
    print calculate_linearity(sbox)
    
    