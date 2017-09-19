# k(r1 || m) mod p * r2
# concatenation == (x * 2^n) + y
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_secret_key(security_level=SECURITY_LEVEL):
    while True:
        k = random_integer((security_level * 4) + 1)    
        p = random_integer((security_level * 4) + 1)    
        try:       
            ki = modular_inverse(k, p)
        except ValueError:
            continue
        else:
            break
    return k, ki, p
    
def encrypt(m, secret_key, security_level=SECURITY_LEVEL, shift_amount=256, depth=1):
    k, ki, p = secret_key
    if depth > 1:
        k = pow(k, depth, p)
    r1 = random_integer(security_level)
    padded_message = (r1 << 256) | m
    assert padded_message < p
    assert (k * padded_message) > p
    ciphertext = (k * padded_message) % (p)  
    return ciphertext
       
def decrypt(ciphertext, secret_key, mask=(2 ** 256) - 1, depth=1):
    k, ki, p = secret_key
    padded_message = (ciphertext * pow(ki, depth, p)) % p
    return padded_message & mask
    
def test_encrypt_decrypt():
    key = generate_secret_key()
    m1 = 10
    m2 = 20
    ciphertext1 = encrypt(m1, key)
    plaintext1 = decrypt(ciphertext1, key)
    assert plaintext1 == m1, (plaintext1, m1)
    
    ciphertext2 = encrypt(m2, key)
    plaintext2 = decrypt(ciphertext2, key)
    assert plaintext2 == m2, '\n'.join(str(len(format(item, 'b'))) for item in (plaintext2, m2))
    
    ciphertext3 = ciphertext1 + ciphertext2
    plaintext3 = decrypt(ciphertext3, key)
    assert plaintext3 == m1 + m2
    
    ciphertext4 = ciphertext1 * ciphertext2
    plaintext4 = decrypt(ciphertext4, key, depth=2)
    assert plaintext4 == m1 * m2
    
    m3 = 30
    k, ki, p = key
    ciphertext5 = encrypt(m3, key, depth=2)
    ciphertext6 = ciphertext4 + ciphertext5 + (ciphertext1 * k)
    plaintext6 = decrypt(ciphertext6, key, depth=2)
    assert plaintext6 == (m1 * m2) + m3 + m1, (plaintext6, (m1 * m2) + m3 + m1)
  
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    