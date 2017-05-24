# recurse mod
# Like manymod, but where each m1 is also a SingleMod ciphertext
# c1 := k1r1 + m1
# c2 := k2r2 + m2
# ...
# cN := kNrN + mN
# ciphertext := manymod encrypt(c1, c2, ... cN)

# manymod
#encrypt:
#    p1m1 + p2m2 + p3m3 + p4m4 + p5m5 + ...
#
#decrypt:
#    p2345 = c % p1
#    p1m1 = c - p2345
#    m1 = p1m1 / p1
#    
#    ...

from math import sqrt

from crypto.utilities import random_integer
   
def generate_item_key(size):
    return random_integer(size)

def encrypt_item(m, key, r_size):
    assert m <= key
    r = random_integer(r_size)
    print key, m, r
    return (key * m) + r
    
def decrypt_item(ciphertext, key):
    r = ciphertext % key
    print r
    ciphertext -= 4
    return ciphertext / key
    return (ciphertext - (ciphertext % key)) / key
        
def encrypt_array(message_points, item_keys, array_keys):
    
    
def test_encrypt_decrypt_item():
    key = generate_item_key(2)
    m = 10    
    ciphertext = encrypt_item(m, key, 1)
    print ciphertext
    plaintext = decrypt_item(ciphertext, key)
    assert plaintext == m, (plaintext, m)
    
    
if __name__ == "__main__":
    test_encrypt_decrypt_item()
        

