def peasant_multiplication(x, y, prim=0, field_charac_full=256):    
    r = 0
    while y:         
        if y & 1: 
            r = r ^ x
        y = y >> 1 
        x = x << 1 
        if x & field_charac_full: 
            # GF modulo: if x >= 256 then apply modular reduction using the primitive polynomial (we just subtract, but since the primitive number can be above 256 then we directly XOR).
            x = x ^ prim 
    return r
    
def galois_multiplication(a, b):
    """Galois multiplication of 8 bit characters a and b."""
    p = 0
    for counter in range(8):
        if b & 1: p ^= a
        hi_bit_set = a & 0x80
        a <<= 1
        # keep a 8 bit
        a &= 0xFF
        if hi_bit_set:
            a ^= 0x1b
        b >>= 1
    return p

class Polynomial(object):
    
    def __init__(self, value, modulus=0):
        self.value = value
        self.modulus = modulus
        
    def __add__(self, other_polynomial):
        return self.value ^ other_polynomial.value
        
    def __mul__(self, other_polynomial):               
        return Polynomial(galois_multiplication(self.value, other_polynomial.value))
     
    def __pow__(self, exponent):                
        result = self       # result is n
        for count in range(exponent - 1):            
            result = result * self # result is nn 
        return result
        
    @classmethod
    def unit_test(cls):
        a = cls(13, 0x11b)
        b = cls(13, 0x11b)
        c = a * b
        d = a ** 2
        print format(a.value, 'b').zfill(16)
        print format(b.value, 'b').zfill(16)
        print format(c.value, 'b').zfill(16)
        print format(d.value, 'b').zfill(16)
        
if __name__ == "__main__":
    Polynomial.unit_test()
    