def rotate_left(a, amount):
    return ((a << amount) | (a >> (32 - amount))) & 0xFFFFFFFF
    
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def _permutation(a, b, c, d, rotations, mask=0xFFFFFFFF):  
    a = (a + b) & mask
    a ^= c;
    a = (a + d) & mask
    a = rotate_left(a, rotations)
    a ^= b
    a = (a + c) & mask
    a ^= d
    a = rotate_left(a, rotations);
    return a
    
def permutation(a, b, c, d):
    a = _permutation(a, b, c, d, 2)
    b = _permutation(b, c, d, a, 4)
    c = _permutation(c, d, a, b, 8)
    d = _permutation(d, a, b, c, 16)
    return a, b, c, d