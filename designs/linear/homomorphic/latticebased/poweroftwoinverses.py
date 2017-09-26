# (s << 256) + e  32 32   64
# s + (e >> 256)  32 32
from crypto.utilities import random_integer, big_prime, modular_inverse

SECURITY_LEVEL = 32
MASK = (2 ** (SECURITY_LEVEL * 8)) - 1

def generate_private_key(security_level=SECURITY_LEVEL):
    modulus = big_prime(33)
    a = 2 ** 256
    ai = modular_inverse(a, modulus)
    return ai, modulus
    
def generate_public_key(private_key):
    ai, modulus = private_key
    a = modular_inverse(ai, modulus)
    return a
    
def generate_keypair(security_level=SECURITY_LEVEL): 
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, mask=MASK):
    a = public_key
    s = random_integer(security_level)
    e = random_integer(security_level * 2)    
    return (s << 256) + e, (s + e) & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    ai, modulus = private_key    
    return ((ciphertext * ai) % modulus) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("poweroftwoinverses", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    