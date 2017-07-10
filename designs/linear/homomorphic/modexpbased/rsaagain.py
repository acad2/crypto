from crypto.utilities import big_prime, random_integer, modular_inverse

def generate_private_key(size, e=65537):
    p = big_prime(size)
    d = modular_inverse(e, p - 1)
    return p, d
    
def generate_public_key(private_key, q_size, e=65537):
    p, d = private_key
    modulus = pow(p, random_integer(q_size), p * random_integer(q_size))    
    return modulus, e
    
def generate_keypair(size=33, q_size=32):
    private_key = generate_private_key(size)
    public_key = generate_public_key(private_key, q_size)
    return public_key, private_key
    
def encrypt(m, public_key):
    n, e = public_key
    return pow(m, e, n)
    
def decrypt(c, private_key):
    p, d = private_key
    return pow(c, d, p)
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    for count in range(256):        
        message = random_integer(32)
        ciphertext = encrypt(message, public_key)
        plaintext = decrypt(ciphertext, private_key)
        assert plaintext == message, (plaintext, message)
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    