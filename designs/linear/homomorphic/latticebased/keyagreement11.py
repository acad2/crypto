#s(a + e)
#x(a + y)
# as + se                       16 32  48    32 48  80
# ax + xy
#se(ax + xy) == axse + xyse  == xs(ae + ye)  
#xy(as + se) == asxy + xyse  == xs(ay + ye)
#                               24 32 32 32    32 32 32 32        128 - 120 = 8
#                               48 64 64 64    64 64 64 64        256 - 240 = 16
#                               96 128 128 128  128 128 128 128   512 - 480 = 32

#                               31 32 32 32    32 32 32 32        128 - 127 = 1
#                               30 32 32 32    32 32 32 32        128 - 126 = 2

#                               18 32 32 32    32 32 32 32        128 - 114 = 14
#                               17 32 32 32    32 32 32 32        128 - 113 = 15

#                               31x ,  32x
#                               62 64 64 64    64 64 64 64        256 - 254 = 2
#                               992 1024 1024 1024  1024 1024 1024 1024    4096 - 4064 = 32
from crypto.utilities import random_integer
SECURITY_LEVEL = 32 + 1   # + 1 to make sure we have enough after we shift some bits away
A = random_integer(SECURITY_LEVEL * 3)

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level * 4)
    e = random_integer(security_level * 4)
    return s, e, (s * e)
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, a=A):
    s, e, se = private_key    
    return s * (a + e)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=(SECURITY_LEVEL * 15 * 8) + SECURITY_LEVEL):
    return (public_key * private_key[2]) >> shift
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("s(a + e) key agreement", generate_keypair, key_agreement, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    