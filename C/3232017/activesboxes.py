import itertools
from math import log

from crypto.utilities import slide, rotate_left, integer_to_bytes, bytes_to_integer

def next_bit_permutation(v, mask=0xFFFFFFFF):
    t = (v | (v - 1)) + 1
    return (t | ((((t & -t) / (v & -v)) >> 1) - 1)) & mask
    
def invert(word, mask=0xFFFFFFFF):
    return word ^ mask
    
def bit_generator(seed_weight, mask=0xFFFFFFFF):    
    _seed_weight = seed_weight    
    while True:                
        yield seed_weight    
        if not seed_weight:            
            break        
        seed_weight = next_bit_permutation(seed_weight, mask)    

def search_minimum_active_sboxes(permutation, test_inputs=[bit_generator(1) for count in range(4)], _counter=lambda: bit_generator(1),
                                 word_size=32, chunk_size=65536, display_progress=True):    
    last_outputs = permutation(0, 0, 0, 0)           
    results = []
    input_generator = itertools.product(*test_inputs)
    chunks = 2 ** 20 / chunk_size
    assert not 2 ** 20 % chunk_size
    finished = False
    progress = 0
    while True:
        for counter in range(chunk_size):
            try:
                inputs = next(input_generator)                  
            except StopIteration:
                finished = True
                break
            outputs = permutation(*inputs)
            
            active_sboxes = 0
            a0, b0, c0, d0 = last_outputs
            a1, b1, c1, d1 = outputs
            for index in range(word_size):
                mask = 1 << index                                
                word0 = (a0 & mask) | ((b0 & mask) << 1) | ((c0 & mask) << 2) | ((d0 & mask) << 3)
                word1 = (a1 & mask) | ((b1 & mask) << 1) | ((c1 & mask) << 2) | ((d1 & mask) << 3)                
                if word0 != word1:
                    active_sboxes += 1
            results.append(active_sboxes)            
            last_outputs = outputs
        progress += 1
        if finished:
            break        
        if display_progress:                      
            print("\n" + ('-' * 79))
            print "Displaying progress: {}".format(log(progress * chunk_size, 2))
            display_stats(results)
            
    print("\nSearch complete" + ('-' * (80 - len("\nSearch complete"))))
    print("Search space: 2 ** {}".format(log(progress * chunk_size, 2)))
    display_stats(results)
          
def display_stats(output):
    print("Minimum #: {}".format(min(output)))
    print("Median  #: {}".format(sorted(output)[len(output) / 2]))
    print("Average #: {}".format(sum(output) / float(len(output)))) 
    
def test_search_minimum_active_sboxes():
    def test_function(a, b, c, d):
        for round in range(2):
            a ^= b; c ^= d; b ^= c; d ^= a;
            b = rotate_left(b, 1, 32)
            c = rotate_left(c, 2, 32)
            d = rotate_left(d, 3, 32)
            
            a ^= b; c ^= d; b ^= c; d ^= a;
            b = rotate_left(b, 4, 32)
            c = rotate_left(c, 8, 32)
            d = rotate_left(d, 12, 32)
            
            a ^= b; c ^= d; b ^= c; d ^= a;
            b = rotate_left(b, 8, 32)
            c = rotate_left(c, 12, 32)
            d = rotate_left(d, 16, 32)
        return a, b, c, d
    search_minimum_active_sboxes(test_function)
     
def test_search_minimum_active_sboxes2():
    def shift_rows(b, c, d, r1, r2, r3, mask=0xFFFFFFFF):
        _b = _c = _d = 0
        for count in range(4):
            shift_amount = count * 32            
            _b ^= rotate_left((b >> shift_amount) & mask, r1, 32) << shift_amount
            _c ^= rotate_left((c >> shift_amount) & mask, r2, 32) << shift_amount
            _d ^= rotate_left((d >> shift_amount) & mask, r2, 32) << shift_amount
        return _b, _c, _d          
    def slide_rows(b, c, d, word0=0xFFFFFFFF000000000000000000000000, 
                            word1=0x00000000FFFFFFFF0000000000000000, 
                            word2=0x0000000000000000FFFFFFFF00000000, 
                            word3=0x000000000000000000000000FFFFFFFF):              
        # b: 1, 2, 3, 0
        # c: 2, 3, 0, 1
        # d: 3, 0, 1, 2                
        #_b = ((b & word1) << 32) | ((b & word2) << 32) | ((b & word3) << 32) | ((b & word0) >> 96)        
        #_c = ((c & word2) << 64) | ((c & word3) >> 64) | ((c & word0) >> 64) | ((c & word1) >> 64)        
        #_d = ((d & word3) << 96) | ((d & word0) >> 32) | ((d & word1) >> 32) | ((d & word2) >> 32)        
        
        #_b = ((b & word1) << 64) | ((b & word2) << 0 ) | ((b & word3) >> 64) | ((b & word0) >> 0 )
        #_c = ((c & word2) << 32) | ((c & word3) >> 32) | ((c & word0) << 32) | ((c & word1) >> 32)
        #_d = ((d & word3) << 0 ) | ((d & word0) << 64) | ((d & word1) >> 0 ) | ((d & word2) >> 64)
        
        _b, _c, _d = [integer_to_bytes(word, 16) for word in (b, c, d)]
        _b = bytes_to_integer(_b[1 * 4:] + _b[:1 * 4])
        _c = bytes_to_integer(_c[2 * 4:] + _c[:2 * 4])
        #print
        #print list(bytearray(_d))
        _d = _d[3 * 4:] + _d[:3 * 4]
        #print list(bytearray(_d))
        _d = bytes_to_integer(_d)
        #if _b == __b: print 'b', True# (_b, __b)
        #if _c == __c: print 'c', True# (_c, __c)
        #if _d == __d: print 'd', True# (_d, __d)                
        return _b, _c, _d

    def mix_columns(a, b, c, d):
        a ^= b; c ^= d; b ^= c; d ^= a; a ^= b; c ^= d;        
        #a ^= b; c ^= d; b ^= c; d ^= a; a ^= c;  
        return a, b, c, d
            
    def test_function(a, b, c, d, constant=0x00000001):#000000020000000300000004):
        for count in range(1):
            a ^= constant
            constant += constant
            # each application of mix slice multiplies the number of influential bits in each bit by at least 2 ** 3
            for round in range(1): 
                b, c, d, a = mix_columns(a, b, c, d)
                b, c, d = shift_rows(b, c, d, 1, 2, 3)
                
                b, c, d, a = mix_columns(a, b, c, d)
                b, c, d = shift_rows(b, c, d, 4, 8, 12)
            
                b, c, d, a = mix_columns(a, b, c, d)
                b, c, d = shift_rows(b, c, d, 8, 12, 16)                                                      
            
        #    b, c, d = slide_rows(b, c, d)  
            
        #    a, b, c, d = mix_columns(a, b, c, d)                       
        #    b, c, d = shift_rows(b, c, d, 1, 2, 3)
        #    
        #    a, b, c, d = mix_columns(a, b, c, d)
        #    b, c, d = shift_rows(b, c, d, 4, 8, 12)
        #    
        #    a, b, c, d = mix_columns(a, b, c, d)
        #    b, c, d = shift_rows(b, c, d, 8, 12, 16)        
                        
            #t = a; a = (a & b) ^ c;  c = (b | c) ^ d; d = (d & a) ^ t; b ^= c & t;
            
                
        #print
        #print '\n'.join(format(word, 'b').zfill(128) for word in (a, b, c, d))
        #print '\n'.join(format(word, 'b').zfill(128) for word in (bytes_to_integer(bytearray(urandom(16))) for count in range(4)))
        #raw_input()
        return a, b, c, d
    search_minimum_active_sboxes(test_function, word_size=32)

def test_mix_columns_stats():
    from crypto.analysis.cryptanalysis import summarize_sbox
    
    def linear_function(a, b, c, d):
        # a = ab
        # c = cd
        # b = bcd
        # d = abd
        # a = ab + bcd == acd
        # c = cd + abd == abc
        # acd
        # abc
        # bcd
        # abd
        
        
        # a = ab
        # c = cd
        # b = bcd
        # d = abd
        # a = ab + cd == abcd
        
        # abcd
        # bcd
        # cd
        # abd
        
        
        a ^= b; c ^= d; b ^= c; d ^= a; a ^= b; c ^= d;
        #    a ^= c;       
        return a, b, c, d        
        
    def get_int(a, b, c, d):
        out = 0
    
        if a: out |= 0x01
        if b: out |= 0x02
        if c: out |= 0x04
        if d: out |= 0x08
    
        return out
    
    _sbox = []
    for _input in range(16):
        a = _input & 1
        b = (_input & 2) >> 1
        c = (_input & 4) >> 2
        d = (_input & 8) >> 3
        
        a, b, c, d = linear_function(a, b, c, d)
        _output = get_int(a, b, c, d)
        _sbox.append(_output)
    summarize_sbox(_sbox)
    
        
        
        
if __name__ == "__main__":
    #test_search_minimum_active_sboxes()
    test_search_minimum_active_sboxes2()
    #test_mix_columns_stats()
    