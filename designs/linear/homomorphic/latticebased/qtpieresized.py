# sx + aie
#                64  32    96  32       128     128 + 32 == 160

from crypto.utilities import random_integer, modular_inverse, big_prime

SECURITY_LEVEL = 32
P = big_prime(129)

def generate_private_key(security_level=SECURITY_LEVEL, modulus=P):
    ai = random_integer((security_level * 3) + 1) >> 7 # + 1 byte and >> 7 to make it 1 bit larger    
    return ai
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, modulus=P):    
    ai = private_key    
    a = modular_inverse(ai, modulus)    
    x = random_integer(security_level)
    return (a * x) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL, modulus=P):
    private_key = generate_private_key(security_level, modulus)
    public_key = generate_public_key(private_key, security_level, modulus)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, modulus=P):
    s1 = random_integer(security_level * 2)
    e = random_integer(security_level)
    return ((public_key * s1) + e) % modulus, e
    
def recover_key(ciphertext, private_key, modulus=P):
    ai = private_key
    return ((ai * ciphertext) % modulus) / ai    
    
def test_encapsulate_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpie_resized", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_encapsulate_key_recover_key()
    