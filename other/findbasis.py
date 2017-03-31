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
    d_0 = abs(next(point_generator) - next(point_generator))
    d_1 = abs(next(point_generator) - next(point_generator))
    return gcd(d_0, d_1)
    
def find_basis(point_generator):
    _basis = []
    while True:
        try:
            basis = compute_gcd_difference(point_generator)
        except StopIteration:
            break
        else:                
            if basis != 0:
                _basis.append(basis)
    _basis = sorted(_basis)
    return _basis[0]
    
def test_find_basis():
    p_count = 512
    for p in range(1, p_count):    
        def point_generator(p, start, end):
            for point in range(start, end):
                yield (p * ord(urandom(1)))
        generator = point_generator(p, 0, 256)
        basis = find_basis(generator)
        assert basis == p, (basis, p)
           
if __name__ == "__main__":
    test_find_basis()
    