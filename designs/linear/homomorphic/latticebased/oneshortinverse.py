# as + e
# s + aie   # 32  32 32   64

from crypto.utilities import modular_inverse, random_integer

SECURITY_LEVEL = 32

def generate_private_key(security_level=SECURITY_LEVEL):
    p_size = (security_level * 2) + 1
    a_size = security_level + 1
    while True:        
        p = random_integer(p_size)    
        a_i = random_integer(a_size) # adds 1 extra bit    
        try:
            modular_inverse(a_i, p)
        except ValueError:
            continue
        else:
            break
    return a_i, p
    
def generate_public_key(private_key):
    a_i, p = private_key
    a = modular_inverse(a_i, p)    
    return a
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, s = random_integer(32), e=random_integer(32)):
    s = 1#random_integer(security_level)
    e = 0#random_integer(security_level)    
    ciphertext = ((public_key * s) + e)
    assert ciphertext % public_key != e
    return ciphertext, e
    
def recover_key(ciphertext, private_key):
    a_i, p = private_key
    return ((ciphertext * a_i) % p) / a_i
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("oneshortinverse", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    