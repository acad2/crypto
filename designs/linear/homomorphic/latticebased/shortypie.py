# a, ab
#xa + yab    32 64   32 64
# x + yb     32   64  
#            96   64

#            32 96   32 96

from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_private_key(security_level=SECURITY_LEVEL):
    modulus_size = (security_level * 3) + 3
    while True:
        ai = random_integer(modulus_size - 3)
        modulus = random_integer(modulus_size)
        try:
            modular_inverse(ai, modulus)
        except ValueError():
            continue
        else:
            break
    return ai, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL):
    ai, modulus = private_key
    a = modular_inverse(ai, modulus)
    b = random_integer(security_level)
    return a, (a * b) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL):
    