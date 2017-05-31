# private key:
#   small primes such that the product of all of them is smaller then the modulus N
# public key:
#   homomorphic encryptions of the private key primes; ciphertexts support multiplication

# sign:
#   decrypt value with private key cipher and check for factors according to the private key
#   release the corresponding indices according to the primes in the factorization
#   for example:
#       private_key = [2, 3, 5, 7, 11]
#       number = 70
#       factors     = [2,   5,  7,   ] # 2 * 5 * 7 = 10 * 7 = 70
#       signature   = [1, 0, 1, 1, 0 ]
#
# verify:
#   multiply the elements indicated by the signature modulo N
#   check that the product equals? is close? to number
#       signature  = [1, 0, 1, 1, 0]
#       public_key = [a, b, c, d, e]
#       verifier =    a   * c * d  mod N
#       check verifier?
from crypto.utilities import prime_generator, random_integer, modular_inverse

generator = prime_generator()
primes = [next(generator) for count in range(44)]
N = 1
for prime in primes:
    N *= prime
    
def generate_private_key(n=N):    
    while True:
        e = random_integer(32)
        try:
            d = modular_inverse(e, n)
        except ValueError:
            continue
        else:
            break
    assert e < n
    return e, d
    
def generate_public_key(private_key, n=N):   
    e, d = private_key
    return [pow(prime, e, n) for prime in primes]
    
def sign(message, private_key, n=N):
    e, d = private_key
    number = pow(message, d, n)    
    
    signature = [0] * 44
    for index, prime in enumerate(primes):        
        exponent = 0
        while number % prime == 0:
            print number, prime, exponent
            exponent += 1
            number /= prime
        
        signature[index] = exponent
    return signature
    
def verify(signature, message, public_key, n=N):
    verifier = 1
    for index, exponent in enumerate(signature):
        if exponent:
            verifier *= primes[index] ** exponent
    return verifier

    