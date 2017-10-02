# a
# as + e   32 x   32 + x
#           x     x + 1 + 32 + x
#          32      33     64        97


# modulus_size
# modulus_size + 32, error_size
# 32, 33 + error_size

# modulus_size = (33 + error_size + 1)
# error_size = 1024
# (1024 + 33) + 32, 1024
# 32, 33 + 1024        1058
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32

def generate_parameters(security_level):
    s_size = security_level
    q_size = security_level
    inverse_size = s_size + q_size + 2
    e_size = (security_level ** 2)
    modulus_size = inverse_size + e_size + 2
    return s_size, e_size, inverse_size, q_size, modulus_size
    
S_SIZE, E_SIZE, INVERSE_SIZE, Q_SIZE, MODULUS_SIZE = generate_parameters(SECURITY_LEVEL)
MODULUS = random_integer(MODULUS_SIZE)

def generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, modulus=MODULUS):
    while True:
        ai = random_integer(inverse_size) 
        q = random_integer(q_size)        
        try:
            a = modular_inverse(ai, modulus)
            qi = modular_inverse(q, modulus)
        except ValueError:
            continue
        else:
            break
    return ai, qi
    
def generate_public_key(private_key, modulus=MODULUS):
    ai, qi = private_key
    a = modular_inverse(ai, modulus)        
    q = modular_inverse(qi, modulus)
    public_key = (a * q) % modulus    
    return public_key
    
def generate_keypair(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, modulus=MODULUS):
    private_key = generate_private_key(inverse_size, q_size, modulus)
    public_key = generate_public_key(private_key, modulus)
    return public_key, private_key

def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, modulus=MODULUS):
    s = random_integer(S_SIZE)
    e = random_integer(E_SIZE)    
    return ((public_key * s) + e) % modulus, s
    
def recover_key(ciphertext, private_key, modulus=MODULUS):
    ai, qi = private_key    
    sq_aie = (ciphertext * ai) % modulus
    sq = sq_aie % ai
    return (sq * qi) % modulus
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("bigE", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    