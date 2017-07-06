# perform random walk with public affine function
# the secret parameter is the number of times the function is applied successively
# x1 = a x0 + b mod P
# x2 = a x1 + b mod P
# x3 = a x2 + b mod P
# ...

# there is a succinct if opaque way to compute the Nth iteration,
# xn = pow(a, n, P) * x0 + sum_geometric_series(n, a, p) mod P

# intuitive explanation:
# the scaling and translation from the multiplication and addition modulo a prime forms a type of "random walk"
# the private key is the random walk
# the public key is the point reached after applying the walk from a mutual starting point
# a shared secret is reached by applying the random walk from the starting point indicated by the other parties public key
# both parties end up at the same place (the same number), but neither learns exactly how the other arrived.

# similar to (EC)DH with different math/structure

# public key operation:
#   a x + b mod P # 1-d LWE

# key generation is more expensive then the key agreement operation, due to the modular exponentiation

# does not function with arbitrary/random a, b values
# it happens to work out that

#a1x + b1
#a2(a1x + b1) + b2
#a2a1x + b1a2 + b2
# ==
#a2x + b2
#a1(a2x + b2) + b1
#a1a2x + a1b2 + b1
from os import urandom as random_bytes
from timeit import default_timer # for unit test
from math import log # for unit test

__all__ = ["generate_keypair", "key_agreement"]

# utilities
def bytes_to_integer(data):
    output = 0        
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(random_bytes(size_in_bytes)))
       
def big_prime(size_in_bytes):           
    while True:
        candidate = random_integer(size_in_bytes)
        if candidate > 1 and is_prime(candidate):
            return candidate

def is_prime(n, _mrpt_num_trials=10): # from https://rosettacode.org/wiki/Miller%E2%80%93Rabin_primality_test#Python
    assert n >= 2
    # special case 2
    if n == 2:
        return True
    # ensure n is odd
    if n % 2 == 0:
        return False
    # write n-1 as 2**s * d
    # repeatedly try to divide n-1 by 2
    s = 0
    d = n-1
    while True:
        quotient, remainder = divmod(d, 2)
        if remainder == 1:
            break
        s += 1
        d = quotient
    assert(2**s * d == n-1)
 
    # test the base a to see whether it is a witness for the compositeness of n
    def try_composite(a):
        if pow(a, d, n) == 1:
            return False
        for i in range(s):
            if pow(a, 2**i * d, n) == n-1:
                return False
        return True # n is definitely composite
    
    import random
    random.seed(random_bytes(32))
    for i in range(_mrpt_num_trials):
        a = random.randrange(2, n)
        if try_composite(a):
            return False
 
    return True # no base tested showed n as composite

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modular_inverse(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise ValueError('modular inverse does not exist')
    else:
        return x % m

def modular_subtraction(x, y, modulus):
    return (modulus + (x - y)) % modulus        
    
# end utilities

# parameter generation
A_SIZE = 32
B_SIZE = 32
X_SIZE = 32
P_SIZE = 33
PRIVATE_KEY_SIZE = 32

def generate_parameters(a_size=A_SIZE, b_size=B_SIZE,
                        x_size=X_SIZE, p_size=P_SIZE):
    a = random_integer(a_size)
    b = random_integer(b_size)
    x = random_integer(x_size)
    p = big_prime(p_size) 
    z = modular_inverse(modular_subtraction(1, a, p), p)
    return a, b, x, p, z
    
PARAMETERS = A, B, X, P, Z = generate_parameters()        
    
# end parameter generation

# algorithm     
def point_addition(x, a, b, p=P):  
    return ((a * x) + b) % p
           
def _sum_geometric_series(a, p=P, z=Z):
    t = modular_subtraction(1, a, p)
    return (t * z) % p  
    
def generate_private_key(a, p, z, private_key_size=PRIVATE_KEY_SIZE):    
    point_count = random_integer(private_key_size)
    _a = pow(a, point_count, p)   
    _b = _sum_geometric_series(_a, p, z)    
    return _a, _b
        
def generate_public_key(private_key, parameters):   
    _a, _b = private_key    
    a, b, x, p, z = parameters
    public_key = point_addition(x, _a, _b, p)
    return public_key
    
def generate_keypair(private_key_size=PRIVATE_KEY_SIZE, parameters=PARAMETERS):
    a, b, x, p, z = parameters
    private_key = generate_private_key(a, p, z, private_key_size)
    public_key = generate_public_key(private_key, parameters)
    return public_key, private_key
    
def key_agreement(public_key, private_key, p=P):   
    _a, _b = private_key
    return point_addition(public_key, _a, _b, p)
    
# end algorithm

# testing    
def size_in_bits(integer):
    return int(log(integer or 1, 2)) + 1
    
def determine_key_size(key):    
    sizes = []
    try:
        sizes.append(size_in_bits(key))
    except TypeError:        
        for item in key:
            try:
                for _item in item:
                    sizes.append(size_in_bits(_item))
            except TypeError:
                sizes.append(size_in_bits(item))    
    return sizes

def test_key_agreement_time(iterations, key_agreement, public_key, private_key, key_size=32):        
    if iterations == 0:
        return None    
    print("Agreeing upon {} {}-byte keys...".format(iterations, key_size))            
    before = default_timer()
    for count in range(iterations):                     
        key = key_agreement(public_key, private_key)
    after = default_timer()
    print("Time required: {}".format(after - before))   
            
def test_key_agreement(algorithm_name, generate_keypair, key_agreement, 
                       iterations=1024, key_size=32):
    print("Beginning {} unit test...".format(algorithm_name))
    print("Generating {} keypairs...".format(iterations))    
    before = default_timer()
    for count in range(iterations):
        public_key, private_key = generate_keypair()        
    after = default_timer()
    print("...done")
    print("Time required: {}".format(after - before))
               
    print("Validating correctness...")    
    for count in range(iterations):
        public_key, private_key = generate_keypair()
        public_key2, private_key2 = generate_keypair()
        key = key_agreement(public_key2, private_key)
        _key = key_agreement(public_key, private_key2)
        assert key == _key, (key, _key)
    print("...done")
    
    test_key_agreement_time(iterations, key_agreement, public_key2, private_key, key_size=key_size)
    
    public_sizes = determine_key_size(public_key)
    private_sizes = determine_key_size(private_key)
    print("Public key size : {}".format(sum(public_sizes)))
    print("Private key size: {}".format(sum(private_sizes)))
    print("Key size : {}".format(size_in_bits(key)))
    print("(sizes are in bits)")
    print("{} unit test passed".format(algorithm_name))
    
def unit_test():    
    test_key_agreement("keyagreement4", generate_keypair, key_agreement, iterations=10000)
        
if __name__ == "__main__":
    unit_test()    
    