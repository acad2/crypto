# ax ay
#sax + tay  32 96     32 96
#sx + ty
#s + xity   

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
    x = random_integer(security_level)
    y = (2 ** (security_level * 8))
    return (a * x), (a * y) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    ax, ay = public_key
    