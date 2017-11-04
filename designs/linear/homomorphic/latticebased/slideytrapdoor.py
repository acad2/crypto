# as           mod q + r   128 64              128 32
# s + (<< n)e  mod q           64   32 96      128
from math import log

from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_parameter_sizes(security_level=SECURITY_LEVEL):
    inverse_size = security_level
    q_size = security_level * 4
    
    r_size = security_level
    
    s_size = security_level * 2
    z_size = r_size - 4
    
    mask = (2 ** (security_level * 8)) - 1    
    shift = security_level * 8
    return inverse_size, q_size, s_size, r_size, z_size, mask, shift
    
def generate_public_parameters(security_level=SECURITY_LEVEL):    
    inverse_size, q_size, s_size, r_size, z_size, mask, shift = generate_parameter_sizes(security_level)
    inverse = 1 << (inverse_size * 8)
    assert inverse == (2 ** (inverse_size * 8))
    
    q = random_integer(q_size)
    while log(q, 2) < ((q_size * 8) - .1):
        q = random_integer(q_size)
    return inverse, q
    
INVERSE_SIZE, Q_SIZE, S_SIZE, R_SIZE, Z_SIZE, MASK, SHIFT = generate_parameter_sizes(SECURITY_LEVEL)
INVERSE, Q = generate_public_parameters(SECURITY_LEVEL)

def generate_private_key(r_size=R_SIZE, inverse=INVERSE, q=Q):
    while True:
        r = random_integer(r_size)
        try:
            modular_inverse(inverse, q + r)
        except ValueError:
            continue
        else:
            break
    return r
    
def generate_public_key(private_key, inverse=INVERSE, q=Q):
    r = private_key
    a = modular_inverse(inverse, q + r)
    return a
    
def generate_keypair(security_level=SECURITY_LEVEL, r_size=R_SIZE, inverse=INVERSE, q=Q):    
    private_key = generate_private_key(r_size, inverse, q)
    public_key = generate_public_key(private_key, inverse, q)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, z_size=Z_SIZE, q=Q, mask=MASK):
    a = public_key
    s = random_integer(s_size)
    z = random_integer(z_size)       
    return (a * s) % (q + z), s & mask
    
def recover_key(ciphertext, private_key, q=Q, mask=MASK, shift=SHIFT):
    r = private_key
    return ((ciphertext << shift) % (q + r)) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("slideytrapdoor", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    