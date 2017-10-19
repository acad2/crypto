# x mod p + q == q*(x/p)
# x mod p + p == p*(x/p)
# x mod 3p    == 2p*(x/p)
# x mod pp    == p(p-1)(x/p) == pp - p(x/p)

# as + e  mod qr + x    96  96      32      96  64    32
# s + aie mod q             96   32 32      96
#                                 64
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_parameters(security_level=SECURITY_LEVEL):
    inverse_size = security_level
    e_size = security_level
    s_size = security_level * 3
    q_size = s_size 
    r_size = (s_size * 2) - q_size - security_level - 4
    x_size = security_level
    shift = (q_size - security_level) * 8
    return inverse_size, q_size, r_size, x_size, s_size, e_size, shift
    
INVERSE_SIZE, Q_SIZE, R_SIZE, X_SIZE, S_SIZE, E_SIZE, SHIFT = generate_parameters(SECURITY_LEVEL)

def generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE):
    while True:
        ai = random_integer(inverse_size)
        q = random_integer(q_size + 4)
        try:
            modular_inverse(ai, q)
        except ValueError:
            continue
        else:
            break
    return ai, q
    
from math import log
    
def generate_public_key(private_key, r_size=R_SIZE, x_size=X_SIZE):
    ai, q = private_key
    r = random_integer(r_size)
    x = random_integer(x_size)
    a = modular_inverse(ai, q)
    print log(ai, 2), log(q, 2), log(r, 2), log(x, 2)
    return a, (q * r) + x
    
def generate_keypair(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, r_size=R_SIZE, x_size=X_SIZE):
    private_key = generate_private_key(inverse_size, q_size)
    public_key = generate_public_key(private_key, r_size, x_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, shift=SHIFT):
    a, q_r = public_key
    s = random_integer(s_size - 4)
    e = random_integer(e_size)
    print log(a, 2), log(q_r, 2), (log(a, 2) + log(s, 2)) - log(q_r, 2)
    return ((a * s) + e) % q_r, s >> shift
    
def recover_key(ciphertext, private_key, shift=SHIFT):
    ai, q = private_key
    return ((ai * ciphertext) % q) >> shift
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("bigS", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    