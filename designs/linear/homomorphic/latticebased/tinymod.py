from crypto.utilities import random_integer, gcd

# 64 bit p1
# 32 bit p2 * 32 bit q2 == 64 bit p2q2

def generate_key(p1_size=4, p2_size=2):
    p1 = random_integer(p1_size)
    p2 = random_integer(p2_size)
    while gcd(p1, p2) != 1:
        p2 = random_integer(p2_size)
    return p1, p2
    
def encrypt(m, key, q_size1=4, q_size2=1):
    p1, p2 = key
    q1 = random_integer(q_size1)
    q2 = random_integer(q_size2)
    return (p1 * q1) + (p2 * q2) + m
    
def decrypt(c, key):
    p1, p2 = key
    return (c % p1) % p2
        
def test_encrypt_decrypt():
    key = generate_key()
    m = random_integer(1)
    ciphertext = encrypt(m, key)
    plaintext = decrypt(ciphertext, key)
    assert plaintext == m, (m, plaintext)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    