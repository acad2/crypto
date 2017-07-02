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
    return a, b, x, p
    
PARAMETERS = A, B, X, P = generate_parameters()
    
def point_addition(x, a, b, p=P):  
    return ((a * x) + b) % p
           
def _sum_geometric_series(b, a, point_count, p=P):
    t = modular_subtraction(b, (b * pow(a, point_count, p)), p)
    return (t * modular_inverse(modular_subtraction(1, a, p), p)) % p  
    
def generate_private_key(a, b, p, private_key_size=PRIVATE_KEY_SIZE):    
    point_count = random_integer(private_key_size)
    _a = pow(a, point_count, p)   
    _b = _sum_geometric_series(b, a, point_count)    
    return _a, _b
        
def generate_public_key(private_key, parameters):   
    _a, _b = private_key    
    a, b, x, p = parameters
    public_key = point_addition(x, _a, _b, p)
    return public_key
    
def generate_keypair(private_key_size=PRIVATE_KEY_SIZE, parameters=PARAMETERS):
    a, b, x, p = parameters
    private_key = generate_private_key(a, b, p, private_key_size)
    public_key = generate_public_key(private_key, parameters)
    return public_key, private_key
    
def key_agreement(public_key, private_key, p=P):   
    _a, _b = private_key
    return point_addition(public_key, _a, _b, p)
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement4", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    