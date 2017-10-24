# as + e  mod qr + x    96  96      32      96  64    32
# s + aie mod q             96   32 32      96
#                                 64


#                     128  128      64     128 96     32
#                          128   32 64     128
#                                  96

#                     256  256      192     256 224   160
#                          256   32 192     256
#                        512                  480

#                     512  512      448    512 480   416
                    
                    
#                       128 64       32
#                           64    64 32                    
from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameters(security_level=SECURITY_LEVEL, padding=PADDING):
    inverse_size = security_level
    e_size = security_level * 2
    s_size = security_level * 4
    q_size = s_size + padding
    r_size = q_size - security_level
    x_size = security_level
    shift = security_level * 8
    mask = (2 ** (security_level * 8)) - 1
    return 32, 256 + padding, 224, 150, 256, 192, shift, mask#inverse_size, q_size, r_size, x_size, s_size, e_size, shift, mask
    
INVERSE_SIZE, Q_SIZE, R_SIZE, X_SIZE, S_SIZE, E_SIZE, SHIFT, MASK = generate_parameters(SECURITY_LEVEL)

def generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, shift=SHIFT):
    while True:
        ai = random_integer(inverse_size) << shift
        q = random_integer(q_size)
        try:
            modular_inverse(ai, q)
        except ValueError:
            continue
        else:
            break
    return ai, q
    
#from math import log
    
def generate_public_key(private_key, r_size=R_SIZE, x_size=X_SIZE):
    ai, q = private_key
    r = random_integer(r_size)
    x = random_integer(x_size)
    a = modular_inverse(ai, q)
 #   print log(ai, 2), log(q, 2), log(r, 2), log(x, 2)
    return a, (q * r) + x
    
def generate_keypair(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, r_size=R_SIZE, x_size=X_SIZE):
    private_key = generate_private_key(inverse_size, q_size)
    public_key = generate_public_key(private_key, r_size, x_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, mask=MASK):
    a, q_r = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
  #  assert (a * s) + e > q_r
  #  print log(a, 2), log(q_r, 2), log(s, 2), log(e, 2), (log(a, 2) + log(s, 2)) - log(q_r, 2)
    return ((a * s) + e) % q_r, s & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    ai, q = private_key
    return ((ai * ciphertext) % q) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("lowS", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    