# axs1 + ays2 + azs3 + e
# xs1 + ys2 + zs3 + aie   32 32         33 32    65
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PUBLIC_KEY_SIZE = SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        short_inverse = random_integer((security_level * 2) + 3)
        modulus = random_integer((security_level * 3) + 5)    
        try:
            modular_inverse(short_inverse, modulus)
        except ValueError:
            continue
        else:
            break
    return short_inverse, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    short_inverse, modulus = private_key
    a = modular_inverse(short_inverse, modulus)
    return [(a * random_integer(security_level)) % modulus for count in range(public_key_size)]
    
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encrypt(m, public_key, security_level=SECURITY_LEVEL):    
    ciphertext = m + sum(public_key[index] * random_integer(security_level) for index in range(security_level))   
    return ciphertext
    
def decrypt(ciphertext, private_key):
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) / ai
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("publickeyencryption", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    