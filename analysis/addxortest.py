#3/4 of all 2 bit additions are equivalent to XOR (modular addition and XOR)
#for addition between 2 n bit words, the probability of being equivalent to XOR between the two words is:
#    3/4 for 1 bit wide word
#    3/4 * 3/4 for 2 bit wide word
#    ...
#    3/4 ** n for n bit wide word
#    ~= .00010045
#
#so about 1 out of every 1000 additions between 2 random 32 bit words is equivalent to XOR? experiment shows very different result
#and sub sections of the n bit state may be equivalent to XOR, anywhere where there are few/no carries
# in the 1/4 of case where the carry does occur, it leaks the fact that the added bits must have both been 1
# certain inputs to a function of interleaved addition and xor instructions will cause the function to behave equivalent to the same function with add replaced by xor.
# so for appropriate choices of a, b, c, and d: a + b ^ c + d is equivalent to a ^ b ^ c ^d


#let's say a hash is prp(x) ^ x (non compressing owf)
#let's say a cipher is k ^ prp(x ^ k)
#
#if prp is:
#    a += b
#    c ^= d
#    b += c
#    d ^= a
#    
#Then we can select an initial a and b that, when added (+) are equivalent to being operated on by XOR (^)
#In the cipher version, a, b, c, d have key values combined with them via XOR. 
#This seems to eliminate or reduce the ability to choose a pair a, b that will be add/xor equivalent, because the addition of the key may cause carrys to happen in the addition.
#Addition of random keys with a, b will, with some probabilistic measure, result in a pair that will be add/xor equivalent (every X (a, b) pairs will be add/xor equivalent)

from os import urandom
from math import log
import itertools

import crypto.utilities

def random_word(word_size=4):
    return crypto.utilities.bytes_to_integer(bytearray(urandom(4)))

def is_equivalent_pair(word1, word2):
    return word1 ^ word2 == word1 + word2 
    
def create_equivalent_pair(word_size=4):
    random = random_word(word_size)
    mask = (2 ** (8 * word_size)) - 1
    out1 = crypto.utilities.choice(random, 0, mask)
    out2 = crypto.utilities.choice(random, mask, 0)
    return out1, out2
        
def create_equivalent_half(word1, word_size=4):
    random = random_word(word_size)
    mask = (2 ** (8 * word_size)) - 1
    out1 = crypto.utilities.choice(word1, 0, mask)    
    return out1
    
def test_create_equivalent_half():
    word1 = random_word()
    word2 = create_equivalent_half(word1)
    assert word1 != word2
    assert is_equivalent_pair(word1, word2)
         
def test_create_equivalent_pair():
    word1, word2 = create_equivalent_pair()
    assert word1 != word2
    assert is_equivalent_pair(word1, word2)     
     
def test_addition_xor_equivalence():
    counter = 0
    for _ in itertools.count():        
        counter += 1
        word1, word2 = random_word(), random_word()
        if word1 + word2 == word1 ^ word2:
            print("Found equivalent pair after: {}".format(log(counter, 2)))
            #print("{}\n{}".format(format(word1, 'b').zfill(32), format(word2, 'b').zfill(32)))
            counter = 0
          #  break                   
             
if __name__ == "__main__":
    test_addition_xor_equivalence()
    test_create_equivalent_pair()
    test_create_equivalent_half()
    