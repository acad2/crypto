# as + m
# +
# e

#ai
#  (as + m)
#   +
#   e

#   s + aim
#   +
#  aie             



# as + sm
# +
# e

#ai
#   (as + sm)
#    +
#    e

#   s + aism
#   +
#   aie      


# as + sm
# +
# e

#si
#   (as + sm)
#    +
#    e

#   (a + m)
#    +
#   sie


# as + sm
# +
# e
#       / s

# a + m
# +
#e/s


# as + es + sm
# as + rs + sk
# a + e + m
# a + r + k
#2a + e + r + m + k

# as + es + sm
# as + rs + sk
# as(as + rs + sk) + es(as + rs + sk) + sm(as + rs + sk)
# asas + asrs + assk + esas + esrs + essk + smas + smrs + smsk
# aass + assr + assk + asse + sser + ssek + assm + ssrm + ssmk
# aa + ar + ak + ae + er + ek + am + rm + mk
# a(a + r + k + e + m) + e(r + k) + m(r + k)

from crypto.utilities import random_integer

SECURITY_LEVEL = 32
SHIFT = SECURITY_LEVEL * 8
MASK = (2 ** SHIFT) - 1

def generate_secret_key(security_level=SECURITY_LEVEL):
    a = random_integer(security_level)
    s = random_integer(security_level)
    return a, s, (a * s)
    
def encrypt(m, secret_key, security_level=SECURITY_LEVEL, shift=SHIFT):
    a, s, _as = secret_key
    e = (s * random_integer(security_level)) << shift
    return _as + e + (s * m)
    
def decrypt(ciphertext, secret_key, mask=MASK, depth=1):
    a, s, _as = secret_key
    ciphertext = ciphertext / s
    return (ciphertext - (a * depth)) & mask
    
def unit_test():
    key = generate_secret_key()
    m1 = 2
    m2 = 3
    c1 = encrypt(m1, key)
    c2 = encrypt(m2, key)
    c3 = c1 + c2
    c4 = c1 * c2
    p1 = decrypt(c1, key)
    p2 = decrypt(c2, key)
    p3 = decrypt(c3, key, depth=2)
    p4 = decrypt(c4, key)
    assert p1 == m1, (p1, m1)
    assert p2 == m2, (p2, m2)
    assert p3 == (m1 + m2), (p3, m1, m2)
    assert p4 == (m1 * m2), (p4, m1, m2)
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("upperehomomorphic", generate_secret_key, encrypt, decrypt)
    
if __name__ == "__main__":
    unit_test()
    