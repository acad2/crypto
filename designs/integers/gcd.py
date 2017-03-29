from os import urandom

from crypto.utilities import gcd, bytes_to_integer, integer_to_bytes

def encrypt(message, key):
    r1, r2 = generate_random_prime(size=256), generate_random_prime(size=256)
    c1 = (message * r1) + key
    c2 = (message * r2) + key
    return c1, c2
    
def decrypt(ciphertext, key):
    c1, c2 = ciphertext
    c1 -= key
    c2 -= key
    return gcd(c1, c2)
    
def generate_random_prime(size=None): # not really implemented yet
    assert size is not None
    assert not size % 8
    return bytes_to_integer(bytearray(urandom(size / 8)))
    
def test_encrypt_decrypt():
    m = 1
    key = 1
    ciphertext = encrypt(m, key)
    print("Ciphertext {}".format(''.join(bytes(integer_to_bytes(item, 32)) for item in ciphertext)))
    plaintext = decrypt(ciphertext, key)
    print("Recovered plaintext: {}".format(plaintext))
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    