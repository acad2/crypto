# as1 + bs2 + e2     32 32    32 32    32
# s1 + aibs2 + aie2
#bis1 + ais2 + aibie2   32+1   32+1   32 + 1
from crypto.utilities import random_integer, modular_inverse, big_prime

SECURITY_LEVEL = 32

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        modulus = random_integer(security_level + 1)
        try:
            a = modular_inverse(2, modulus)
            b = modular_inverse(3, modulus)
        except ValueError:
            continue
        else:
            break
    return modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL):
    a = modular_inverse((2, private_key * big_prime(security_level))
    b = modular_inverse((3, private_key * big_prime(security_level))
    return a, b
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    a, b = public_key
    s1 = random_integer(security_level)
    s2 = random_integer(security_level)
    e = random_integer(security_level)
    shared_secret = (3 * s1) + (2 * s2) + (6 * e)
    ciphertext = ((a * s1) + (b * s2) + e)
    return ciphertext, shared_secret
    
def recover_key(ciphertext, private_key):
    return (ciphertext * 6) % private_key
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("knowninverses", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    