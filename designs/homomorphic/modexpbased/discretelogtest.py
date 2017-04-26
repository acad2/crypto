# m ^ e mod n == m * m * m * ... * m mod n
# c := m * m * m * m * ... * m mod n
# i := modular_inverse(m, n)
# exponent := 0
# while c != 1:
#   c *= i
#   exponent += 1
# return exponent

# i * i * i * i == k * k
# k * k == l

# runtime is linear in the size of the exponent?
# i.e. an exponent of 65537 requires worst case scenario 65537 operations
# an exponent of 65536 could be finished in 32768 operations, because 2 is a factor
#   - or it could be finished in 16384 operations, because 4 is a factor
#   - or it could be finished in 8092 operations, because 8 is a factor
#   - or it could be finished in 4192 operations, because 16 is a factor
#   - or it could be finished in 2048 operations, because 32 is a factor
#   - or it could be finished in 1024 operations, because 64 is a factor
#   ...
#   - or it could be finished in 1 operation, because 65536 is a factor

# The final single operation case is not realistic - it implies starting at the answer
# however, the smaller cases are certainly realistic: half of all numbers have 2 as a factor
#   - meaning half of all possible exponents have 2 as a factor
#       - meaning half of all possible exponents can be recovered in O(N/2)
#          - half of all possible exponents can be recovered in O(N/2) with probability 1/2
#   - one-third of all exponents have 3 as a factor; one-third of exponents can be recovered in O(N/3) with probability 1/3
#   - one-sixth of all exponents have 6 as a factor; one-sixth of exponents can be recovered in O(N/6) with probability 1/6
#   - 1/k exponents can be recovered in time O(N/k) with probability 1/k

# worst case scenario: exponent is a large prime

# searching for different factors can be done in parallel
# for each reasonably probable factor:
#   start a new thread/process/remote job to attempt to compute the discrete logarithm using the supplied factors
# accept the smallest produced result      
from crypto.utilities import modular_inverse

# g * g * g * g * g * g * g
#(g * g * g) * (g * g * g)

# g * g * g
# g * g

# g * g * g * g * g * g
# g * g

def calculate_factors(n, g, modulus, test_factors=(2, 3, 5, 7, 11, 13, 17, 19)):
    factors = []
    for factor in test_factors:
        print n, factor, g ** factor, (n / (g ** factor))
        if (n / (g ** factor)) == 1:
            return factor
        elif (n / (g ** factor)) % (g ** factor) == g ** factor:
            # factor is a factor of the exponent
            factors.append(factor)
            break
    if not factors:
        factors.append(1)
    print "Exponent factors: ", factors
    _exponent = 1
    for item in factors:
        _exponent *= item
    return _exponent
    
def discrete_logarithm(number, generator, modulus):   
    factor = calculate_factors(number, generator, modulus)
    test_count = 65537#modulus / factor
    inverse = modular_inverse(generator ** factor, modulus)
    exponent = 0  
    print "dl: ", number, factor, inverse
    for _count in range(test_count):
        number *= inverse
        number %= modulus
        exponent += (1 * factor)        
        if number == 1:
            return exponent
    else:
        raise ValueError("factor {} not part of exponent, or test_count {} too low".format(factor, test_count))                 
    
def test_discrete_logarithm():
    g = 3
    p = 65537
    for exponent in range(3, 65537, 3):        
        output = pow(g, exponent, p)           
        print "Exponent: ", exponent
        _exponent = discrete_logarithm(output, g, p)
        assert _exponent == exponent, (_exponent, exponent)        
        
        
if __name__ == "__main__":
    test_discrete_logarithm()
    