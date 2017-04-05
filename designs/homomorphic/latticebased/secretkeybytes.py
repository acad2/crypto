from os import urandom

from crypto.utilities import bytes_to_integer, integer_to_bytes

def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(urandom(size_in_bytes)))
    
def generate_key(size_in_bytes=32):
    p1 = random_integer(size_in_bytes * 3)
    p2 = random_integer(size_in_bytes)
    return p1, p2
    
def encrypt(message_integer, secret_key, size_in_bytes=32):
    p1, p2 = secret_key
    q1 = random_integer(size_in_bytes)
    q2 = random_integer(size_in_bytes)
    print size_in_bytes
    p1 *= q1
    #point1 = p1 * q1
    point1 = p1
    point2 = p2 * q2
    while point2 > point1:
        q2 = random_integer(size_in_bytes)
        point2 = p2 * q2
    return point1 + point2 + message_integer    
    
def decrypt(ciphertext_integer, secret_key):
    p1, p2 = secret_key
    return (ciphertext_integer % p1) % p2    
    
def encrypt_bytes(data, secret_key, size_in_bytes=32):
    data += "\x00" * (size_in_bytes - len(data))
    ciphertext_integer = encrypt(bytes_to_integer(data), bytes_to_integer(secret_key), size_in_bytes)
    return integer_to_bytes(ciphertext_integer, size_in_bytes)

def decrypt_bytes(data, secret_key, size_in_bytes=32):
    _secret_key = bytes_to_integer(secret_key[0]), bytes_to_integer(secret_key[1])
    plaintext_integer = decrypt(bytes_to_integer(data), _secret_key, size_in_bytes)
    return integer_to_bytes(plaintext_integer, size_in_bytes)                
    
def test_encrypt_decrypt():    
    secret_key = generate_key()           
    for m in range(256):                    
        ciphertext = encrypt(m, secret_key)
        #print("Generated Ciphertext  : {}".format(ciphertext))
        plaintext = decrypt(ciphertext, secret_key)
        #print("Generated Plaintext   : {}".format(plaintext))
        assert plaintext == m, (plaintext, m)    
        
        m2 = 2
        ciphertext2 = encrypt(m2, secret_key)
        ciphertext3 = ciphertext + ciphertext2 + ciphertext2 + 5
        plaintext3 = decrypt(ciphertext3, secret_key)
        assert plaintext3 == m + m2 + m2 + 5, (plaintext3, m + m2 + m2)
    
    #p1, p2 = secret_key
    #_p1, _p2 = integer_to_bytes(p1, 32), integer_to_bytes(p2, 32)
    #__p1, __p2 = bytes_to_integer(_p1), bytes_to_integer(_p2)
    #assert __p1 == p1, (__p1, p1)
    ##_secret_key = integer_to_bytes(secret_key[0], 32), integer_to_bytes(secret_key[1], 32)
    ##__secret_key = bytes_to_integer(_secret_key[0]), bytes_to_integer(_secret_key[1])
    ##assert __secret_key == secret_key
    #
    #for m in range(256):
    #    m = integer_to_bytes(m, 32)
    #    ciphertext = encrypt(m, secret_key, 32)
    #    plaintext = decrypt(ciphertext, secret_key, 32)
    #    assert plaintext == m
            
            
            
       
if __name__ == "__main__":
    test_encrypt_decrypt()
    