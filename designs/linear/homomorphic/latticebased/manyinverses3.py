# a + a, a + a, a + a... (modular_inverse(ai, q * random_integer()))
#ax + ax + ay + ay + az + az
#ai(ax + ay + az)
#2(x + y + z)
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PUBLIC_KEY_SIZE = 5#SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        ai = random_integer(security_level)
        modulus = random_integer(security_level + 3)    
        try:
            modular_inverse(ai, modulus)
        except ValueError:
            continue
        else:
            break
    return ai, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    ai, modulus = private_key
    a = modular_inverse(ai, modulus)
    public_key = []
    while len(public_key) < public_key_size:        
        try:
            public_key.append(a + modular_inverse(ai, modulus * random_integer(security_level)))
        except ValueError:
            continue
    return public_key
        
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    ciphertext = 0
    secret = 0
    for entry in public_key:
        r = random_integer(security_level)
        ciphertext += entry * r
        secret += r        
    return ciphertext, secret * 2
    
def recover_key(ciphertext, private_key):
    ai, modulus = private_key
    # ax + ay + az
    # x + y + z
    return (ciphertext * ai) % modulus
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("manyinverses_keyexchange", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    