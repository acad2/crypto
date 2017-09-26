from crypto.utilities import random_integer, modular_inverse

SECURITY_LEVEL = 32
SHIFT = SECURITY_LEVEL * 8
# as + e   32 32     64
# s + aie  32     32 64   


#          32 32       64      modulus_size = s_size + e_size
#           32    9  64

#          16 32    48
#          32    32 48     80

# as - e
# ax - y

# s(a - e)
# x(a - y)
#sx(a - e)
#sx(a - y)

def generate_private_key(security_level=SECURITY_LEVEL):
    modulus = random_integer((security_level * 2) + 5)
    ai = random_integer(security_level + 2)
    while True:            
        try:
            modular_inverse(ai, modulus)
        except ValueError:
            modulus += 1
            continue
        else:
            break
    return ai, modulus
    
def generate_public_key(private_key):
    ai, modulus = private_key
    return modular_inverse(ai, modulus)
    
def generate_keypair(security_level=SECURITY_LEVEL):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, shift=SHIFT):
    s = random_integer(security_level)
    e = random_integer(security_level)
    return (public_key * s) + (e << shift), s
    
def recover_key(ciphertext, private_key, shift=SHIFT):
    ai, modulus = private_key
    return ((ciphertext * ai) % (modulus << shift)) % ai
    
def unit_test():
    from unittesting import test_key_exchange
    test_key_exchange("shortinversehighE", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    unit_test()
    