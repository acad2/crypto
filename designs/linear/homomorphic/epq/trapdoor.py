from crypto.utilities import modular_inverse, random_integer

__all__ = ["generate_parameter_sizes", "compress", "decompress",
           "generate_keypair", "public_key_operation", "private_key_operation"]

SECURITY_LEVEL = 4
ERROR_MAGNITUDE = .99
PADDING = 4

def generate_parameter_sizes(key_size=SECURITY_LEVEL, error_magnitude=ERROR_MAGNITUDE, padding=PADDING):
    inverse_size = key_size + padding
    
    # find a pair of x, y such that x/y >= error_magnitude (after accounting for padding)
    base_size = key_size
    error_size = base_size - 1
    while float(error_size - padding) / (base_size) < error_magnitude:
        base_size *= 2
        error_size = base_size - 1     
    
    base_size *= key_size # scale up x, y so that key_size fits into 1 ciphertext
    error_size *= key_size
    
    modulus_size = base_size   
    error_size = modulus_size - inverse_size - padding
    modulus_noise_size = error_size - key_size - padding 
    shift = modulus_noise_size * 8
    
    assert float(error_size) / base_size >= error_magnitude
    assert inverse_size + error_size <= modulus_size, (inverse_size, error_size, inverse_size + error_size, modulus_size)
    return inverse_size, key_size, error_size, modulus_size, shift
    
INVERSE_SIZE, S_SIZE, E_SIZE, MODULUS_SIZE, SHIFT = generate_parameter_sizes(SECURITY_LEVEL, ERROR_MAGNITUDE, PADDING)
print INVERSE_SIZE, S_SIZE, E_SIZE, MODULUS_SIZE

def generate_private_key(inverse_size=INVERSE_SIZE, modulus_size=MODULUS_SIZE):
    """ usage: generate_private_key(inverse_size=INVERSE_SIZE, modulus_size=MODULUS_SIZE) => private_key
        
        Returns the integer(s) that constitute a private key. """
    while True:
        inverse = random_integer(inverse_size)
        modulus = random_integer(modulus_size)
        try:
            modular_inverse(inverse, modulus)
        except ValueError:
            continue
        else:
            break            
    return inverse, modulus
    
def generate_public_key(private_key, shift=SHIFT):
    """ usage: generate_public_key(private_key, shift=SHIFT) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, modulus = private_key   
    a = modular_inverse(ai, modulus)
    return a, decompress(compress(modulus, shift), shift) # compression must be done for security even if space is not a concern
    
def generate_keypair(inverse_size=INVERSE_SIZE, modulus_size=MODULUS_SIZE, shift=SHIFT):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                modulus_size=MODULUS_SIZE, shift=SHIFT) => public_key, private_key
                                
        Returns a public key and a private key. """    
    private_key = generate_private_key(inverse_size, modulus_size)
    public_key = generate_public_key(private_key, shift)    
    return public_key, private_key
    
def public_key_operation(public_key, s_size=S_SIZE, e_size=E_SIZE, shift=SHIFT):
    """ usage: encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE, shift=SHIFT) => ciphertext, s
    
        Returns a ciphertext, s tuple. """        
    a, modulus = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return compress((a * s) % modulus, shift), s
    
def private_key_operation(ciphertext, private_key, shift=SHIFT):
    """ usage: recover_key(ciphertext, private_key) => s
        
        Returns the integer that represents s. """
    ai, modulus = private_key
    return ((decompress(ciphertext, shift) * ai) % modulus) % ai
        
def decompress(value, shift):
    return value << shift
    
def compress(value, shift):
    return value >> shift
        
def unit_test():
    from crypto.designs.linear.homomorphic.latticebased.unittesting import test_key_exchange
    test_key_exchange("epq_trapdoor", generate_keypair, public_key_operation, private_key_operation, iterations=100, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    