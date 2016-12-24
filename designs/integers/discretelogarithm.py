import itertools

from crypto.utilities import modular_inverse

G = 3
P = 257

def prime_generator():
    """ Generates prime numbers in successive order. """
    primes = [2]    
    #yield 2
    for test_number in itertools.count(3, 2):
        for prime in primes:
            if not test_number % prime:
                break
        else:
            yield test_number
            primes.append(test_number)
            
#generator = prime_generator()
#PRIMES = [next(generator) for count in range(1024)]
#del generator    
#PRIMES = [2 * 3, 2 * 3 * 5, 2 * 3 * 5 * 7, 2 * 3 * 5 * 7 * 11,
#          2 * 5, 2 * 5 * 7, 2 * 5 * 7 * 11,
#          2 * 7, 2 * 7 * 11,
#          2 * 11,
#          3 * 5, 3 * 5 * 7, 3 * 5 * 7 * 11,
#          3 * 7, 3 * 7 * 11,
#          3 * 11,
#          5 * 7, 5 * 7 * 11,
#          5 * 11,
#          7 * 11] + PRIMES
#PRIMES = [2 * 3 * 5]
NUMBERS = reversed(range(256))

def discrete_logarithm(n, g, p, exponent=1):    
    inverse_g = modular_inverse(g ** exponent, p)
    if inverse_g == 1:
        raise ValueError("Invalid inverse g (inverse_g == 1 not allowed)")
    logarithm = 0        
    while n % p != 1 and logarithm < p:        
        n *= inverse_g        
        logarithm += exponent 
    if logarithm == p:
        return -1
    else:        
        return logarithm        
        
def discrete_logarithm2(n, g, p, factors=NUMBERS):    
    output = -1
    exponents = iter(factors)
    exponent = next(exponents)    
    while True:       
        print g, exponent
        try:
            output = discrete_logarithm(n, g, p, exponent) % p
        except ValueError:
            pass
        # exponent needs to be a factor of output
        if output != -1 and not output % exponent:  
            break              
        try:
            exponent = next(exponents)
        except StopIteration:
            output = -1
            break
            
        if exponent > p:
            while exponent > p:
                exponent = next(exponents)   
    raw_input("Found answer: {}".format(output))
    return output
    
def test_discrete_logarithm():        
    for a in range(256):              
        A = pow(G, a, P)  
        dl = discrete_logarithm(A, G, P)        
        assert dl == a, (dl, a, A)            
    assert discrete_logarithm2(A, G, P) == a, (discrete_logarithm2(A, G, P), a)    
            
if __name__ == "__main__":
    test_discrete_logarithm()
    