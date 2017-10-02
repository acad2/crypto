from crypto.utilities import random_integer, modular_subtraction

SECURITY_LEVEL = 32
MODULUS = random_integer((SECURITY_LEVEL * 2) + 1)
A = random_integer(SECURITY_LEVEL)
MASK = ((2 ** (SECURITY_LEVEL * 8)) - 1)
SHIFT = SECURITY_LEVEL * 8

def generate_private_key(security_level=SECURITY_LEVEL, a=A, modulus=MODULUS):
    e = random_integer(security_level - 1)
    public_key = random_integer(security_level)    
    while e < public_key:
        e = random_integer(security_level)
        public_key = random_integer(security_level)    
    _as = modular_subtraction(public_key, e, modulus)
    s = _as / a
    e += _as % a
    assert ((a * s) + e) % modulus == public_key
    return s, e
    
def generate_public_key(private_key, a=A, modulus=MODULUS):
    s, e = private_key
    from math import log
    print log(a, 2), log(s, 2), log(a, 2) + log(s, 2), log(e, 2), log(modulus, 2)
    return ((a * s) + e) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, modulus=MODULUS):
    private_key = generate_private_key(security_level, a, modulus)
    public_key = generate_public_key(private_key, a, modulus)
    return public_key, private_key
    
def key_agreement(public_key1, private_key2, modulus=MODULUS, mask=MASK, shift=SHIFT):
    assert (public_key1 * private_key2[0]) < modulus
    return ((public_key1 * private_key2[0]) % modulus) >> (shift + 250)
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("decomposetest2", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    