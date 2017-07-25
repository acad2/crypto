from crypto.utilities import random_integer, modular_inverse, big_prime

# g^x mod p == g ^ ab mod p
# generate additional g ^ cd mod p and compute gcd(ab, cd) via egcd modified to operate on the exponents

def gcd_on_exponent(n, g, p, r_size, limit):    
    searching = True
    while searching:
        r = random_integer(r_size)
        k = pow(g, r, p)
        
        #n =  g g g g g g g g g
        #k =  g g g g g g 
        _n = n
        for counter in range(limit):    
            _n = (_n * modular_inverse(k, p)) % p        
            if _n == k:
                searching = False
            _n, k = k, _n                 
    #_n = g g g
    return _n
    
def generate_factor(n, _n, p):    
    # start reducing n by _n and count the number of times until n == 1
    # the count is one of the factors of x from g ^ x mod p
    # can do with many candidate _n in parallel    
    factor = 0
    _n = modular_inverse(_n, p)
    while n != 1:
        n = (n * _n) % p
        factor += 1
        print "...", factor
    return factor
    
def discrete_logarithm(n, g, p, r_size, factor_count=16):
    factors = []
    for count in range(factor_count):
        print "Computing unknown factor...", count
        unknown_factors = gcd_on_exponent(n, g, p, r_size, 2 ** (r_size * 8))
        print "Computing known factor...", count
        known_factor = generate_factor(n, unknown_factors, p)
        factors.append(known_factor)
        print "Current factors: ", factors
    # test products to find x   
    print factors
    
def test_discrete_logarithm():
    g = 3
    x = random_integer(1) or random_integer(1)
    p = 257#big_prime(3)
    n = pow(g, x, p)
    print "Computing factors of: ", x
    discrete_logarithm(n, g, p, 2)
    
if __name__ == "__main__":
    test_discrete_logarithm()
    