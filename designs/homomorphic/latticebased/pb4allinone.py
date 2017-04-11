from os import urandom
from fractions import gcd
    
# utilities
def bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
# begin secret key section    
def generate_private_key(size_in_bytes=32):
    p1 = random_integer(size_in_bytes * 3)
    p2 = random_integer(size_in_bytes)
    while gcd(p1, p2) != 1:
        p2 = random_integer(size_in_bytes)
    return p1, p2
    
def _secretkey_encrypt(message_integer, secret_key, size_in_bytes=32):
    p1, p2 = secret_key
    p1 *= random_integer(size_in_bytes)
    _p2 = p2 * random_integer(size_in_bytes)
    while _p2 > p1:
        _p2 = p2 * random_integer(size_in_bytes)
    return p1 + _p2 + message_integer  
    
def _secretkey_decrypt(ciphertext_integer, secret_key):
    p1, p2 = secret_key
    return (ciphertext_integer % p1) % p2    
            
            
# begin public key section            
def generate_public_key(private_key, encryption_function=_secretkey_encrypt):
    pb1 = encryption_function(0, private_key)
    pb2 = encryption_function(0, private_key)
    return pb1, pb2
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encrypt(m, public_key, r_size=16):
    pb1, pb2 = public_key
    r1, r2 = random_integer(r_size), random_integer(r_size)
    return (pb1 * r1) + (pb2 * r2) + m
    
def decrypt(ciphertext, private_key, decryption_function=_secretkey_decrypt):
    return decryption_function(ciphertext, private_key)
    
    
# unit tests    
def test_secret_key_encrypt_decrypt():    
    secret_key = generate_private_key()           
    for m in range(256):                    
        ciphertext = _secretkey_encrypt(m, secret_key)        
        plaintext = _secretkey_decrypt(ciphertext, secret_key)        
        assert plaintext == m, (plaintext, m)    
        
        m2 = 2
        ciphertext2 = _secretkey_encrypt(m2, secret_key)
        ciphertext3 = ciphertext + ciphertext2 + ciphertext2 + 5
        plaintext3 = _secretkey_decrypt(ciphertext3, secret_key)
        assert plaintext3 == m + m2 + m2 + 5, (plaintext3, m + m2 + m2)
    print("secret key encrypt/decrypt unit test passed")
    
def test_public_key_encrypt_decrypt():    
    public_key, private_key = generate_keypair()
    message = 1
    ciphertext = encrypt(message, public_key)    
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    hamming_weight = lambda number: format(number, 'b').count('1')
    print("publickeyencryption4 encrypt/decrypt unit test passed")
    print("Public key size : {}".format(sum(hamming_weight(item) for item in public_key)))
    print("Private key size: {}".format(sum(hamming_weight(item) for item in private_key)))
    print("Ciphertext size : {}".format(hamming_weight(ciphertext)))
            
if __name__ == "__main__":
    test_secret_key_encrypt_decrypt()
    test_public_key_encrypt_decrypt()
    