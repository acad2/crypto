# as + (y << n) == as + y*(2**n)    32 32   32 32    64  64
# e || as
#x(e || as) == xe  asx     32 32     32 32 32   96  
#s(y || ax) == sy  asx

from crypto.utilities import random_integer

SECURITY_LEVEL = 32
SECURITY_LEVEL_BITS = 32 * 8
A = random_integer(SECURITY_LEVEL)
N = 2 ** (SECURITY_LEVEL_BITS)

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level)
    return s
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, a=A, shift=SECURITY_LEVEL_BITS):
    s = private_key
    e = random_integer(security_level)
    return (a * s) + (e << shift)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, shift=SECURITY_LEVEL_BITS):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a, shift)
    return public_key, private_key
    
def key_agreement(public_key, private_key, mask=N - 1):
    return (public_key * private_key) & mask
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("highekeyagreement", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    