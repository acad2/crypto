# 320  96       256     320  160
#      96    64 256     320
from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(key_size=SECURITY_LEVEL, padding=PADDING):
    inverse_size = key_size
    q_size = key_size * 10
    q_shift = ((key_size * 5) - padding) * 8
    
    s_size = key_size * 3
    e_shift = ((key_size * 8) - 8) * 8
    
    ai_shift = key_size * 8
    mask = (2 ** (key_size * 8)) - 1
    return inverse_size, q_size + padding, q_shift, s_size, e_shift, ai_shift, mask
    
INVERSE_SIZE, Q_SIZE, Q_SHIFT, S_SIZE, E_SHIFT, AI_SHIFT, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
print INVERSE_SIZE, Q_SIZE, Q_SHIFT, S_SIZE, E_SHIFT

def generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, ai_shift=AI_SHIFT):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = random_integer(inverse_size) << ai_shift
        modulus = random_integer(q_size)
        try:
            modular_inverse(inverse, modulus)
        except ValueError:
            continue
        else:
            break            
    return inverse, modulus
    
def generate_public_key(private_key, q_shift=Q_SHIFT):
    """ usage: generate_public_key(private_key, q_shift=Q_SHIFT) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, modulus = private_key   
    a = modular_inverse(ai, modulus)
    return a, ((modulus >> q_shift) << q_shift)
    
def generate_keypair(inverse_size=INVERSE_SIZE, q_size=Q_SIZE, q_shift=Q_SHIFT):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                q_size=Q_SIZE, q_shift=Q_SHIFT) => public_key, private_key
                                
        Returns a public key and a private key. """    
    private_key = generate_private_key(inverse_size, q_size)
    public_key = generate_public_key(private_key, q_shift)
    return public_key, private_key
    
def public_key_operation(public_key, s_size=S_SIZE, e_shift=E_SHIFT, mask=MASK):
    """ usage: public_key_operation(public_key, s_size=S_SIZE, e_shift=E_SHIFT) => ciphertext, key
    
        Returns a ciphertext, key tuple. """        
    a, modulus = public_key
    s = random_integer(s_size)    
    return ((a * s) % modulus) >> e_shift, s & mask
    
def private_key_operation(ciphertext, private_key, mask=MASK, e_shift=E_SHIFT):
    """ usage: private_key_operation(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai, modulus = private_key
    return (((ciphertext << e_shift) * ai) % modulus) & mask
    
def unit_test():
    from crypto.designs.linear.homomorphic.latticebased.unittesting import test_key_exchange
    test_key_exchange("trapdoor", generate_keypair, public_key_operation, private_key_operation, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    