#s(a + e)
#x(a + y)
# as + se                       16 32  48    32 48  80
# ax + xy
#se(ax + xy) == axse + xyse
#xy(as + se) == asxy + xyse     
#                               16 32 32 32    32 32 32 32        128 - 112 = 16
#                               16 32 32 40    32 40 32 40        144 - 120 = 24
#                               16 32 32 48    32 48 32 48        160 - 128 = 32
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
A = random_integer(SECURITY_LEVEL)

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level * 2)
    e = random_integer(security_level)
    return s, e, (s * e)
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, a=A):
    s, e, se = private_key    
    return s * (a + e)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=SECURITY_LEVEL * 7 * 8):
    return (public_key * private_key[2]) >> (shift + 16)
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    