from os import urandom

from crypto.utilities import gcd, random_integer
    
P1_SIZE = 110
P2_SIZE = 36
R_SIZE = 32
  
def generate_key(p1_size=P1_SIZE, p2_size=P2_SIZE):
    p1 = random_integer(p1_size)
    p2 = random_integer(p2_size)
    while gcd(p1, p2) != 1:
        p2 = random_integer(p2_size)
    return p1, p2
    
def encrypt(message_integer, secret_key, r_size=R_SIZE):
    p1, p2 = secret_key
    p1 *= random_integer(r_size)
    _p2 = p2 * random_integer(r_size)
    while _p2 > p1:
        _p2 = p2 * random_integer(r_size)
    return p1 + _p2 + message_integer  
    
def decrypt(ciphertext_integer, secret_key):
    p1, p2 = secret_key
    return (ciphertext_integer % p1) % p2    
    
def test_encrypt_decrypt():    
    secret_key = generate_key()           
    for m in range(256):                    
        ciphertext = encrypt(m, secret_key)        
        plaintext = decrypt(ciphertext, secret_key)        
        assert plaintext == m, (plaintext, m)    
        
        m2 = 2
        ciphertext2 = encrypt(m2, secret_key)
        ciphertext3 = ciphertext + ciphertext2 + ciphertext2 + 5
        plaintext3 = decrypt(ciphertext3, secret_key)
        assert plaintext3 == m + m2 + m2 + 5, (plaintext3, m + m2 + m2)
                     
if __name__ == "__main__":
    test_encrypt_decrypt()
    