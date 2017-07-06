#a1x + (z - a1z) mod P
#a2(a1x + (z - a1z)) + (z - a2z)
#a1a2x + a2(z - a1z) + (z - a2z)
#a1a2x + (a2z - a1a2z) + (z - a2z)
    
    
#a2x + (z - a2z)
#a1(a2x + (z - a2z)) + (z - a1z)
#a1a2x + a1(z - a2z) + (z - a1z)
#a1a2x + (a1z - a1a2z) + (z - a1z)
 
#(a2z - a1a2z) + (z - a2z) 
#z(a1 - a1a2) + z(1 - a2)
#z(a2 - a1a2) + z(1 - a1)


 
# a - ab mod p
# ai(a - ab)
# 1 - b
# b + -1
# b - -1

from crypto.utilities import random_integer, big_prime, modular_subtraction

A_SIZE = 32
X_SIZE = 32
Z_SIZE = 32
P_SIZE = 33

def generate_parameters(x_size=X_SIZE, p_size=P_SIZE, z_size=Z_SIZE):
    x = random_integer(x_size)
    p = big_prime(p_size) 
    z = random_integer(32)
    return x, p, z
    
PARAMETERS = X, P, Z = generate_parameters()        
        
def point_addition(a, b, x, p=P):  
    return ((a * x) + b) % p
               
def _sum_geometric_series(a, p=P, z=Z):
    return modular_subtraction(z, z * a, p)    
    
def generate_a_b(point_count, p=P, z=Z):        
    a = random_integer(32)
    b = _sum_geometric_series(a, p, z)    
    return a, b
        
def generate_private_key(p, z, a_size=A_SIZE):    
    point_count = random_integer(a_size)
    return generate_a_b(point_count, p, z)
        
def generate_public_key(private_key, parameters):   
    a, b = private_key    
    x, p, z = parameters
    public_key = point_addition(a, b, x, p)
    return public_key
    
def generate_keypair(a_size=A_SIZE, parameters=PARAMETERS):
    x, p, z = parameters
    private_key = generate_private_key(p, z, a_size)
    public_key = generate_public_key(private_key, parameters)
    return public_key, private_key
    
def key_agreement(public_key, private_key, p=P):   
    a, b = private_key   
    return point_addition(a, b, public_key, p)
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement5", generate_keypair, key_agreement, iterations=10000)
            
if __name__ == "__main__":
    test_key_agreement()    
    
    