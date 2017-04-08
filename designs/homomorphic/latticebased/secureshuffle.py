from os import urandom

from crypto.utilities import rotate_left, integer_to_words, words_to_integer
    
__all__ = ["shuffle", ]
    
def shuffle(container, wordsize, prng=lambda amount: bytearray(urandom(amount))):    
    """ usage: shuffle(container, wordsize, 
                       prng=lambda amount: bytearray(urandom(amount))) => None
                       
        Shuffle container in-place in a manner that is less prone to side channel leakage of information.
        The standard Fisher-Yates shuffle accesses the array at secret dependent locations
            - an adversary who can monitor the cache may have an advantage at guessing the output
        This algorithm shuffles container in-place without accessing the container in secret dependent ways or branching on secret data. """    
    size = len(container)
    decisions = _generate_shuffle_key_material(max(32, size / 8), prng=prng)
    index1, index2 = 0, 1    
    
    while decisions:
        decision = decisions.pop(0)              
        worda, wordb = container[index1], container[index2]                    
        worda = integer_to_words(worda, wordsize, 64)        
        wordb = integer_to_words(wordb, wordsize, 64)         
        
        for index in range(len(worda)):                
            worda[index], wordb[index] = _choice_swap(decision, worda[index], wordb[index])                
            
        worda, wordb = words_to_integer(worda, 64), words_to_integer(wordb, 64)                  
        container[index1], container[index2] = worda, wordb
        
        index2 += 1        
        if index2 == size:
            index1 += 1
            index2 = index1 + 1
        if index1 == size - 1:
            index1 = 0
            index2 = 1    
        
def _choice(a, b, c):
    return c ^ (a & (b ^ c))        
        
def _choice_swap(k, a, b):
    t = a;
    a = _choice(k, a, b)
    b = _choice(k, b, t)    
    return a, b            
            
def _generate_shuffle_key_material(byte_count, prng=lambda amount: bytearray(urandom(amount))):       
    decisions = []    
    for byte in prng(byte_count):
        for bit in range(8):
            decisions.append(_fill_word(byte & (1 << bit)))
    return decisions
    
def _fill_word(bit, wordsize=64):
    r = 1
    while wordsize > 1:        
        bit ^= rotate_left(bit, r, wordsize * r)
        r *= 2
        wordsize /= 2
    
    return bit
    
def test_shuffle():
    items = range(16)
    while not raw_input("Enter any key + enter to quit, or enter to continue: "):
        shuffle(items, 64)
        print items
        
if __name__ == "__main__":
    test_shuffle()
    