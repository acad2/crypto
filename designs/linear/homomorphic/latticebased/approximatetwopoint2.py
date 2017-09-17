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
POINTS = [random_integer(SECURITY_LEVEL / 2) for count in range(2)]

def generate_private_key(security_level=SECURITY_LEVEL):
    """ usage: generate_private_key(security_level=SECURITY_LEVEL) => private_key
        
        Returns the integer(s) that constitute a private key. """
    s = random_integer(security_level)
    s2 = random_integer(security_level * 2)
    return s, s2
    
def generate_public_key(private_key, points=POINTS, security_level=SECURITY_LEVEL):
    """ usage: generate_public_key(private_key, points=POINTS, 
                                   security_level=SECURITY_LEVEL) => public_key
                                   
        Returns the integer(s) that constitute a public key. """
    s, s2 = private_key
    e = random_integer(security_level + (security_level / 2))
    a, b = points
    return (a * s2) + (b * s) + e
    
def generate_keypair(security_level=SECURITY_LEVEL, points=POINTS):
    """ usage: generate_keypair(security_level=SECURITY_LEVEL, points=POINTS) => public_key, private_key
        
        Returns a public key and a private key for a target security level. """
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, points, security_level)
    return public_key, private_key
    
def key_agreement(public_key, private_key, shift=920):
    """ usage: key_agreement(public_key, private_key, shift=910):
        
        Returns a shared secret in the form of an integer.
        The shift argument must be modified if the security_level has been altered from the default. """
    s, s2 = private_key
    approximate_shared_point = (s2 * public_key)
    output = approximate_shared_point >> shift
    if not output:
        raise ValueError("Shared secret was 0")
    return output
    
def encapsulate_key(public_key1, security_level=SECURITY_LEVEL, points=POINTS):
    public_key2, private_key2 = generate_keypair(security_level, points)
    secret = key_agreement(public_key1, private_key2)
    return public_key2, secret
    
def recover_key(public_key2, private_key):
    return key_agreement(public_key2, private_key)
    
def test_key_exchange():
    from unittesting import test_key_exchange
    test_key_exchange("agreementencapsulationinterface", generate_keypair, encapsulate_key, recover_key, iterations=10000)
        
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("approximatesquared", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    test_key_exchange()
    