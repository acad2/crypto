from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 16
# as + aae == a(ae + s)      32   64
# s + ae   32  33 32  65   


# as + aae   32 32      48 16
# s + ae     32         32 16    48

def generate_private_key(security_level=SECURITY_LEVEL):
    modulus = random_integer((security_level * 3) + 5)
    a = random_integer((security_level * 2) + 2)
    while True:            
        try:
            ai = modular_inverse(a, modulus)
        except ValueError:
            modulus += 1
            continue
        else:
            break
    #while (a << (security_level * 2 * 8)) < modulus:
    #    modulus >>= 1
    #    print "Shrinking..."        
    assert (a * a) > modulus
    return ai, a, modulus
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL):
    ai, a, modulus = private_key          
    return a, pow(a, 2, modulus)
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL):
    a, aa = public_key        
    s = random_integer(security_level * 2) 
    e = random_integer(security_level)
    return (a * s) + (aa * e), s
    
def recover_key(ciphertext, private_key):
    ai, a, modulus = private_key
    return ((ciphertext * ai) % modulus) % a
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("a_asquared", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    