# ax + d, ay + f, az + g                     x 32 32
#s1ax + s2ay + s3az + e
#s1x + s2y + s3z + ai(e + s1d + s2f + s3g)   32 32     65 64           129

# choose small a, b, c, ... 
# choose a small inverse ai
# e = random_integer(64)
# t = modular_subtraction(a, e, n)
# s = random_integer(32)
from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

SECURITY_LEVEL = 32
MODULUS = random_integer((SECURITY_LEVEL * 4) + 1)
DIMENSION = 3

def generate_private_key(security_level=SECURITY_LEVEL, modulus=MODULUS):
    while True:
        ai = random_integer((security_level * 2) + 1)
        try:
            a = modular_inverse(ai, modulus)
        except ValueError:
            continue
        else:
            break            
    return ai
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, modulus=MODULUS, dimension=DIMENSION):        
    a = modular_inverse(private_key, modulus)
    public_key = []
    for point in range(dimension):
        public_key.append(generate_short_output(a, security_level, modulus))
    return public_key
    
def generate_keypair(security_level=SECURITY_LEVEL, modulus=MODULUS, dimension=DIMENSION):
    private_key = generate_private_key(security_level, modulus)
    public_key = generate_public_key(private_key, security_level, modulus, dimension)
    return public_key, private_key
    
def encrypt(m, public_key, security_level=SECURITY_LEVEL, modulus=MODULUS):
    ciphertext = m
    for point in public_key:
        ciphertext += point * random_integer(security_level)
    return ciphertext
    
def decrypt(ciphertext, private_key, modulus=MODULUS):
    return ((ciphertext * private_key) % modulus) / private_key
    
def unit_test():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("decomposetest", generate_keypair, encrypt, decrypt, iterations=10000)
        
def generate_short_output(a, security_level=SECURITY_LEVEL, modulus=MODULUS):   
    s = 0
    ai = modular_inverse(a, modulus)
    target = random_integer(security_level)
    e = random_integer(security_level)
    t = modular_subtraction(target, e, modulus)    
    while t > ai:
        t = (t * ai) % modulus
    print t
    from math import log
    print log(s, 2), log(e, 2), log(target, 2), log(modulus, 2)
    return target#((a * s) + e) % modulus

if __name__ == "__main__":
    unit_test()
    