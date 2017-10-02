# s(a + x), s(a + y), s(a + z)           # 97   32   
# sa + sx, sa + sy, sa + sz
#rsa + rsx + tsa + tsy + usa + usz + m
#ar + rx + at + yt + ua + uz + sim
#a(r + t + u) + rx + yt + uz + si(m)     # 32 32     32 32    65 32  97
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PUBLIC_KEY_SIZE = SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL, padding1=3, padding2=6):
    while True:
        short_inverse = random_integer((security_level * 2) + padding1)
        modulus = random_integer((security_level * 3) + padding2) 
        try:
            modular_inverse(short_inverse, modulus)
        except ValueError:
            continue
        else:
            break
    return short_inverse, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE,
                        e=lambda size: random_integer(size)):
    si, modulus = private_key
    s = modular_inverse(si, modulus)
    a = random_integer(security_level)
    return [(s * (a + e(security_level))) % modulus for count in range(public_key_size)]
    
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encrypt(m, public_key, security_level=SECURITY_LEVEL):    
    ciphertext = m + sum(public_key[index] * random_integer(security_level) for index in range(security_level))   
    return ciphertext
    
def decrypt(ciphertext, private_key):
    si, modulus = private_key
    return ((ciphertext * si) % modulus) / si
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("publickeyencryption2", generate_keypair, encrypt, decrypt, iterations=10000, plaintext_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    