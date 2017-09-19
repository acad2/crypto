# encrypt:
#   modular_inverse(m, k * p)
# decrypt:
#   modular_inverse(c, k)
from crypto.utilities import random_integer, modular_inverse, big_prime

SECURITY_LEVEL = 32

def generate_key(security_level=SECURITY_LEVEL):    
    k = big_prime(security_level)
    return k
    
def encrypt(m, k, security_level=SECURITY_LEVEL):    
    while True:
        r = random_integer(security_level)
        try:
            ciphertext = modular_inverse(m, k * r)
        except ValueError:
            continue
        else:
            break
    return ciphertext
    
def decrypt(ciphertext, k):
    return modular_inverse(ciphertext, k)
    
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular_inverse", generate_key, encrypt, decrypt, iterations=10000, plaintext_size=16)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    