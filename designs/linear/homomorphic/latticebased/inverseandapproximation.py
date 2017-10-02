# ab + c, ad + e, af + g
#sab + sc + rad + re + taf + tg + z
#sb + rd + tf + ai(sc + re + tg + z)    64
#                  sc + re + tg + z         64    96      161
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PUBLIC_KEY_SIZE = SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        ai = random_integer((security_level * 2) + 3)
        modulus = random_integer((security_level * 5) + 5)
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
    r = random_integer
    return [((a * r(security_level)) + r(security_level)) % modulus for count in range(public_key_size)]
    
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, shift=(SECURITY_LEVEL * 2 * 8) + 32):
    e = random_integer(security_level * 3)
    ciphertext = e + sum(number * random_integer(security_level) for number in public_key)
    return ciphertext, e >> shift
    
def recover_key(ciphertext, private_key, shift=(SECURITY_LEVEL * 2 * 8) + 32):
    ai, modulus = private_key
    t = ((ciphertext * ai) % modulus) / ai
    return t >> shift
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("inverseandapproximation", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    