#key generation:
#    a^-1 = random_integer(inverse_size) << shift
#    q = random_integer(q_size)
#    
#    a = modular_inverse(a^-1, q)
#    r = random_integer(r_size)
#    q_r = q + r
#    private_key = (a^-1, q)
#    public_key = (a, q_r)
#    
#public key operation:
#    c = (a * s) + e mod q_r
#private key operation:    
#    s_lsb = ((c * a^-1) mod q) & mask
    
# 320  96       256     320  160
#      96    64 256     320
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(key_size=SECURITY_LEVEL, padding=PADDING):
    inverse_size = key_size
    q_size = key_size * 10
    r_size = (key_size * 5) - padding
    
    s_size = key_size * 3
    e_size = key_size * 8
    
    shift = key_size * 8
    mask = (2 ** (key_size * 8)) - 1
    return inverse_size, q_size + padding, r_size, s_size, e_size, shift, mask
    
INVERSE_SIZE, Q_SIZE, R_SIZE, S_SIZE, E_SIZE, SHIFT, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
print INVERSE_SIZE, Q_SIZE, R_SIZE, S_SIZE, E_SIZE, (S_SIZE + E_SIZE) - Q_SIZE

def generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, shift=SHIFT):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = random_integer(inverse_size) << shift
        modulus = random_integer(q_size)
        try:
            modular_inverse(inverse, modulus)
        except ValueError:
            continue
        else:
            break            
    return inverse, modulus
    
def generate_public_key(private_key, r_size=R_SIZE):
    """ usage: generate_public_key(private_key, r_size=R_SIZE) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, modulus = private_key
    r = random_integer(r_size)
    a = modular_inverse(ai, modulus)
    return a, modulus + r
    
def generate_keypair(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, r_size=R_SIZE):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                q_size=Q_SIZE, r_size=R_SIZE) => public_key, private_key
                                
        Returns a public key and a private key. """    
    private_key = generate_private_key(inverse_size, q_size)
    public_key = generate_public_key(private_key, r_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, mask=MASK):
    """ usage: encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE) => ciphertext, key
    
        Returns a ciphertext, key tuple. """        
    a, modulus = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return ((a * s) + e) % modulus, s & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("lows2", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    