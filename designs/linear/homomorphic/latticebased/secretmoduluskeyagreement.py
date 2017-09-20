# ax mod pq
# ay mod pr
# public parameters:
#   integers a, n such that a > n and the multiplicative inverse of (a mod n) modulo n does not exist
# private key:
#   random integer x
# public key:
#   ax mod pq for some random q such that ax > pq (so that ax reduces mod pq)
# key agreement:
#   x * (ay mod pr) mod n
from crypto.utilities import big_prime, random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_public_parameters(security_level=SECURITY_LEVEL):
    A = random_integer(security_level + 2)
    N = random_integer(security_level)
    while True:
        try:
            bad_parameters = modular_inverse(A % N, N)
            bad_parameters = modular_inverse(A - N, N)
        except ValueError:
            break # good parameters found
        else: 
            A = random_integer(security_level + 2)
            N = random_integer(security_level)
    return A, N
    
A, N = generate_public_parameters(SECURITY_LEVEL)
    
def generate_private_key(security_level=SECURITY_LEVEL):
    x = random_integer(security_level + 2)
    return x
    
def generate_public_key(x, security_level=SECURITY_LEVEL, a=A, n=N):
    #return (a * x) % n
    q = random_integer(security_level)
    assert (a * x) > (n * q)
    return (a * x) % (n * q)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, n=N):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a, n)
    return public_key, private_key
    
def key_agreement(public_key, private_key, n=N):
    return (public_key * private_key) % n
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("secretmoduluskeyagreement", generate_keypair, key_agreement, iterations=10000)
    
# as mod n == s(a - n) == sa - sn
# as mod nq == s(a - nq) == sa - snq

# as + k mod nq
# as + k - as mod n == k mod n
    
if __name__ == "__main__":
    test_key_agreement()
    