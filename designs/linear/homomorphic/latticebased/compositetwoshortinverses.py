# a, b
# s1a + s2b
# s1b_i + s2a_i     # 32 32  32 64   96
from crypto.utilities import modular_inverse, random_integer, gcd

SECURITY_LEVEL = 32

def generate_private_key(security_level=SECURITY_LEVEL):
    p_size = security_level * 3
    p = random_integer(p_size)
    a_i = random_integer((security_level * 2) - 1) 
    b_i = random_integer(security_level - 2)
    while gcd(a_i, p) != 1 or gcd(b_i, p) != 1:
        p = random_integer(p_size )
        a_i = random_integer((security_level * 2) - 1) 
        b_i = random_integer(security_level - 2) 
    #assert gcd(a_i, p) == 1, gcd(a_i, p)
    #assert gcd(b_i, p) == 1, gcd(b_i, p)
    #assert modular_inverse(a_i, p)    
    #assert modular_inverse(b_i, p)
    ab_i = (a_i * b_i) % p    
    return a_i, b_i, ab_i, p
    
def generate_public_key(private_key):
    a_i, b_i, ab_i, p = private_key
    a = modular_inverse(a_i, p)
    b = modular_inverse(b_i, p)
    return a, b
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    s1 = random_integer(security_level)
    s2 = random_integer(security_level)
    a, b = public_key
    ciphertext = ((a * s1) + (b * s2))
    return ciphertext, s2
    
def recover_key(ciphertext, private_key):
    a_i, b_i, ab_i, p = private_key
    return ((ciphertext * ab_i) % p) / a_i
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("twoshortinverses", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    