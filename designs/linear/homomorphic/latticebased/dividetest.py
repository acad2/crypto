# (sa + se) / k
# (xa + xy) / k

# s(xa + xy) / k
# x(sa + se) / k

# (sxa + sxy) / k    32 32 32    32 32 31   32
# (sxa + sxe) / k    96                        64 + 32 = 96
from math import log

from crypto.utilities import random_integer

SECURITY_LEVEL = 32

def generate_parameters(security_level=SECURITY_LEVEL):    
    k_size = security_level
    a_size = security_level * 2
    shift = ((security_level * 3) * 8) - 220
    return a_size, k_size, shift
    
def _resize(integer, target):
    while int(log(integer, 2)) != target:
        integer >>= 1
    return integer
    
A_SIZE, K_SIZE, SHIFT = generate_parameters(SECURITY_LEVEL)
    
A = random_integer(A_SIZE)
K = _resize(random_integer(K_SIZE + 1), K_SIZE * 8)

def generate_private_key(security_level=SECURITY_LEVEL):
    target = security_level * 8
    s = _resize(random_integer(security_level + 8), target)    
    e = _resize(random_integer(security_level + 8), target)    
    return s, e
    
def generate_public_key(private_key, a=A, k=K):
    s, e = private_key
    return (s * (a + e)) / k
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, k=K):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, a, k)
    return public_key, private_key
    
def key_agreement(public_key1, private_key2, k=K, shift=SHIFT):
    s, e = private_key2    
    return (public_key1 * s) >> shift
    
def unit_test():
    from unittesting import test_key_agreement    
    test_key_agreement("s(a + e) / k", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    