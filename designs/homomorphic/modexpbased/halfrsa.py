from math import log

from crypto.utilities import big_prime, modular_inverse

def generate_private_key(size, e=65537):
    p = big_prime(size)
    q = big_prime(size)  
    return p, q, modular_inverse(e, p - 1)
    
def generate_public_key(p, q):
    return p * q
    
def generate_keypair(size, e=65537):
    p, q, d = generate_private_key(size, e)
    return (e, p * q), (d, p)
    
def encrypt(m, public_key):
    e, n = public_key
    assert log(m, 2) <= log(n, 2) / 2, (log(m, 2), log(n, 2) / 2)
    return pow(m, e, n)
    
def decrypt(c, private_key):
    d, p = private_key
    # single modexp with a single prime of size 1/2 the modulus
    # instead of exponentiation modulo a 4096 bit number, only requires exponentiation modulo a 2048 bit number
    # works as long as m < p
    # takes about 1/3 less time
    return pow(c, d, p) 
    
def test_encrypt_decrypt():    
    from crypto.utilities import random_integer
    public_key, private_key = generate_keypair(16)
    m = random_integer(15)
    c = encrypt(m, public_key)   
    _m = decrypt(c, private_key)
    assert _m == m, (_m, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    