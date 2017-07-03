# perform random walk with public affine function
# the secret parameter is the number of times the function is applied successively
# x1 = a x0 + b mod P
# x2 = a x1 + b mod P
# x3 = a x2 + b mod P
# ...

# there is a succinct if opaque way to compute the Nth iteration,
# xn = pow(a, n, P) * x0 + sum_geometric_series(n, a, p) mod P

# the scaling and translation from the multiplication and addition modulo a prime forms a type of "random walk"
# the private key is the random walk
# the public key is the point reached after applying the walk from a mutual starting point
# a shared secret is reached by applying the random walk from the starting point indicated by the other parties public key
# both parties end up at the same place (the same number), but neither learns exactly how the other arrived.

# similar to (EC)DH with different math/structure

# public key operation:
#   a x + b mod P # 1-d LWE

# key generation is more expensive then the key agreement operation, due to the modular exponentiation
from crypto.utilities import random_integer, big_prime, modular_inverse, modular_subtraction

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
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement4", generate_keypair, key_agreement, iterations=10000)
    
#a1x + b1
#a2(a1x + b1) + b2
#a2a1x + b1a2 + b2

#a2x + b2
#a1(a2x + b2) + b1
#a1a2x + a1b2 + b1

#a1x + b1 + a2x + b2
#x(a1 + a2) + b1 + b2
    
if __name__ == "__main__":
    test_key_agreement()    
    