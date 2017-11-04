key generation:
    ai = random_integer(inverse_size)
    q = random_integer(q_size)
    private_key = ai, q
    
    a = modular_inverse(ai, q)
    r = random_integer(r_size)
    q_r = q + r
    public_key = a, q_r
    
public key operation:
    s = random_integer(s_size)
    e = random_integer(e_size)
    ciphertext = (a * s) + (s * s * e) mod q_r
    secret = s & low_bits
    
private key operation:
    secret = ((ai * ciphertext) % q) & mask

# as + s^2e         160 32    64 32
#  s + ai(s^2e)       32     64 64 32

#                  224 64    128 32       
#                     64     64 128 32

#                  288 96    192 32  
#                     96     64 192 32
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    inverse_size = security_level
    inverse_shift = security_level * 8
    q_size = (security_level * 9) + padding
    r_size = (security_level * 4) - padding
    
    s_size = security_level * 3
    e_size = security_level 
    
    mask = (2 ** (security_level * 8)) - 1
    return inverse_size, inverse_shift, q_size, r_size, s_size, e_size, mask
    
INVERSE_SIZE, INVERSE_SHIFT, Q_SIZE, R_SIZE, S_SIZE, E_SIZE, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
    
def generate_private_key(inverse_size=INVERSE_SIZE, inverse_shift=INVERSE_SHIFT, q_size=Q_SIZE):   
    while True:
        inverse = random_integer(inverse_size) << inverse_shift
        q = random_integer(q_size)
        try:
            modular_inverse(inverse, q)
        except ValueError:
            continue
        else:
            break
    return inverse, q
    
def generate_public_key(private_key, r_size=R_SIZE):
    ai, q = private_key
    r = random_integer(r_size)
    a = modular_inverse(ai, q)
    return a, q + r
    
def generate_keypair(security_level=SECURITY_LEVEL, padding=PADDING):
    inverse_size, inverse_shift, q_size, r_size, s_size, e_size, mask = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
    private_key = generate_private_key(inverse_size, inverse_shift, q_size)
    public_key = generate_public_key(private_key, r_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, mask=MASK):
    a, q_r = public_key
    s = random_integer(s_size)    
    e = random_integer(e_size)
    return (s * (a + (s * e))) % q_r, s & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    ai, q = private_key
    return ((ai * ciphertext) % q) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("ssquared", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    