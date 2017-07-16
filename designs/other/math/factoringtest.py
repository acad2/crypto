# input: N such that N = xy
# two step process
# step 1:
# choose a prime P > N
# observe that xy mod P \equiv x_iy_i mod P
# if x_iy_i > P:
#   select another P and calculate x_iy_i again
# else x_iy_i < P:
#    lazily/naive factor the multiplicative inverse of N modulo P to obtain some factors of x_iy_i 
#      - only search for "easy" results, i.e. small primes
#        - once the search stops yielding results, abandon it
#        - recursively apply the factoring algorithm to the remainder and accumulate the output
#      - compute the modular inverse of factors produced this way, and accumulate them into the output container
#    - output consists of [a, b, c, ..., n] where abc...n mod P \equiv xy mod P
# step 2:
# some subset of the output of step 1 produces a product modulo P that is equal to x mod P (similarly for y mod P)
# find the subset of elements such that N % (product(subset) % P) == 0
# if N % (product(subset) % P) == 0, then product(subset) % P equals either x or y
# input: [a, b, c, ... , n], P, N   
# output x, y such that xy mod P == N <- did not yield x or y in test

from crypto.utilities import modular_inverse, big_prime, gcd, factor_integer

def naive_factoring(number):    
    factors = []
    for n, exponent in factor_integer(number).items():
        factors.extend([n] * exponent)
    return factors
    
def factor_part1(xy, modulus_size=0, p=None, factoring_method=naive_factoring):
    if p is None:
        if modulus_size == 0:
           raise ValueError("modulus_size or p required") 
        p = big_prime(modulus_size) 
        while p <= xy:
            p = big_prime(modulus_size)    
    inverse_xy = modular_inverse(xy, p)
    #print "Factoring: ", xy, inverse_xy, modular_inverse(inverse_xy, p), p
    #print "Test factoring:", inverse_xy
    factors = factoring_method(inverse_xy) 
    #print "Obtained factors: ", factors
    _factors = []
    for item in factors:     
        _factors.extend(factoring_method(modular_inverse(item, p)))    

    return _factors, p
    
def assemble_factors(factors, p):
    #return itertools.product(*[[
    possibilities = []
    for index, number in enumerate(factors[:-1]):
        for number2 in factors[index + 1:]:
            possibilities.append(number * number2)
            possibilities.append(possibilities[-1] * number2)
    
    
def test_factor_part1():
    x = 13
    y = 11
    xy = x * y
    from math import log
    while not raw_input("..."):        
        factors, p = factor_part1(xy, modulus_size=1)        
        try:
            print factors, p, [log(item, 2) for item in factors], log(p, 2)
        except TypeError:
            print
        
        
if __name__ == "__main__":
    test_factor_part1()
    