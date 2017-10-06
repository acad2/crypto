# a, a, a... (modular_inverse(ai, q * random_integer()))
#ax + ay + az
#ai(ax + ay + az)
#x + y + z 
from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

SECURITY_LEVEL = 16
PUBLIC_KEY_SIZE = SECURITY_LEVEL

def generate_private_key(security_level=SECURITY_LEVEL):
    while True:
        ai = random_integer(security_level)
        modulus = big_prime(security_level + 3)    
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
            public_key.append(modular_inverse(ai, modulus * random_integer(security_level)) +
                              modular_inverse(ai, modulus * random_integer(security_level)))
        except ValueError:
            continue
    return public_key
        
def generate_keypair(security_level=SECURITY_LEVEL, public_key_size=PUBLIC_KEY_SIZE):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, public_key_size)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    ciphertext = 0
    secret = 0
    for entry in public_key:
        r = random_integer(security_level)
        ciphertext += entry * r
        secret += r        
    return ciphertext, secret * 2
    
def recover_key(ciphertext, private_key, depth=1):
    ai, modulus = private_key
    # ax + ay + az
    # x + y + z
    return (ciphertext * pow(ai, depth, modulus)) % modulus
    
def encrypt(m, public_key, security_level=SECURITY_LEVEL, _modulus=(2 ** (SECURITY_LEVEL * 8))):
    ciphertext = 0
    value = 0
    for element in public_key[:-1]:
        r = random_integer(security_level)
        ciphertext += element * r
        value += r
    final_r = modular_subtraction(m, value, _modulus)
    ciphertext += public_key[-1] * final_r    
    return ciphertext
    
def decrypt(ciphertext, private_key, depth=1, _modulus=(2 ** (SECURITY_LEVEL * 8))):
    return recover_key(ciphertext, private_key, depth) % _modulus
    #ciphertext1, ciphertext2 = ciphertext
    #secret = recover_key(ciphertext1, private_key, depth)
    ##return ciphertext2 / secret
    #modulus = private_key[1]   
    ##return modular_subtraction(ciphertext2, secret, modulus)
    #decryption_key = modular_inverse(secret, modulus)
    #return (ciphertext2 * decryption_key) % modulus
        
def unit_test():
    #public1, private1 = generate_keypair()
    #c1, s1 = encapsulate_key(public1)
    #c2, s2 = encapsulate_key(public1)
    #c3, s3 = (c1 + c2), (s1 + s2)
    #c4, s4 = (c1 * c2), (s1 * s2) % private1[1]
    #
    #_s3 = recover_key(c3, private1)
    #_s4 = recover_key(c4, private1, depth=2)
    #assert _s3 == s3, (_s3, s3)
    #assert _s4 == s4, (_s4, s4)
    #    
    #m1, m2 = 10, 20
    #c1 = encrypt(m1, public1)
    #c2 = encrypt(m2, public1)
    #c3 = c1 + c2
    #m3 = m1 + m2
    #c4 = c1 * c2
    #m4 = m1 * m2
    #
    #p1 = decrypt(c1, private1)
    #p2 = decrypt(c2, private1)
    #p3 = decrypt(c3, private1)
    #p4 = decrypt(c4, private1, depth=2)
    #assert p1 == m1, (p1, m1)
    #assert p2 == m2, (p2, m2)
    #assert p3 == m3, (p3, m3)
    #assert p4 == m4, (p4, m4)
    
    from unittesting import test_key_exchange
    test_key_exchange("manyinverses_keyexchange2", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
    #from unittesting import test_asymmetric_encrypt_decrypt
    #test_asymmetric_encrypt_decrypt("manyinverses_PKE", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    