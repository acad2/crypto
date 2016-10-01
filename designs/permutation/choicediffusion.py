from pride.crypto.utilities import rotate_left

def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def keyed_permutation(a, b, c, d, k0=1, k1=0, k2=0, k3=0, mask=0xFFFFFFFF):    
    #a = rotate_left((a + b ^ c ^ d) & mask, 1, bit_width=32)
    #b = rotate_left((b + a ^ c ^ d) & mask, 2, bit_width=32)
    #c = rotate_left((c + a ^ b ^ d) & mask, 3, bit_width=32)
    #d = rotate_left((d + a ^ b ^ c) & mask, 5, bit_width=32)    
    
    #a = (a + (b ^ c ^ d)) & mask
    #b = (b + (a ^ c ^ d)) & mask
    #c = (c + (b ^ a ^ d)) & mask
    #d = (d + (b ^ c ^ a)) & mask
    
    #_t = a
    #a = choice(k0, a, b) 
    #b = choice(k0, b, _t)
    #    
    #_t  
    #c = choice(k1, c, d) 
    #d = choice(k1, d, _t)
    #    
    #_t = a
    #a = choice(k2, a, c) 
    #c = choice(k2, c, _t)
    #    
    #_t = b
    #b = choice(k3, b, d) 
    #d = choice(k3, d, _t)
    
   # _t = a
   # a = rotate_left(choice(k0, a, b) , 1, bit_width=32)
   # b = rotate_left(choice(k0, b, _t), 3, bit_width=32)
   #     
   # _t  
   # c = rotate_left(choice(k1, c, d) , 5, bit_width=32)
   # d = rotate_left(choice(k1, d, _t), 7, bit_width=32)
   #     
   # _t = a
   # a = rotate_left(choice(k2, a, c) , 11, bit_width=32)
   # c = rotate_left(choice(k2, c, _t), 13, bit_width=32)
   #     
   # _t = b
   # b = rotate_left(choice(k3, b, d) , 17, bit_width=32)
   # d = rotate_left(choice(k3, d, _t), 19, bit_width=32)
    
    
   # a = rotate_left(a ^ choice(a, b, c), 7 , bit_width=32)
   # b = rotate_left(b ^ choice(b, c, d), 11, bit_width=32)
   # c = rotate_left(c ^ choice(c, d, a), 13, bit_width=32)
   # d = rotate_left(d ^ choice(d, a, b), 17, bit_width=32)
        
#    a = rotate_left((a + (b ^ c ^ d)) & mask, 1, bit_width=32)  
#    b = rotate_left((b + (a ^ c ^ d)) & mask, 2, bit_width=32)
#    c = rotate_left((c + (a ^ b ^ d)) & mask, 3, bit_width=32)
#    d = rotate_left((d + (a ^ b ^ c)) & mask, 5, bit_width=32)
#    
#    a = rotate_left(a ^ choice(b ^ k0, c, d), 7 , bit_width=32)           
#    b = rotate_left(b ^ choice(c ^ k1, d, a), 11, bit_width=32)        
#    c = rotate_left(c ^ choice(d ^ k2, a, b), 13, bit_width=32)          
#    d = rotate_left(d ^ choice(a ^ k3, b, c), 17, bit_width=32)  
  
    _t = b
    b = choice(k1, b, c)
    c = choice(k1, c, _t)    
               
    _t = d
    d = choice(k3, d, a) 
    a = choice(k3, a, _t)
    
    _t = a
    a = choice(k0, a, b)
    b = choice(k0, b, _t)
   
    _t = c
    c = choice(k2, c, d)
    d = choice(k2, d, _t)
            
    a = rotate_left(a, 0, bit_width=32)
    b = rotate_left(b, 1 + 8, bit_width=32)
    c = rotate_left(c, 2 + 16, bit_width=32)
    d = rotate_left(d, 3 + 24, bit_width=32)    
    #for round in range(1):
        #a = rotate_left((a + (b ^ c ^ d) & mask), 24, bit_width=32)
        #b = rotate_left((b + (a ^ c ^ d) & mask), 16, bit_width=32)
        #c = rotate_left((c + (b ^ a ^ d) & mask), 8, bit_width=32)
        #d = rotate_left((d + (b ^ c ^ a) & mask), 0, bit_width=32)
        #
        #a = rotate_left((a + choice(d, b, c) & mask), 0, bit_width=32)
        #b = rotate_left((b + choice(a, c, d) & mask), 1, bit_width=32)
        #c = rotate_left((c + choice(b, d, a) & mask), 2, bit_width=32)
        #d = rotate_left((d + choice(c, a, b) & mask), 3, bit_width=32)

        #a = rotate_left((a + (b ^ c ^ d) & mask), 17, bit_width=32)
        #a = rotate_left((a + choice(d, b, c) & mask), 5, bit_width=32)
        #
        #b = rotate_left((b + (a ^ c ^ d) & mask), 13, bit_width=32)
        #b = rotate_left((b + choice(a, c, d) & mask), 1, bit_width=32)
        #
        #c = rotate_left((c + (b ^ a ^ d) & mask), 11, bit_width=32)
        #c = rotate_left((c + choice(b, d, a) & mask), 2, bit_width=32)
        #
        #d = rotate_left((d + (b ^ c ^ a) & mask), 7, bit_width=32)               
        #d = rotate_left((d + choice(c, a, b) & mask), 3, bit_width=32)        

            
    return a, b, c, d
    
def visualize_keyed_permutation():
    from pride.crypto.analysis.visualization import test_4x32_function
    from os import urandom
    from pride.crypto.utilities import bytes_to_integer
    test_4x32_function(keyed_permutation, (0, 0, 0, 1) + tuple(bytes_to_integer(bytearray(urandom(4))) for count in range(4)))
    
def test_active_bits():
    from pride.crypto.analysis.active_bits import search_minimum_active_bits
    search_minimum_active_bits(lambda args: keyed_permutation(*args), lambda *args: args, lambda args: args)
    
    
if __name__ == "__main__":
    visualize_keyed_permutation()
    #test_active_bits()
    