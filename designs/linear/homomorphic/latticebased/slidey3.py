#a = modular_inverse(ai << n, q) & upper_bits
#c = as + e
#s + aie  
#LSB(s + e)
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    q_size = security_level * 10 * 2
        
    inverse_size = security_level 
    shift = security_level * 8
    r_size = (security_level * 5 * 3) - padding
    a_shift = security_level * 14 * 8
    
    s_size = security_level * 3
    e_shift = ((security_level * 18) * 8) - (security_level * 2)
    
    mask = (2 ** (security_level * 8)) - 1
    return q_size, inverse_size, shift, r_size, a_shift, s_size, e_shift, mask
    
Q_SIZE, INVERSE_SIZE, SHIFT, R_SIZE, A_SHIFT, S_SIZE, E_SHIFT, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
#print INVERSE_SIZE, R_SIZE, S_SIZE, E_SHIFT, (S_SIZE + E_SHIFT) - Q_SIZE
Q = 2 ** (Q_SIZE * 8)

def generate_private_key(inverse_size=INVERSE_SIZE, r_size=R_SIZE, q=Q, shift=SHIFT):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = (random_integer(inverse_size) << shift) | 1
        try:
            modular_inverse(inverse, q)
        except ValueError:
            continue
        else:
            break               
    return inverse
    
def generate_public_key(private_key, q=Q, a_shift=A_SHIFT):
    """ usage: generate_public_key(private_key, r_size=R_SIZE) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai = private_key    
    a = modular_inverse(ai, q) >> a_shift
    return a
    
def generate_keypair(inverse_size=INVERSE_SIZE, r_size=R_SIZE, q=Q, shift=SHIFT):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                q_size=Q_SIZE, r_size=R_SIZE) => public_key, private_key
                                
        Returns a public key and a private key. """    
    private_key = generate_private_key(inverse_size, r_size, q, shift)
    public_key = generate_public_key(private_key, q)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_shift=E_SHIFT, q=Q, mask=MASK, a_shift=A_SHIFT):
    """ usage: encapsulate_key(public_key, s_size=S_SIZE, e_shift=E_SHIFT) => ciphertext, key
    
        Returns a ciphertext, key tuple. """        
    a = public_key    
    s = random_integer(s_size)        
    return (((a << a_shift) * s) % q) >> e_shift, ((s & mask) + (e & mask)) & mask
    
def recover_key(ciphertext, private_key, q=Q, e_shift=E_SHIFT, mask=MASK):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai = private_key
    return (((ciphertext << e_shift) * ai) % q) & mask
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("slidey3", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    