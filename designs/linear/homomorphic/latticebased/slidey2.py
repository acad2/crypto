"""
public parameters:
    q = 2 ** q_size
    
key generation:
    a^-1 = random_integer(inverse_size) << k
    r = random_integer(r_size)
    
    a = MSB(modular_inverse(a^-1, q + r))
    private_key = (a^-1, r)
    public_key = a
    
public key operation:
    c = MSB((a << j) * s mod q)
    output c, LSB(s)
    
private key operation:    
    s_lsb = LSB(c * a^-1 mod q)
    output s_lsb
    
Truncation and addition of random error are effectively equivalent.    
Public parameters, public keys, and ciphertexts can all be compressed:
    - The public modulus is a power of 2 and can be stored effectively for free when not in use
    - The public key `a` and ciphertexts have all 0s in the lower bits; The 0s can be right shifted away when the value is not in use """

# 640  96    64 576     640  480      .75
# 352  96    64 288     352  192
# 320  96    64 256     320  160      .5
# 288  96    64 224     288  128
# 256  96    64 192     256  96
# 224  96    64 160     224  64
# 192  96    64 128     192  32       .15

from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    q_size = security_level * 20
        
    inverse_size = security_level 
    shift = security_level * 8
    r_size = security_level * 15
    a_shift = security_level * 14 * 8
    
    s_size = security_level * 3
    e_shift = ((security_level * 18) * 8) - (padding * 8)
    
    mask = (2 ** (security_level * 8)) - 1
    return q_size, inverse_size, shift, r_size, a_shift, s_size, e_shift, mask
    
Q_SIZE, INVERSE_SIZE, SHIFT, R_SIZE, A_SHIFT, S_SIZE, E_SHIFT, MASK = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
print Q_SIZE, INVERSE_SIZE, SHIFT, R_SIZE, A_SHIFT, S_SIZE, E_SHIFT
Q = 2 ** (Q_SIZE * 8)

def generate_private_key(inverse_size=INVERSE_SIZE, r_size=R_SIZE, q=Q, shift=SHIFT):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, q_size=Q_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = random_integer(inverse_size) << shift
        r = 0#random_integer(r_size)
        try:
            modular_inverse(inverse, q + r)
        except ValueError:
            continue
        else:
            break            
    return inverse, r
    
def generate_public_key(private_key, q=Q, a_shift=A_SHIFT):
    """ usage: generate_public_key(private_key, r_size=R_SIZE) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, r = private_key    
    a = modular_inverse(ai, q + r)
    return (a >> a_shift)# << a_shift
    
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
    return (((a << a_shift) * s) % q) >> e_shift, s & mask
    
def recover_key(ciphertext, private_key, q=Q, e_shift=E_SHIFT, mask=MASK):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai, r = private_key
    return (((ciphertext << e_shift) * ai) % (q + r)) & mask
   
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("slidey2", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    