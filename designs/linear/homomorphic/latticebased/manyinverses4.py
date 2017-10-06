#aa + aa
#saa + saa + raa + raa
#aa + aa(s + s + r + r
#aa + aa(s2 + r2)

from crypto.utilities import random_integer, modular_inverse, big_prime

SECURITY_LEVEL = 32
KEY_LENGTH = SECURITY_LEVEL
DIMENSION = 1#SECURITY_LEVEL

def generate_point(a, modulus, dimension=2, security_level=SECURITY_LEVEL):
    output = 0
    for counter in range(dimension):
        points = []
        while len(points) < dimension:
            try:
                points.append(modular_inverse(a, modulus * random_integer(security_level)))
            except ValueError:
                continue                        
        output += sum(points)
    return output
        
def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        modulus = big_prime(security_level + 3)
        ai = random_integer(security_level)
        try:
            modular_inverse(ai, modulus)
        except ValueError:
            continue
        else:
            break
    return ai, ((ai * ai) + (ai * ai)) % modulus, modulus
    
def generate_public_key(private_key, key_length=KEY_LENGTH, dimension=DIMENSION, security_level=SECURITY_LEVEL):    
    public_key = []
    ai, aiai, modulus = private_key    
    while len(public_key) < key_length:                
        public_key.append(generate_point(ai, modulus, dimension, security_level))        
    return public_key
    
def generate_keypair(security_level=SECURITY_LEVEL, key_length=KEY_LENGTH, dimension=DIMENSION):    
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, key_length, dimension, security_level)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    ciphertext = 0
    secret = 0
    for point in public_key:
        r = random_integer(security_level)
        ciphertext += point * r
        secret += r
    return ciphertext, secret
    
def recover_key(ciphertext, private_key):
    ai, aiai, modulus = private_key
    return (ciphertext * ai) % modulus
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("manyinverses4", generate_keypair, encapsulate_key, recover_key, iterations=100)
    
if __name__ == "__main__":
    unit_test()
    