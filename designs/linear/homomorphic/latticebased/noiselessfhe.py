# a, a, a... (modular_inverse(ai, q * random_integer()))
#ax + ay + az
#ai(ax + ay + az)
#x + y + z 
from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

SECURITY_LEVEL = 32
KEY_SIZE = 2

def random_invertible_integer(security_level, modulus):
    while True:
        valuei = random_integer(security_level)
        try:
            value = modular_inverse(valuei, modulus)
        except ValueError:
            continue
        else:
            break
    return valuei
            
def generate_decryption_key(modulus, security_level=SECURITY_LEVEL):
    ai = random_invertible_integer(security_level, modulus)
    return ai
    
def generate_encryption_key(modulus, decryption_key, security_level=SECURITY_LEVEL,
                            key_size=KEY_SIZE):
    ai = decryption_key
    encryption_key = []
    while len(encryption_key) < key_size:              
        while True:            
            try:
                element = modular_inverse(ai, modulus * random_integer(security_level))
            except ValueError:
                continue
            else:                                
                encryption_key.append(element)
                break
    return encryption_key
        
def generate_secret_key(security_level=SECURITY_LEVEL, key_size=KEY_SIZE):
    modulus = random_integer(security_level + 4)
    decryption_key = generate_decryption_key(modulus, security_level)
    encryption_key = generate_encryption_key(modulus, decryption_key, security_level, key_size)
    return modulus, encryption_key, decryption_key
    
def encrypt(m, secret_key, security_level=SECURITY_LEVEL):
    modulus, encryption_key, decryption_key = secret_key
    ciphertext = 0
    value = 0    
    for element in encryption_key[:-1]:
        r = random_integer(security_level)               
        ciphertext += element * r        
        value += r        
        
    final_r = modular_subtraction(m, value, modulus)    
    ciphertext += encryption_key[-1] * final_r        
    return ciphertext % (modulus * random_integer(security_level))
    
def decrypt(ciphertext, secret_key, depth=1):
    modulus, encryption_key, decryption_key = secret_key
    return (pow(decryption_key, depth, modulus) * ciphertext) % modulus
                
def generate_private_key(security_level=SECURITY_LEVEL, key_size=KEY_SIZE):
    private_key = generate_secret_key(security_level, key_size)
    return private_key
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL):    
    public_key = [encrypt(0, private_key, security_level),
                  encrypt(1, private_key, security_level)]
    return public_key
    
def generate_keypair(security_level=SECURITY_LEVEL, key_size=KEY_SIZE):
    private_key = generate_private_key(security_level, key_size)
    public_key = generate_public_key(private_key, security_level)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    r0 = random_integer(security_level)
    r1 = random_integer(security_level)
    a, b = public_key
    return ((a * r0) + (b * r1)), r1
    
def recover_key(ciphertext, private_key, depth=1):
    return decrypt(ciphertext, private_key, depth=depth)
                    
def unit_test():
    secret_key = generate_secret_key()
    c1 = encrypt(1, secret_key)
    p1 = decrypt(c1, secret_key)
    assert p1 == 1, (p1, 1)
    
    c2 = encrypt(2, secret_key)
    c3 = c1 + c2
    p3 = decrypt(c3, secret_key)
    assert p3 == 1 + 2, (p3, 3)
    
    c6 = c2 * c3
    p6 = decrypt(c6, secret_key, depth=2)
    assert p6 == 2 * 3, (p6, 6)
    
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("noiselessfhe", generate_secret_key, encrypt, decrypt, iterations=10000)
    
    from unittesting import test_key_exchange
    test_key_exchange("noiselessfhe_kex", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    