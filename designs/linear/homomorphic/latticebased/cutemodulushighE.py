# x mod (p + (e << n)) == x - ((x / p) * (e << n))
#q_size = s_size + e_size


# x mod (p + e) == x - ((x / p) * e) mod p
# as + e mod p + q
# s + aie             

from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
PADDING = 2

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    """ usage: generate_parameter_sizes(security_level=SECURITY_LEVEL,
                                        padding=PADDING) => inverse_size, s_size, e_size, p_size, q_size
                                        
        Returns parameter sizes suitable for instantiating the cryptosystem at the specified security level.
        The padding variable influences the probability of decryption success/failure. """
    ai_size = (security_level + 1)
    s_size = security_level - padding    
    p_size = security_level * 8
    e_size = (p_size - (security_level + padding) - security_level)
    q_size = (e_size - s_size) - (padding * 2) - security_level
    shift = security_level
    mask = (2 ** (s_size * 8)) - 1
    return ai_size, s_size, e_size, p_size, q_size, shift, mask
    
INVERSE_SIZE, S_SIZE, E_SIZE, P_SIZE, Q_SIZE, SHIFT, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)

def generate_private_key(inverse_size=INVERSE_SIZE, p_size=P_SIZE):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, p_size=P_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = random_integer(inverse_size)
        modulus = random_integer(p_size)
        try:
            modular_inverse(inverse, modulus)
        except ValueError:
            continue
        else:
            break            
    return inverse, modulus
    
def generate_public_key(private_key, q_size=Q_SIZE, shift=SHIFT):
    """ usage: generate_public_key(private_key, q_size=Q_SIZE, shift=SHIFT) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, modulus = private_key
    q = random_integer(q_size)
    a = modular_inverse(ai, modulus)
    return a, modulus + (q << shift) 
    
def generate_keypair(inverse_size=INVERSE_SIZE, p_size=P_SIZE, q_size=Q_SIZE):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                p_size=P_SIZE, q_size=Q_SIZE) => public_key, private_key
                                
        Returns a public key and a private key. """
    private_key = generate_private_key(inverse_size, p_size)
    public_key = generate_public_key(private_key, q_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, shift=SHIFT, mask=MASK):
    """ usage: encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE) => ciphertext, key
    
        Returns a ciphertext, key tuple. """        
    a, modulus = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return ((a * s) + (e << shift)) % modulus, s & mask
    
def recover_key(ciphertext, private_key, mask=MASK):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) & mask
        
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("cutemodulushighE", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
      