from arxcalibur512 import shift_rows

def mix_columns(a, b, c, d, mask=(2 ** 32) - 1):
    #a |= (b | ((a & b) << 1)) & mask # does not do much better then below
    #c |= (d | ((c & d) << 1)) & mask
    #b |= (c | ((b & c) << 1)) & mask
    #d |= (a | ((d & a) << 1)) & mask
        
    a |= b  # requires 3 applications of mix block to saturate
    c |= d
    b |= c
    d |= a
    
    #t = a    # requires only 2 applications of mix block to saturate
    #a = (a | b) | c
    #c = (b | c) | d
    #d = (d | a) | t
    #b |= c | t       
    
    
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
    return a, b, c, d
        
        
def mix_block(a, b, c, d):
   # a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shuffle_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 1, 2, 3)
    
#    a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shuffle_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 4, 8, 12)

 #   a, b, c, d = mix_columns(a, b, c, d)
    a, b, c, d = shuffle_columns(a, b, c, d)
    b, c, d = shift_rows(b, c, d, 8, 12, 16) 
    return a, b, c, d
    
def visualize_mix_block():
    from crypto.analysis.visualization import test_4x32_function
    for a in range(32):
        #for b in range(32):
        #    for c in range(32):
        #        for d in range(32):
        #            test_4x32_function(mix_block, (1 << a, 1 << b, 1 << c, 1 << d))
        test_4x32_function(mix_block, (1 << a, 0, 0, 0))
        test_4x32_function(mix_block, (0, 1 << a, 0, 0))
        test_4x32_function(mix_block, (0, 0, 1 << a, 0))
        test_4x32_function(mix_block, (0, 0, 0, 1 << a))
    
    
if __name__ == "__main__":
    visualize_mix_block()
    