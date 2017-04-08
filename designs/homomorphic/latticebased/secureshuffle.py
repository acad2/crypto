from os import urandom

from crypto.utilities import rotate_left, integer_to_words, words_to_integer, slide
    
def secure_shuffle(container, wordsize, prng=lambda amount: bytearray(urandom(amount))):    
    _backup = set(container)
    size = len(container)
    decisions = generate_shuffle_key_material(size, prng=prng)
    index1, index2 = 0, 1    
    mask = 0xFFFFFFFFFFFFFFFF
    while decisions:
        decision = decisions.pop(0)              
        worda, wordb = container[index1], container[index2]              
        worda = integer_to_words(worda, wordsize, 64)        
        wordb = integer_to_words(wordb, wordsize, 64)         
        #for index in range(len(worda)):                
        #    worda[index], wordb[index] = choice_swap(decision, worda[index], wordb[index])                
        worda, wordb = words_to_integer(worda, 64), words_to_integer(wordb, 64)  
        #assert worda == _a
        #assert wordb == _b
        container[index1], container[index2] = worda, wordb
        index2 += 1        
        if index2 == size:
            index1 += 1
            index2 = index1 + 1
        if index1 == size - 1:
            index1 = 0
            index2 = 1
    assert _backup == set(container), len(_backup.difference(container))
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))        
        
def choice_swap(k, a, b):
    t = a;
    a = choice(k, a, b)
    b = choice(k, b, t)    
    return a, b            
            
def generate_shuffle_key_material(word_count, prng=lambda amount: bytearray(urandom(amount))):    
    generator = prng(word_count ** 2)        
    decisions = []
    for byte in prng(32):
        for bit in range(8):
            decisions.append(fill_word(byte & (1 << bit)))
    return decisions
    
def fill_word(bit, wordsize=64):
    r = 1
    while wordsize > 1:        
        bit ^= rotate_left(bit, r, wordsize * r)
        r *= 2
        wordsize /= 2
    
    return bit
    
def test_secure_shuffle():
    items = range(16)
    while not raw_input("Enter any key + enter to quit, or enter to continue: "):
        secure_shuffle(items, 64)
        print items
        
if __name__ == "__main__":
    test_secure_shuffle()
    