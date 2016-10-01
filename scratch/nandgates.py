def _not(a, mask=0xFFFFFFFFFFFFFFFF):
    return ~a & mask
    
def _and(a, b):
    return a & b
    
def nand(a, b):
    return _not(_and(a, b))
    
def xor(a, b):  
    temp = nand(a, b)
    return nand(nand(a, temp), nand(b, temp))    
    
def choice(a, b, c):    
    return c ^ (a & (b ^ c))
    #return xor(c, _and(a, xor(b, c)))
    
def majority(a, b, c):    
    return (a & b) | (a & c) | (b & c)   
    #return _or(_or(_and(a, b), _and(a, c)), _and(b, c))
        
def test_xor():             
    a = b = 0
    assert xor(a, b) == a ^ b, (xor(a, b), a ^ b)
    a = 1
    assert xor(a, b) == a ^ b, (xor(a, b), a ^ b)
    b = 1
    assert xor(a, b) == a ^ b, (xor(a, b), a ^ b)
    a = 0
    assert xor(a, b) == a ^ b, (xor(a, b), a ^ b)
    
def test_choice():
    assert choice(0, 1, 1) != choice(1, 0, 1)
    assert choice(0, 1, 0) != choice(0, 1, 1)   
    
if __name__ == "__main__":
    test_xor()
    test_choice()
    