# public parameter:
#   a
#   modulus = 2 ** 256
# private key:
#   s
# public key:
#   (a * s) % modulus   # truncates and returns least significant bits
# key agreement:
#   x(a * s) % modulus == s(a * x) % modulus
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
A = random_integer(SECURITY_LEVEL)
while not A % 2:
    A >>= 1
MODULUS = 2 ** (SECURITY_LEVEL * 8)
MASK = MODULUS - 1

def generate_private_key(security_level=SECURITY_LEVEL):
    return random_integer(security_level)
    
def generate_public_key(private_key, a=A, modulus=MODULUS):
    return ((a * private_key) + (random_integer(SECURITY_LEVEL))) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, modulus=MODULUS):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, a, modulus)
    return public_key, private_key
    
def key_agreement(public_key1, private_key2, modulus=MODULUS):
    return (public_key1 * private_key2) % modulus
    
def unit_test():
    from crypto.utilities import modular_inverse
    public_key1, private1 = generate_keypair()
    public_key2, private2 = generate_keypair()
    share = key_agreement(public_key1, private2)
    print "Broken: ", (public_key1 * public_key2 * modular_inverse(A, MODULUS)) % MODULUS == share
    from unittesting import test_key_agreement
    test_key_agreement("truncationtest", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    