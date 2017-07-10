from crypto.utilities import rotate_left, choice, slide

def choice_swap(a, b, k):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)        
    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def sbox(a, b, c, d):    
    t = a;
    a = (a & b) ^ c
    c = (b | c) ^ d
    d = (d & a) ^ t
    b ^= c & t
    return a, b, c, d
    
def bit_transposition(bits, k0, k1, k2, k3, size=32):     
    a, b, c, d = [int(_bits, 2) for _bits in slide(bits, size)]
    for round in range(4):                                  
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 1, size)
        c = rotate_left(c, 2, size)
        d = rotate_left(d, 3, size)               
                
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 4, size)
        c = rotate_left(c, 8, size)
        d = rotate_left(d, 12, size)                              
                
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                    
        b = rotate_left(b, 8, size)
        c = rotate_left(c, 12, size)
        d = rotate_left(d, 16, size)        
                
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        a, b, c, d = b, c, d, a 
        # key schedule   
        k0, k1, k2, k3 = sbox(k0, k1, k2, k3)        
    return [int(item) for item in ''.join(format(word, 'b').zfill(32) for word in (a, b, c, d))]
        
    