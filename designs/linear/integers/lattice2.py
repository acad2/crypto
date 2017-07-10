from os import urandom

from crypto.utilities import bytes_to_integer

def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
def generate_secret_key(size_in_bytes=32):
    p1 = random_integer(size_in_bytes * 3)
    p2 = random_integer(size_in_bytes)
    return p1, p2
    
def encrypt(message_integer, secret_key, size_in_bytes=32):
    p1, p2 = secret_key
    q1 = random_integer(size_in_bytes)
    q2 = random_integer(size_in_bytes)
    point1 = p1 * q1
    point2 = p2 * q2
    while point2 > point1:
        q2 = random_integer(size_in_bytes)
        point2 = p2 * q2
    return point1 + point2 + message_integer    
    
def decrypt(ciphertext_integer, secret_key):
    p1, p2 = secret_key
    return (ciphertext_integer % p1) % p2    
    
def test_encrypt_decrypt():
    import pprint
    secret_key = generate_secret_key()
    print("Generated secret key : \n{}".format(pprint.pformat(secret_key)))          
    for m in range(256):
    #m = 2                
        ciphertext = encrypt(m, secret_key)
        print("Generated Ciphertext  : {}".format(ciphertext))
        plaintext = decrypt(ciphertext, secret_key)
        print("Generated Plaintext   : {}".format(plaintext))
        assert plaintext == m, (plaintext, m)    
        
        m2 = 2
        ciphertext2 = encrypt(m2, secret_key)
        ciphertext3 = ciphertext + ciphertext2 + ciphertext2 + 5
        plaintext3 = decrypt(ciphertext3, secret_key)
        assert plaintext3 == m + m2 + m2 + 5, (plaintext3, m + m2 + m2)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    