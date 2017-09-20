# encrypt:
#   modular_inverse(k * r || m, k)
# decrypt:
#   modular_inverse(c, k)
from crypto.utilities import random_integer, modular_inverse, big_prime

SECURITY_LEVEL = 32

def generate_key(security_level=SECURITY_LEVEL):    
    k = big_prime((security_level * 2) + (security_level / 2))
    return k
    
def armor_message(m, k, security_level=SECURITY_LEVEL):
    shift = security_level * 8
    padded_message = (random_integer(security_level) << shift) | m
    assert padded_message < k
    return padded_message
    
def encrypt(m, k, security_level=SECURITY_LEVEL):    
    padded_message = armor_message(m, k, security_level)
    return modular_inverse(padded_message, k)
    
def decrypt(ciphertext, k, mask=((2 ** (SECURITY_LEVEL * 8)) - 1)):
    return modular_inverse(ciphertext, k) & mask
    
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular_inverse2", generate_key, encrypt, decrypt, iterations=10000, plaintext_size=16)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    