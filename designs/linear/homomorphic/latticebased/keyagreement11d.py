# choose a point slightly larger then the modulus such n - (k % n) > s (to ensure the second, private key operation multiplication does not reduce)
# find some s, e such that as + e > n and n - (as + e mod n) > s for a given `a`, `n`

# s(a + e) + r
# - r
# / s          
# - a

# point = modulus + 256 bits
# point -= r
# point /= a
# point == s


from crypto.utilities import random_integer, modular_subtraction

SECURITY_LEVEL = 32
A = random_integer(32)
MODULUS = random_integer(64)
S_SIZE = 32
SHIFT = 256
from math import log

def generate_private_key(security_level=SECURITY_LEVEL, s_size=S_SIZE, a=A, modulus=MODULUS):    
    r = random_integer(64)
    target = random_integer(31)
    t = modular_subtraction(target, r, modulus)
    assert (t + r) % modulus == target
    s = random_integer(s_size) >> 4   
    r += t % s    
    ae = t / s
    e = modular_subtraction(ae, a, modulus)
    print log(a, 2), log(s, 2), log(e, 2), log(r, 2)
    assert e > 0
    assert ((s * (a + e)) + r) % modulus == target, (((s * (a + e)) + r) % modulus, target)
    #if e < 0 or modulus - (s * (a + e)
    return s, e, r
    
def generate_public_key(private_key, a=A, modulus=MODULUS):
    s, e, r = private_key        
    return ((s * (a + e)) + r) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, s_size=S_SIZE):
    private_key = generate_private_key(security_level, s_size)
    public_key = generate_public_key(private_key, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=SHIFT, modulus=MODULUS): 
    assert ((public_key * private_key[0]) % modulus) >> shift > 0
    return ((public_key * private_key[0]) % modulus) >> shift
    
def unit_test():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    share = key_agreement(public1, private2)
    test = (public1 * public2)
    def f(integer):
        return int(''.join(char for char in reversed(format(integer, 'b'))), 2) & ((1 << 256) - 1)
    assert f(share) != f(test), "Broken"        
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement c", generate_keypair, key_agreement, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    