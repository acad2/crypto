# ax mod pq
# ay mod pr
# public parameters:
#   a, p such that a > p and the multiplicative inverse of (a mod p) modulo p does not exist
# private key:
#   random integer x
# public key:
#   ax mod pq for some random q such that ax > pq (so that ax reduces mod pq)
# key agreement:
#   x * (ay mod pr) mod p

from crypto.utilities import big_prime, random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_parameters(security_level=SECURITY_LEVEL):
    A = random_integer(security_level + 2)
    P = random_integer(security_level)
    while True:
        try:
            bad_parameters = modular_inverse(A % P, P)
            bad_parameters = modular_inverse(A - P, P)
        except ValueError:
            break # good parameters found
        else: 
            A = random_integer(security_level + 2)
            P = random_integer(security_level)
    return A, P
    
A, P = generate_parameters(SECURITY_LEVEL)
    
def generate_private_key(security_level=SECURITY_LEVEL):
    x = random_integer(security_level + 2)
    return x
    
def generate_public_key(x, security_level=SECURITY_LEVEL, a=A, p=P):
    q = random_integer(security_level)
    assert (a * x) > (p * q)
    return (a * x) % (p * q)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, p=P):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a, p)
    return public_key, private_key
    
def key_agreement(public_key, private_key, p=P, mask=int('1' * 256, 2)):
    return ((public_key * private_key) % p) & mask
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("secretmoduluskeyagreement", generate_keypair, key_agreement, iterations=10000)
    
# as mod p == (a - p) * s == sa - sp

    
if __name__ == "__main__":
    test_key_agreement()
    