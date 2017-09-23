#public parameters:
#    N := security_level
#    short_inverse_size := ((N * 2) + 1)
#    modulus_size := ((N * 3) + 5)
#    key_size := N
#    
#key generation:
#    private key:
#        BigInt short_inverse = random_integer(short_inverse_size)
#        BigInt modulus = random_integer(modulus_size)
#        output short_inverse, modulus
#    public key:
#        temp BigInt a = modular_inverse(short_inverse, modulus)
#        BigInt public_key[key_size] = array((a * random_integer(N)) % modulus for counter in range(key_size))
#        output public_key
#        
#public key operation:
#    BigInt ciphertext = sum(public_key[i] * random_integer(N) for i in range(key_size)) + m
#    output ciphertext
#    
#private key operation:
#    output ((ciphertext * short_inverse) % modulus) / short_inverse
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
    ciphertext = 0 #sum((public_key[count] * random_integer(security_level) for count in range(security_level)))    
    for count in range(security_level):
        public_key_element = public_key[count]
        ciphertext += (public_key_element * random_integer(security_level))    
    ciphertext += m
    return ciphertext
    
def decrypt(ciphertext, private_key):
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) / ai
    
def unit_test():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("bigpublickeyencryption", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    