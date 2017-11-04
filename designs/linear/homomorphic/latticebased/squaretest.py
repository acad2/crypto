#r(x(a + bx) + z) == rx(a + bx) + rz == rxa + rxxb + rz
#x(r(a + br) + q) == rx(a + br) + xq == rxa + rrxb + xq
#                                    32 32 96   
#                                           32 32 32 32 
#                                                   32 32       96
from crypto.utilities import random_integer

SECURITY_LEVEL = 32

def generate_public_parameters(security_level=SECURITY_LEVEL):
    a = random_integer(security_level * 3)
    b = random_integer(security_level) 
    q = random_integer((security_level * 3) + 4)
    assert a < q
    shift = ((security_level * 3)) * 8
    return a, b, q, shift
    
A, B, Q, SHIFT = generate_public_parameters(SECURITY_LEVEL)
    
def generate_private_key(security_level=SECURITY_LEVEL):
    x = random_integer(security_level)
    return x
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, a=A, b=B, q=Q):
    x = private_key
    assert a * x > q
    return ((a * x) + (b * x * x) + random_integer(security_level * 2)) % q
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, b=B, q=Q):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a, b, q)
    return public_key, private_key
    
def key_agreement(public_key2, private_key1, q=Q, shift=SHIFT):    
    return ((public_key2 * private_key1) ) >> shift
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("squaretest", generate_keypair, key_agreement, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    