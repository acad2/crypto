from crypto.utilities import rotate_left

def _nonlinear_function(a, b, c, amount, mask=0xFFFFFFFF):      
    
    #b ^= mask
    #a &= b
    #c = rotate_left(c, amount, 32)
    #c ^= a 
    #a = rotate_left(a, amount, 32)
    #a ^= b     
    
    #a &= b 
    #c = rotate_left(c, amount, 32)
    #b ^= a
    #a ^= mask
    #c ^= a 
    #
    #a ^= b              
    #b ^= c 
    return a, b, c

def weird_addition(a, b, amount):    
    t = a 
    t &= b
    a ^= b
    a = rotate_left(a, amount, 32)
    a ^= t
    return a
    
def weird_addition2(a, b, amount):    
    t = a 
    t &= b
    a ^= b
    b = rotate_left(b, amount, 32)
    b ^= t
    return a, b    
    
def prng(a, b, c, d, mask=0xFFFFFFFF):    
    a ^= b
    c ^= mask
    a &= c 
    a = rotate_left(a, 1)
    
    #a, b = weird_addition2(a, b, 1)
    #a, c = weird_addition2(a, c, 2)
    #a, d = weird_addition2(a, d, 3)
    #
    #c, b = weird_addition2(c, b, 4)
    #c, d = weird_addition2(c, d, 5)
    #c, a = weird_addition2(c, a, 6)
    #
    #b, a = weird_addition2(b, a, 7)
    #b, c = weird_addition2(b, c, 8)
    #b, d = weird_addition2(b, d, 9)
    #
    #d, a = weird_addition2(d, a, 10)
    #d, c = weird_addition2(d, c, 11)
    #d, b = weird_addition2(d, b, 12)
    
    #c, d = weird_addition2(c, d, 2)
    #
    #a, c = weird_addition2(a, c, 3)
    #b, d = weird_addition2(b, d, 4)
    #
    #a, d = weird_addition2(a, d, 5)
    #b, c = weird_addition2(b, c, 6)
    
    
    #a = weird_addition(a, b ^ c ^ d, 1)    
    #b = weird_addition(b, a ^ c ^ d, 2)    
    #c = weird_addition(c, a ^ b ^ d, 3)    
    #d = weird_addition(d, a ^ b ^ c, 4)
    #a = (a + key) & mask
    #key ^= a ^ b
    #b = (b + key) & mask
    #key ^= b ^ c
    #c = (c + key) & mask
    #key ^= c ^ d
    #d = (d + key) & mask
    #a, b, c = _nonlinear_function(a, b, c, 1)
    #b, c, a = _nonlinear_function(b, c, d, 2)
    #c, a, b = _nonlinear_function(c, a, b, 3) 
    
    #key ^= a ^ b
    #
    #b, key = _nonlinear_function(b, key)
    #key ^= b ^ c
    #
    #c, key = _nonlinear_function(c, key)
    #key ^= c ^ d
    #
    #d, key = _nonlinear_function(d, key)
    return rotate_left(a, 4, 32), rotate_left(b, 8, 32), rotate_left(c, 16, 32), rotate_left(d, 24, 32)
    
def test_prng():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(prng, (0, 0, 1, 0))
    
if __name__ == "__main__":
    test_prng()
    