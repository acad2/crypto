from crypto.utilities import is_prime, size_in_bits, gcd, random_integer

# to factor z = xy
# generate a random n = pq
# reduce z by gcd(z, n) until z == 1
# number of reductions * gcd(
    
def factor(n, limit=2 ** 24):    
    if n in (0, 1, 2, 3) or is_prime(n):
        return [n]
            
    _factor = 1
    attempt_number = 0    
    while attempt_number < limit and _factor in (1, n):
        k = random_integer((size_in_bits(n) / 8) or 1)
        _factor = gcd(n, k)
        attempt_number += 1
    if attempt_number == limit:
        raise ValueError("{} may be the product of primes".format(n))
        
    _factor2 = n / _factor
    factors = [_factor, _factor2]
    output = []
    for _n in factors:    
        output.extend(factor(_n))
    return output

def test_factor():
    for size in range(4, 256):
        print("Factoring {}-bit number".format(size * 8))
        x = random_integer(size)
        try:
            factors = factor(x)
        except ValueError:
            x = random_integer(size)
        _x = 1
        for y in factors:
            _x *= y
        assert x == _x, (x, factors)     
        print x, factors
        
if __name__ == "__main__":
    test_factor()
    