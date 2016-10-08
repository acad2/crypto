
def rotl64(x, r, _mask=0xFFFFFFFFFFFFFFFF):    
    return ((x << r) | (x >> (64 - r))) & _mask   
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def round_function(a, b, c, d):    
    a ^= rotl64(choice(b, c, d), 1)
    b ^= rotl64(choice(c, d, a), 2)
    c ^= rotl64(choice(d, a, b), 3)
    d ^= rotl64(choice(a, b, c), 5)    
            
    a ^= rotl64(choice(b, c, d), 16)
    b ^= rotl64(choice(c, d, a), 20)
    c ^= rotl64(choice(d, a, b), 24)
    d ^= rotl64(choice(a, b, c), 28)    
    
    
    
    return a, b, c, d

def round_function2(a, b, c, d, k):   
    a ^= rotl64(choice(b, c, d), 29);
    b ^= rotl64(choice(c, d, a), 31);    
    c ^= rotl64(choice(d, a, b), 37);    
    d ^= rotl64(choice(a, b, c), 1); 
    
    t = a;
    a = rotl64(choice(k, a, b), 1);
    b = rotl64(choice(k, b, t), 2);
    
    t = c;
    c = rotl64(choice(k, c, d), 3);
    d = rotl64(choice(k, d, t), 5);

    a ^= rotl64(choice(b, c, d), 29);
    b ^= rotl64(choice(c, d, a), 31);    
    c ^= rotl64(choice(d, a, b), 37);    
    d ^= rotl64(choice(a, b, c), 1);     
    
    t = b;
    b = rotl64(choice(k, b, c), 16);
    c = rotl64(choice(k, c, t), 20);
    
    t = d;
    d = rotl64(choice(k, d, a), 24);
    a = rotl64(choice(k, t, d), 28);

    #a ^= rotl64(choice(b, c, d), 29);
    #b ^= rotl64(choice(c, d, a), 31);    
    #c ^= rotl64(choice(d, a, b), 37);    
    #d ^= rotl64(choice(a, b, c), 1);    
    
    
    return a, b, c, d, k ^ a
    
def round_function_unrolled(a, b, c, d,  _mask=0xFFFFFFFFFFFFFFFF):
    t = d ^ (b & (c ^ d))
    a ^= ((t << 1) | (t >> (64 - 1))) & _mask
    
    t = a ^ (c & (d ^ a))
    b ^= ((t << 2) | (t >> (64 - 2))) & _mask
    
    t = b ^ (d & (a ^ b))
    c ^= ((t << 4) | (t >> (64 - 4))) & _mask
    
    t = c ^ (a & (b ^ c))
    d ^= ((t << 8) | (t >> (64 - 8))) & _mask
                
                
    t = d ^ (b & (c ^ d))
    a ^= ((t << 16) | (t >> (64 - 16))) & _mask
    
    t = a ^ (c & (d ^ a))
    b ^= ((t << 32) | (t >> (64 - 32))) & _mask
    
    t = b ^ (d & (a ^ b))
    c ^= ((t << 48) | (t >> (64 - 48))) & _mask
    
    t = c ^ (a & (b ^ c))
    d ^= ((t << 56) | (t >> (64 - 56))) & _mask                                
    return a, b, c, d   
   
def test_round_function():
    from crypto.analysis.visualization import test_4x64_function
    test_4x64_function(round_function, (1, 0, 0, 0))
    
def test_round_function2():
    from crypto.analysis.visualization import test_4x64_function
    test_4x64_function(round_function2, (1, 0, 0, 0, 1))
    
if __name__ == "__main__":
    test_round_function()
    test_round_function2()
    