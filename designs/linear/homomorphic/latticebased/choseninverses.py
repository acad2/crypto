#                       64 96     64
#                         96    64 64    128     
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):    
    a_size = security_level * 2
    b_size = security_level
    r_size = security_level - padding
    b_shift = security_level * 8
    
    s_size = (security_level * 3) - padding
    e_size = (security_level * 2) - padding
    
    mask = (2 ** (security_level * 8)) - 1
    return a_size, b_size, r_size, b_shift, s_size, e_size, mask
    
A_SIZE, B_SIZE, R_SIZE, B_SHIFT, S_SIZE, E_SIZE, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)    
    
def generate_private_key(a_size=A_SIZE, b_size=B_SIZE, b_shift=B_SHIFT):
    a = random_integer(a_size)
    b = random_integer(b_size) << b_shift
    q = (a * b) - 1
    return a, b, q
    
def generate_public_key(private_key, r_size=R_SIZE):
    a, b, q = private_key
    r = random_integer(r_size)
    return a, (q * random_integer(2)) + r
    
def generate_keypair(a_size=A_SIZE, b_size=B_SIZE, b_shift=B_SHIFT, r_size=R_SIZE):
    private_key = generate_private_key(a_size, b_size, b_shift)
    public_key = generate_public_key(private_key, r_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, mask=MASK):
    a, q_r = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return ((a * s) + e) % q_r, s & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    a, b, q = private_key
    return ((ciphertext * b) % q) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("choseninverses", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    