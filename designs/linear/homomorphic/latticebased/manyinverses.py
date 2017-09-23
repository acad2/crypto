from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PUBLIC_KEY_SIZE = SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        ai = random_integer(security_level + 2)
        modulus = random_integer((security_level * 2) + 3)    
        try:
            modular_inverse(ai, modulus)
        except ValueError:
            continue
        else:
            break
    return ai, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    ai, modulus = private_key
    public_key = []
    while len(public_key) < public_key_size:
        try:
            public_key.append(modular_inverse(ai, modulus * random_integer(security_level)))
        except ValueError:
            continue
    return public_key
        
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encrypt(m, public_key, security_level=SECURITY_LEVEL):
    ciphertext = 0
    for entry in public_key:
        ciphertext += (entry * random_integer(security_level))
    ciphertext += m
    return ciphertext
    
def decrypt(ciphertext, private_key):
    ai, modulus = private_key
    # ax + ay + az + m
    # x + y + z + aim
    return ((ciphertext * ai) % modulus) / ai
    
def unit_test():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("manyinverses", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    