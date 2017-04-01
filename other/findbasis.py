# finding the basis of a lattice
# for however many pairs:
# take the difference of any two points: d_0
# take the difference of any other two points: d_1
# compute gcd(d_0, d_1)
# the smallest factor found is the basis

from fractions import gcd
from os import urandom
import random

def compute_gcd_difference(point_generator):
    p0, p1, p2, p3 = [next(point_generator) for count in range(4)]
    d_0 = abs(p0 - p1)
    d_1 = abs(p2 - p3)
    return gcd(d_0, d_1)
        
def find_basis(point_generator):
    basis = compute_gcd_difference(point_generator)
    while True:
        try:
            _basis = compute_gcd_difference(point_generator)
        except StopIteration:
            break
        else:      
            if _basis == 0:
                continue            
            if _basis < basis or basis == 0:
                basis = _basis            
    return basis    
    
def test_find_basis():
    p_count = 256
    for p in range(1, p_count):    
        def point_generator(p, start, end):
            for point in range(start, end):
                yield (p * point)#ord(urandom(1)))
        generator = point_generator(p, 0, 256)
        basis = find_basis(generator)
        assert basis == p, (basis, p)
           
def break_gcd_cipher():
    from crypto.designs.integers.gcd import encrypt, decrypt
    from os import urandom        
    for _m in range(1, 256):
        m = 0
        while not m:
            m = ord(urandom(1))
        k = ord(urandom(1))
        
        def point_generator(m, k, point_count=32):
            for count in range(point_count):
                yield encrypt(m, k)[0]
        recovered_m = find_basis(point_generator(m, k))
        assert recovered_m == m, (recovered_m, m)
        print("Recovered m: {}".format(recovered_m))
        
        
    
if __name__ == "__main__":
    test_find_basis()
    break_gcd_cipher()
    