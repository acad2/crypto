from os import urandom

from crypto.utilities import bytes_to_integer, gcd

def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
def generate_private_key(size_in_bytes=32):
    p = random_integer(size_in_bytes)
    e = random_integer(size_in_bytes)
    while e > p:
        e = random_integer(size_in_bytes)    
    return p, e
    
def generate_public_key(private_key, size_in_bytes=32):
    p, e = private_key
    q = random_integer(size_in_bytes)
    return (p * q) + e
    
def generate_keypair(size_in_bytes=32):
    private_key = generate_private_key(size_in_bytes)
    public_key = generate_public_key(private_key, size_in_bytes)
    return public_key, private_key
    
def encrypt(message_integer, public_key):
    return public_key + message_integer
    
def decrypt(ciphertext_integer, private_key):
    p, e = private_key
    return (ciphertext_integer % p) - e
    
def test_encrypt_decrypt():
    import pprint
    public_key, private_key = generate_keypair()
    m = 1
    print("Generated private key : \n{}".format(pprint.pformat(private_key)))
    print("Generated public key  : {}".format(public_key))    
    ciphertext = encrypt(m, public_key)
    print("Generated Ciphertext  : {}".format(ciphertext))
    plaintext = decrypt(ciphertext, private_key)
    print("Generated Plaintext   : {}".format(plaintext))
    assert plaintext == m, (plaintext, m)    
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    