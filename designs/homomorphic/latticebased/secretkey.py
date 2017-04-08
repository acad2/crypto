from os import urandom

from crypto.utilities import bytes_to_integer, integer_to_bytes, gcd

def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
def generate_key(size_in_bytes=32):
    p1 = random_integer(size_in_bytes * 3)
    p2 = random_integer(size_in_bytes)
    while gcd(p1, p2) != 1:
        p2 = random_integer(size_in_bytes)
    return p1, p2
    
def encrypt(message_integer, secret_key, size_in_bytes=32):
    p1, p2 = secret_key
    p1 *= random_integer(size_in_bytes)
    _p2 = p2 * random_integer(size_in_bytes)
    while _p2 > p1:
        _p2 = p2 * random_integer(size_in_bytes)
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
    