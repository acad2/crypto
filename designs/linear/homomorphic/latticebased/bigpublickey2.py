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
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):    
    ciphertext = 0 #sum((public_key[count] * random_integer(security_level) for count in range(security_level)))    
    for count in range(security_level):
        public_key_element = public_key[count]
        ciphertext += (public_key_element * random_integer(security_level))
    e = random_integer(security_level)
    ciphertext += e        
    return ciphertext, e
    
def recover_key(ciphertext, private_key):
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) / ai
    
def test_encapsulate_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("bigpublickey2", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_encapsulate_key_recover_key()
    