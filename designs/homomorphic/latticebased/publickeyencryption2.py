import secretkey

def generate_private_key(size_in_bytes=32):
    return secretkey.generate_key(size_in_bytes)
    
def generate_public_key(private_key):
    p1, p2 = private_key
    return p1 + p2
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encrypt(message, public_key, size_in_bytes=32):
    return (public_key * secretkey.random_integer(size_in_bytes)) + message
    
def decrypt(ciphertext, private_key):
    return secretkey.decrypt(ciphertext, private_key)
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    m = secretkey.random_integer(24)
    ciphertext = encrypt(m, public_key)
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()