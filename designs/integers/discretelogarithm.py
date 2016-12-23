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

generator = prime_generator()
PRIMES = [next(generator) for count in range(1024)]
del generator    

#def discrete_logarithm(n, g, p, exponent=1):
#    inverse_g = modular_inverse(g ** exponent, p)
#    if inverse_g == 1:
#        raise ValueError("Invalid g")
#    _n = n
#    logarithm = 0
#    while n != 1 and logarithm < p:        
#        n *= inverse_g
#        n %= p
#        logarithm += 1    
#    if (logarithm % p) == p or logarithm == p:  
#        
#        return -1
#    else:             
#        print _n, n, p, n %p, logarithm, inverse_g, exponent
#        return (logarithm * exponent) % p
    
def discrete_logarithm(n, g, p, exponent=1):    
    inverse_g = modular_inverse(g ** exponent, p)
    logarithm = 0        
    while n % p != 1 and logarithm < p:        
        n *= inverse_g        
        logarithm += exponent 
    if logarithm == p:
        return -1
    else:        
        return logarithm        
        
def discrete_logarithm2(n, g, p):    
    output = -1
    exponents = iter(PRIMES)
    exponent = next(exponents)    
    while True: # exponent needs to be a factor of output     
        try:
            output = discrete_logarithm(n, g, p, exponent)
        except ValueError:
            pass                
        if output != -1 and not output % exponent and output != exponent:  
            break            
        exponent = next(exponents)
        assert exponent < p
    return output
    
def test_discrete_logarithm():        
    for a in range(1, 256):              
        A = pow(G, a, P)  
        dl = discrete_logarithm(A, G, P)        
        assert dl == a, (dl, a, A)            
    assert discrete_logarithm2(A, G, P) == a, (discrete_logarithm2(A, G, P), a)    
    
    
    
if __name__ == "__main__":
    test_discrete_logarithm()
    