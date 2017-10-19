from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 4
ERROR_MAGNITUDE = .5
PADDING = 4

def generate_parameter_sizes(key_size=SECURITY_LEVEL, error_magnitude=ERROR_MAGNITUDE, padding=PADDING):
    base_size = key_size
    error_size = base_size - 1
    while float(error_size - padding) / (base_size) < error_magnitude:
        base_size *= 2
        error_size = base_size - 1     
    base_size *= key_size
    error_size *= key_size
   # assert error_size + key_size == base_size, (error_size, key_size, base_size)
    inverse_size = key_size + padding
    modulus_size = base_size
    
    #z = r * (x/q)
    #
    error_size = modulus_size - inverse_size - padding
    modulus_noise_size = error_size - key_size - padding 
    assert inverse_size + error_size <= modulus_size, (inverse_size, error_size, inverse_size + error_size, modulus_size)
    return inverse_size, key_size, error_size, modulus_size, modulus_noise_size
    
INVERSE_SIZE, S_SIZE, E_SIZE, MODULUS_SIZE, NOISE_SIZE = generate_parameter_sizes(SECURITY_LEVEL, ERROR_MAGNITUDE, PADDING)
print INVERSE_SIZE, S_SIZE, E_SIZE, MODULUS_SIZE, NOISE_SIZE

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
    
def generate_public_key(private_key, noise_size=NOISE_SIZE):
    """ usage: generate_public_key(private_key, noise_size=NOISE_SIZE) => public_key
        
        Returns the integer(s) that constitute a public key. """
    ai, modulus = private_key
    q = random_integer(noise_size)
    a = modular_inverse(ai, modulus)
    return a, modulus + q#>> (noise_size * 8)
    
def generate_keypair(inverse_size=INVERSE_SIZE, modulus_size=MODULUS_SIZE, noise_size=NOISE_SIZE):
    """ usage: generate_keypair(invers_size=INVERSE_SIZE, 
                                modulus_size=MODULUS_SIZE, noise_size=NOISE_SIZE) => public_key, private_key
                                
        Returns a public key and a private key. """    
    private_key = generate_private_key(inverse_size, modulus_size)
    public_key = generate_public_key(private_key, noise_size)
    return public_key, private_key
    
def encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE):
    """ usage: encapsulate_key(public_key, s_size=S_SIZE, e_size=E_SIZE) => ciphertext, key
    
        Returns a ciphertext, key tuple. """        
    a, modulus = public_key
    s = random_integer(s_size)
    e = random_integer(e_size)
    return ((a * s) + e) % modulus, s#(modulus << (NOISE_SIZE * 8)), s
    
def recover_key(ciphertext, private_key):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    ai, modulus = private_key
    return ((ciphertext * ai) % modulus) % ai
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("coverage", generate_keypair, encapsulate_key, recover_key, iterations=10000, key_size=SECURITY_LEVEL)
    
if __name__ == "__main__":
    unit_test()
    