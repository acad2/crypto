from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
# as + abe   32 32      48 16
# s + be     32         33 16    48

def generate_private_key(security_level=SECURITY_LEVEL):
    modulus = random_integer((security_level * 3) + 5)
    a = random_integer(security_level * 2)
    while True:            
        try:
            ai = modular_inverse(a, modulus)
        except ValueError:
            modulus += 1
            continue
        else:
            break
    b = random_integer((security_level * 2) + 2)        
    return ai, b, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL):
    ai, b, modulus = private_key          
    a = modular_inverse(ai, modulus)
    assert (a * b) > modulus
    return a, (a * b) % modulus
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    a, ab = public_key        
    s = random_integer(security_level * 2) 
    e = random_integer(security_level)
    return (a * s) + (ab * e), s
    
def recover_key(ciphertext, private_key):
    ai, b, modulus = private_key
    return ((ciphertext * ai) % modulus) % b
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("regularoldinverse", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    