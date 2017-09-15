#a, b, c, d
#s1a + s2b + s3c + s4d
#s1 + ai(s2b + s3c + s4d)    32     32  32 32      96
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
POINTS = [random_integer(SECURITY_LEVEL) for count in range(4)]

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        a_i = random_integer(security_level + 1)
        p = random_integer((security_level * 3) + 2)
        try:
            a = modular_inverse(a_i, p)
        except ValueError:
            continue
        else:
            break
    return a_i, p
    
def generate_public_key(private_key):
    a_i, p = private_key
    return modular_inverse(a_i, p)
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, public_points=POINTS, security_level=SECURITY_LEVEL):    
    s1 = random_integer(security_level)
    ciphertext = (public_key * s1)
    for point in public_points:
        s = random_integer(security_level)
        ciphertext += (point * s)
    return ciphertext, s1
    
def recover_key(ciphertext, private_key):
    a_i, p = private_key
    return ((ciphertext * a_i) % p) % a_i
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("manypoints", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    
        