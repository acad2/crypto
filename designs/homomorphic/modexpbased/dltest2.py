# g ^ x mod p == g * g * g * g * g ... * g mod p
# x = 36
# g = 3
# g g g g g g  g g g g g g  g g g g g g  g g g g g g  g g g g g g  g g g g g g
# _g ** multiply(prime_factors(x)) == g g g g g g
# _g ** 6 == (g ** 6) ** 6 == g ** 36

# g ^ x mod p == (g ** product(prime_factors(x))) ** y
# x == product(factors(x)) * y mod p

# complexity:
# naive method:
# for exponent_guess in counter:
#    if g ** exponent mod p == n:
#       return exponent
# requires log(exponent) time to guess
# this method:
# _factors := product(prime_factors(exponent))
# _g = g ** _factors
# for exponent_guess in counter:
#   if _g ** exponent_guess mod p == n:
#       return _factors * exponent_guess mod p
# requires log(exponent) / _factors time to guess
# have to guess factors (1/N numbers have N as a factor)
# very small improvement over brute force
import itertools

def discrete_logarithm(n, factors, g, p):
    _g = pow(g, factors, p)
    for count in itertools.count():        
        if pow(_g, count, p) == n:
            return (factors * count) % p
            
def test_discrete_logarithm():
    from crypto.utilities import big_prime
    print "Computing e"
    _e = big_prime(32)
    e = _e * 2 * 3 * 5
    g = 3
    print "Computing p"
    p = big_prime(40)
    print "Computing pow"
    n = pow(g, e, p)
    print "Computing dl"
    __e = discrete_logarithm(n, _e, g, p)
    assert __e == e
    
if __name__ == "__main__":
    test_discrete_logarithm()
    