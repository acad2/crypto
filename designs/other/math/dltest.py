# g^x mod p == g ^ ab mod p
# g^y mod p == g g g g g g g g g...
# g^x mod p == g g g g g g...

# compute gcd  g g g g g g g g g
#              g g g g g g
#            = g g g
# until x == y: 
#   y -= x; 
#   x, y = y, x;
# g^y * inverse(g^x) == g^(y - x)

# discrete logarithm on g^x 
# generate random g ^ y (can simply generate random r)
# compute gcd(g^x, g^y) to obtain unknown basis factors g^z == g g g...
# set n to g^x and reduce n via (n * inverse(g^z)) mod p until n == 1; 
#   - the number of reductions "count" is a factor of x 
#       - count * g g g ... == g g g g g g g ... g_x
from crypto.utilities import random_integer, modular_inverse, big_prime

def gcd_on_exponent(n, g, p, r_size, limit):    
    searching = True
    while searching:
        k = random_integer(r_size)
        while not k:
            k = random_integer(r_size) 
        #k = r#pow(g, r, p)
        
        #n =  g g g g g g g g g
        #k =  g g g g g g 
        _n = n
        for counter in range(limit):    
            _n = (_n * modular_inverse(k, p)) % p        
            if _n == k and _n != g: # if _n == g then gcd was 1
                searching = False
            _n, k = k, _n                 
    #_n = g g g
    return _n
    
def generate_factor(n, _n, g, p, limit):    
    # start reducing n by _n and count the number of times until n == 1
    # the count is one of the factors of x from g ^ x mod p
    # can do with many candidate _n in parallel       
    #n = g g g g g g g g g 
    #_n= g g g    
    _n = modular_inverse(_n, p)
    for factor in range(1, limit):
        n = (n * _n) % p     
        if n == 1:
            break          
  #      print "...", factor
    else:
        raise ValueError("Limit reached before factor obtained")
    return factor
    
def discrete_logarithm(n, g, p, r_size, factor_count=32):
    factors = []
    for count in range(factor_count):        
        while True:
            unknown_factors = gcd_on_exponent(n, g, p, r_size, 2 ** 16)
            try:
                known_factor = generate_factor(n, unknown_factors, g, p, 2 ** 16)
            except ValueError:
                continue
            else:
                break
                
        for factor in factors:
            test_x = (known_factor * factor)
            test_output = pow(g, test_x, p)
            
            if test_output == n:
                return test_x            
               
        factors.append(known_factor)
        print "Current factors: ", factors
    # test products to find x   
    return factors
    
def test_discrete_logarithm():
    g = 3
    x = 60#random_integer(1) or random_integer(1)
    p = 257#big_prime(3)
    n = pow(g, x, p)
    print "Computing factors of: ", x
    print discrete_logarithm(n, g, p, 2)
    
if __name__ == "__main__":
    test_discrete_logarithm()
    