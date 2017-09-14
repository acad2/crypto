# a, b
# s1a + s2b
# s1b_i + s2a_i     # 32 32  32 64   96
from crypto.utilities import modular_inverse, random_integer, gcd

SECURITY_LEVEL = 32

def calculate_parameter_sizes(security_level):
    """ usage: calculate_parameter_sizes(security_level) => a_i_size, b_i_size, p_size
    
        Given a target security level, returns parameter sizes suitable for instantiating the cryptosystem at the desired security level. """
    p_size = (security_level * 3) + 2  # + a few extra bytes lowers probability of decryption failure to negligible
    a_i_size = (security_level * 2) + 1
    b_i_size = security_level
    return a_i_size, b_i_size, p_size
    
def generate_private_key(security_level=SECURITY_LEVEL):
    """ usage: generate_private_key(security_level=SECURITY_LEVEL) => private_key
    
        Returns the integer(s) that constitute a private key. """
    a_i_size, b_i_size, p_size = calculate_parameter_sizes(security_level)    
    p = random_integer(p_size)
    a_i = random_integer(a_i_size) 
    b_i = random_integer(b_i_size)
    while gcd(a_i, p) != 1 or gcd(b_i, p) != 1:
        p = random_integer(p_size)
        a_i = random_integer(a_i_size) 
        b_i = random_integer(b_i_size) 
    ab_i = (a_i * b_i) % p    
    return a_i, b_i, ab_i, p
    
def generate_public_key(private_key):
    """ usage: generate_public_key(private_key) => public_key
        
        Returns the integer(s) that constitute a public key. """
    a_i, b_i, ab_i, p = private_key
    a = modular_inverse(a_i, p)
    b = modular_inverse(b_i, p)
    return a, b
    
def generate_keypair(security_level=SECURITY_LEVEL):
    """ usage: generate_keypair(security_level=SECURITY_LEVEL) => public_key, private_key
        
        Returns a public key and private key for the target security level. """
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    """ usage: encapsulate_key(public_key, security_level=SECURITY_LEVEL) => ciphertext, secret
    
        Returns a ciphertext and a shared secret.
        The ciphertext should be made available to the holder of the private key associated with public key.
        The secret may be used to create a secured communications channel with that user. """
    s1 = random_integer(security_level)
    s2 = random_integer(security_level)
    a, b = public_key
    ciphertext = ((a * s1) + (b * s2))
    return ciphertext, s2
    
def recover_key(ciphertext, private_key):
    """ usage: recover_key(ciphertext, private_key) => secret
        
        Returns a shared secret. """
    a_i, b_i, ab_i, p = private_key
    return ((ciphertext * ab_i) % p) / a_i
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("twoshortinverses", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    