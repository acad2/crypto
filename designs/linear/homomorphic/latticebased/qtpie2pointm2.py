from crypto.utilities import random_integer, modular_inverse, big_prime

# s1(ab) + s2(abc)
# a(bs1) + a(bcs2)
# a(bs1 + bcs2)
# bs1 + bcs2
# s1 + cs2       # 32 33 32 = 65

# s1(ab) + s2(abc)
# ab(s1 + s2c)

# s1(a + b) + s2(a + b + c)
# s1a + s1b + s2a + s2b + s2c
# s1(a + b) + s2(a + b) + s2c
# (a + b)(s1 + s2) + s2c
# s1+s2 + aibis2c   32   32 32 32 

P = big_prime(66)

def generate_private_key(inverse_size=32, c_size=33):
    ai = random_integer(64)
    bi = random_integer(64)
    c = random_integer(c_size)    
    return ai, bi, c
    
def generate_public_key(private_key, p=P):
    ai, bi, c = private_key
    a = modular_inverse(ai, p)
    b = modular_inverse(bi, p)    
    public_key = ((a * b) % p, (a * b * c) % p)
    return public_key
    
def generate_keypair(inverse_size=32, c_size=33, p=P):
    private_key = generate_private_key(inverse_size, c_size)
    public_key = generate_public_key(private_key, p)
    return public_key, private_key
    
def exchange_key(public_key, s_size=32, p=P):
    s1 = random_integer(s_size)
    s2 = random_integer(s_size)    
    p1, p2 = public_key
    ciphertext = ((p1 * s1) + (p2 * s2)) % p
    return ciphertext, s1
    
def recover_key(ciphertext, private_key, p=P):
    # s1(ab) + s2(abc)
    # a(bs1) + a(bcs2)    
    # a(bs1 + bcs2) * ai
    # bs1 + bcs2 * bi
    # s1 + cs2    
    ai, bi, c = private_key
    bs1_bcs2 = (ai * ciphertext) % p
    s1_cs2 = (bi * bs1_bcs2) % p
    return s1_cs2 % c
            
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpie2pointm2", generate_keypair, exchange_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    