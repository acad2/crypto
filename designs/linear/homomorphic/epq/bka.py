from crypto.utilities import random_integer, modular_inverse

import trapdoor

SECURITY_LEVEL = 32
PADDING = 4

def generate_parameter_sizes(security_level=SECURITY_LEVEL, padding=PADDING):
    """ usage: generate_parameter_sizes(security_level=SECURITY_LEVEL,
                                        padding=PADDING) => inverse_size, s_size, e_size, p_size, q_size
                                        
        Returns parameter sizes suitable for instantiating the cryptosystem at the specified security level.
        The padding variable influences the probability of decryption success/failure. """
    inverse_size, s_size, e_size, modulus_size, backdoor_shift = trapdoor.generate_parameter_sizes(security_level, padding=padding)
    agreement_shift = (modulus_size - security_level) * 8
    return inverse_size, s_size, e_size, modulus_size, agreement_shift, backdoor_shift
    
INVERSE_SIZE, S_SIZE, E_SIZE, P_SIZE, SHIFT, BACKDOOR_SHIFT = generate_parameter_sizes(SECURITY_LEVEL, PADDING)
                                              
def generate_backdoor_private_key(inverse_size=INVERSE_SIZE, p_size=P_SIZE):
    """ usage: generate_backdoor_private_key(inverse_size=INVERSE_SIZE, p_size=P_SIZE) => private_key
        
        Returns the integers that constitute a private key. """
    return trapdoor.generate_private_key(inverse_size, p_size)
    
def generate_backdoor_public_key(private_key, shift=BACKDOOR_SHIFT):
    """ usage: generate_backdoor_public_key(private_key, q_size=Q_SIZE) => public_key
        
        Returns the integer(s) that constitute a public key. """
    return trapdoor.generate_public_key(private_key, shift)
    
def generate_backdoor_keypair(inverse_size=INVERSE_SIZE, p_size=P_SIZE, shift=BACKDOOR_SHIFT):
    """ usage: generate_backdoor_keypair(invers_size=INVERSE_SIZE, 
                                p_size=P_SIZE, q_size=Q_SIZE) => public_key, private_key
                                
        Returns a public key and a private key. """
    private_key = generate_backdoor_private_key(inverse_size, p_size)
    public_key = generate_backdoor_public_key(private_key, shift)
    return public_key, private_key
    
def backdoor_recover_key(ciphertext, private_key):
    """ usage: recover_key(ciphertext, private_key) => key
        
        Returns the integer(s) that constitute a secret key. """
    return trapdoor.private_key_operation(ciphertext, private_key)
    
BACKDOOR_PUBLIC_KEY, BACKDOOR_KEY = generate_backdoor_keypair(INVERSE_SIZE, P_SIZE, BACKDOOR_SHIFT)
A, MODULUS = BACKDOOR_PUBLIC_KEY
del BACKDOOR_PUBLIC_KEY

def generate_private_key(s_size=S_SIZE):
    return random_integer(s_size)

def generate_public_key(private_key, a=A, modulus=MODULUS, e_size=E_SIZE):
    s = private_key
    e = random_integer(e_size)
    return ((a * s) + e) % modulus
    
def generate_keypair(a=A, modulus=MODULUS, s_size=S_SIZE, e_size=E_SIZE):
    private_key = generate_private_key(s_size)
    public_key = generate_public_key(private_key, a, modulus, e_size)
    return public_key, private_key
    
def key_agreement(ciphertext, private_key, modulus=MODULUS, shift=SHIFT):
    return ((ciphertext * private_key) % modulus) >> shift
        
def unit_test():                         
    for count in range(10000):
        pub1, priv1 = generate_keypair()
        pub2, priv2 = generate_keypair()
        share = key_agreement(pub2, priv1)
        
        backdoor_priv1 = backdoor_recover_key(pub1, BACKDOOR_KEY)
        assert backdoor_priv1 == priv1, (count, backdoor_priv1, priv1)
        backdoor_share = key_agreement(pub2, backdoor_priv1)
        if backdoor_share != share:
            raise Warning("Unit test failed after {} successfully compromised key exchanges".format(count))           
        
    from unittesting import test_key_agreement
    test_key_agreement("backdoorkeyagreement", generate_keypair, key_agreement, iterations=10000)  
    
if __name__ == "__main__":
    unit_test()
    