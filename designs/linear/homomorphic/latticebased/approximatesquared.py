# public parameters:
#   integers a, b
# private key:
#   integer x
# public key:
#   axx + bx + y
# (approximate) key agreement:
#   ss(axx + bx + y) = axxss + bxss + yss
#   xx(ass + bs + e) = axxss + bxxs + exx
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
POINTS = [random_integer(SECURITY_LEVEL) for count in range(2)]

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level)
    return s
    
def generate_public_key(private_key, points=POINTS, security_level=SECURITY_LEVEL):
    s = private_key
    e = random_integer(security_level * 2)
    a, b = points
    return ((a * (s ** 2)) + (b * s) + e)
    
def generate_keypair(security_level=SECURITY_LEVEL, points=POINTS):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, points, security_level)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=1043):
    s = private_key
    approximate_shared_point = ((s ** 2) * public_key)
    output = approximate_shared_point >> shift
    if not output:
        raise ValueError("Shared secret was 0")
    return output
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("approximatesquared", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    