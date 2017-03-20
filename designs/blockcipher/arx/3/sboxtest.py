from crypto.utilities import rotate_left

def sbox_f(a, b, c, d):
    t = a    
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t        
    return a, b, c, d  
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def shuffle_columns(a, b, c, d):
    t = a
    a = choice(c, a, b)
    b = choice(c, b, t)
    
    t = c
    c = choice(a, c, d)
    d = choice(a, d, t)
    
    t = b
    b = choice(d, b, c)
    c = choice(d, c, t)
    
    t = d
    d = choice(b, d, a)
    a = choice(b, a, t)
    
    #t = a
    #a = choice(c, a, b)  # better
    #b = choice(c, b, t)
    #
    #t = c
    #c = choice(a, c, d)
    #d = choice(a, d, t)
    #
    #t = b
    #c = choice(d, b, c)
    #b = choice(d, c, t)
    #
    #t = d
    #a = choice(b, d, a)
    #d = choice(b, a, t)   
 
 
    #t = a
    #a = choice(b, a, c)
    #c = choice(b, c, t)
    #
    #t = b
    #b = choice(c, b, d)
    #d = choice(c, d, t)
    
    
    
    
    #t = a
    #a = choice(d, a, b)
    #b = choice(d, b, t) # alternative keying
    #
    #t = c
    #c = choice(b, c, d)
    #d = choice(b, d, t)
    #
    #t = b
    #b = choice(a, b, c)
    #c = choice(a, c, t)
    #
    #t = d
    #d = choice(c, d, a)
    #a = choice(c, a, t)   
   
    #t = c
    #c = choice(b, c, d)
    #d = choice(b, d, t)
    #
    #t = a
    #b = choice(d, a, b)
    #a = choice(d, b, t)
    #
    #t = d
    #d = choice(c, d, a)
    #a = choice(c, a, t)        
    #
    #t = b
    #b = choice(a, b, c)
    #c = choice(a, c, t)
    

   
    
    
    
    return a, b, c, d
      
def composed_sbox_f(a, b, c, d, mask={4: (2 ** 4) - 1}):    
    #print "Sboxing: "
    #print '\n'.join(format(word, 'b').zfill(4) for word in (a, b, c, d))
    a, b, c, d = sbox_f(a, b, c, d)       
    #a ^= b
    #c ^= d
    #b ^= c
    #d ^= a       
    b = rotate_left(b, 1, 4, _mask=mask)
    c = rotate_left(c, 2, 4, _mask=mask)
    d = rotate_left(d, 3, 4, _mask=mask)             
    #a ^= b
    #c ^= d
    #b ^= c
    #d ^= a    
    #b = rotate_left(b, 1, 4, _mask=mask)
    #c = rotate_left(c, 2, 4, _mask=mask)
    #d = rotate_left(d, 3, 4, _mask=mask)    
    #a ^= b
    #c ^= d
    #b ^= c
    #d ^= a    
    #b = rotate_left(b, 1, 4, _mask=mask)
    #c = rotate_left(c, 2, 4, _mask=mask)
    #d = rotate_left(d, 3, 4, _mask=mask)
    #
    a, b, c, d = sbox_f(a, b, c, d)
    #a ^= b
    #c ^= d
    #b ^= c
    #d ^= a    
    b = rotate_left(b, 1, 4, _mask=mask)
    c = rotate_left(c, 2, 4, _mask=mask)
    d = rotate_left(d, 3, 4, _mask=mask)
    #
    a, b, c, d = sbox_f(a, b, c, d)
    #a ^= b
    #c ^= d
    #b ^= c
    #d ^= a    
    b = rotate_left(b, 1, 4, _mask=mask)
    c = rotate_left(c, 2, 4, _mask=mask)
    d = rotate_left(d, 3, 4, _mask=mask)    
    
    a, b, c, d = sbox_f(a, b, c, d)
    b = rotate_left(b, 1, 4, _mask=mask)
    c = rotate_left(c, 2, 4, _mask=mask)
    d = rotate_left(d, 3, 4, _mask=mask)     
    a, b, c, d = sbox_f(a, b, c, d)
    #a ^= b
    #c ^= d
    #b ^= c    
    #d ^= a
    #
    #a ^= b
    #c ^= d
    #b ^= c    
    #d ^= a       
    
    #a, b, c, d = sbox_f(a, b, c, d)
    #b, c, d, a = sbox_f(a, b, c, d)
    #b, c, a, d = sbox_f(a, b, c, d)
    #c, d, a, b = sbox_f(a, b, c, d)
    #c, a, d, b = sbox_f(a, b, c, d)
    #d, a, b, c = sbox_f(a, b, c, d)
    #d, c, b, a = sbox_f(a, b, c, d)
    
    
    #t = a
    ##
    #a &= b
    #a ^= c
    ##
    #c |= b
    #c ^= d
    ##
    #d &= a
    #d ^= t
    ##    
    #b ^= c & t
    
    
    #a ^= b
    #c ^= d
    #b ^= c    
    #d ^= a
    #
    #a, b, c, d = sbox_f(a, b, c, d)    
    #a ^= b
    #c ^= d
    #b ^= c    
    #d ^= a    
    #a ^= b
    #c ^= d
    #b ^= c    
    #d ^= a      
    
    
    #a, b, c, d = shuffle_columns(a, b, c, d)
    #a, b, c, d = sbox_f(a, b, c, d)    
    #a, b, c, d = shuffle_columns(a, b, c, d)
    #print '\n'.join(format(word, 'b').zfill(4) for word in (a, b, c, d))
    #return [item >> 3 for item in (a & 8, b & 8, c & 8, d & 8)]
    #return a & 1, (b & 2) >> 1, (c & 4) >> 2, (d & 8) >> 3
    return a & 1, b & 1, c & 1, d & 1
    #return (a & 2) >> 1, (b & 4) >> 2, (c & 8) >> 3, d & 1
    
def test_sbox_representation():    
    SBOX = [int(character, 16) for character in "086d5f7c4e2391ba"]
    
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
        
        a, b, c, d = sbox_f(a, b, c, d)
        _output = get_int(a, b, c, d)
        assert SBOX[_input] == _output, (SBOX[_input], _output, _input, a, b, c, d)        
        _sbox.append(_output)
  
def test_sbox():
    SBOX = [int(character, 16) for character in "086d5f7c4e2391ba"]

    def test_function(_input):
        a = _input & 1
        b = (_input & 2) >> 1
        c = (_input & 4) >> 2
        d = (_input & 8) >> 3
        a, b, c, d = sbox_f(a, b, c, d)        
        assert (d << 3) | (c << 2) | (b << 1) | a == SBOX[_input], (output, SBOX[_input], _input)
        return (d << 3) | (c << 2) | (b << 1) | a    

    from crypto.analysis.cryptanalysis import summarize_sbox                
    summarize_sbox([test_function(counter) for counter in range(16)])
    
def test_composed_sbox():
    def test_function(_input):
        a = _input & 1
        b = (_input & 2) >> 1
        c = (_input & 4) >> 2
        d = (_input & 8) >> 3
        a, b, c, d = composed_sbox_f(a, b, c, d)  
        print (d << 3) | (c << 2) | (b << 1) | a    
        return (d << 3) | (c << 2) | (b << 1) | a    

    from crypto.analysis.cryptanalysis import summarize_sbox                
    summarize_sbox([test_function(counter) for counter in range(16)])
    

    
if __name__ == "__main__":
    #test_sbox_representation()
    #test_sbox()
    test_composed_sbox()
    