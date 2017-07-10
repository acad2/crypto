# pm + r
# pm1 + r1 + pm2 + r2 == pm3 + r3

# pr + m
# pr1 + m1 + pr2 + m2 == pr3 + m3

# pm + m
# pm1 + m1 + pm2 + m2 == pm3 + m3 # self certifying?

# pp + e # self certifying?



# k0((k1 * r1) + m) + r2
# (k0k1 * k0r1) + k0m + r2
# k0k0k1r1 + k0m + r2
# k0q1 + k0m + r2
# k0q2 + r2

from crypto.utilities import random_integer

def generate_key(size=33):
    return random_integer(size), random_integer(size)
    
def encrypt_inner(m, inner_key, r_size):
    return (inner_key * random_integer(r_size)) + m
    
def decrypt_inner(ciphertext, inner_key):
    return ciphertext % inner_key
    
def encrypt_outer(c, outer_key, r_size):    
    return (outer_key * c) + random_integer(r_size)
    
def decrypt_outer(ciphertext, outer_key):
    r = ciphertext % outer_key
    ciphertext -= r
    return ciphertext / outer_key
    
def encrypt(m, key, r_size=32):
    inner_key, outer_key = key
    c = encrypt_inner(m, inner_key, r_size)
    return encrypt_outer(c, outer_key, r_size)
    
def decrypt(ciphertext, key):
    inner_key, outer_key = key
    _ciphertext = decrypt_outer(ciphertext, outer_key)
    return decrypt_inner(_ciphertext, inner_key)
    
def test_encrypt_decrypt():
    key = generate_key()
    message = random_integer(32)
    ciphertext = encrypt(message, key)
    plaintext = decrypt(ciphertext, key)
    assert plaintext == message           
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    
