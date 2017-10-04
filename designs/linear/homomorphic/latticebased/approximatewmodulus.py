# as + se  31 32    32 32       64
# ax + xy 
#xy(as + se) == xyas + xyse     32 32 31 32   32 32 32 32      128
#se(ax + xy) == xeas + xyse
from math import log

from crypto.utilities import random_integer

SECURITY_LEVEL = 32

def generate_parameters(security_level=SECURITY_LEVEL):
    final_size = security_level * 4
    modulus_size = (security_level * 2) - (security_level / 4)
    a_size = security_level / 2
    shift = (modulus_size - 1) * 8
    return a_size, modulus_size, shift
    
def _resize(integer, target):
    while int(log(integer, 2)) != target:
        integer >>= 1
    return integer
    
A_SIZE, MODULUS_SIZE, SHIFT = generate_parameters(SECURITY_LEVEL)
    
A = random_integer(A_SIZE)
MODULUS = _resize(random_integer(MODULUS_SIZE + 1), MODULUS_SIZE * 8)

def generate_private_key(security_level=SECURITY_LEVEL, modulus=MODULUS):
    target = security_level * 8
    s = _resize(random_integer(security_level + 1), target)    
    e = _resize(random_integer(security_level + 1), target)    
    return s, e, (s * e) % modulus
    
def generate_public_key(private_key, a=A, modulus=MODULUS):
    s, e, se = private_key
    return (s * (a + e)) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, modulus=MODULUS):
    private_key = generate_private_key(security_level, modulus)
    public_key = generate_public_key(private_key, a, modulus)
    return public_key, private_key
    
def key_agreement(public_key1, private_key2, modulus=MODULUS, shift=SHIFT):
    s, e, se = private_key2    
    return ((public_key1 * se) % modulus) >> shift
    
def unit_test():
    from unittesting import test_key_agreement    
    for modulus_size in range(128):
        modulus = random_integer(modulus_size + 1)
        modulus = _resize(modulus, modulus_size * 8)
        globals()["MODULUS_SIZE"] = modulus#_resize(random_integer(modulus_size), modulus_size * 8)
        try:
            test_key_agreement("approximatewmodulus", generate_keypair, key_agreement, iterations=10000)
        except AssertionError:
            continue
        else:
            print "Success!"
            raw_input()
    
if __name__ == "__main__":
    unit_test()
    