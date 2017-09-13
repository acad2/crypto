# ax
# ay


# s1ax + e1
# s2ay + e2
# a(s1x + s2y) + e1 + e2


# ax
# ax^2
# s1ax + e1
# s2ax^2 + e2
#a(s1x + s2x^2) + e1 + e2
#s1x + s2x^2 + a_i(e1 + e2)
#x(s1 + s2x) + a_i(e1 + e2)




# ax + x^2       
#sax + sx^2 + e
#sa + sx + x_ie
#s(a + x) + x_ie

#sz + x_ie
#s + z_ix_ie    #z = (a + x)
#            
#           32   16 16 32  = 64

# generate n = a + x
# generate x_i and compute z_i
#    
from crypto.utilities import random_integer, big_prime, modular_inverse, modular_subtraction

SECURITY_LEVEL = 32
P = big_prime(SECURITY_LEVEL + 1)

def generate_private_key(security_level=SECURITY_LEVEL, modulus=P):
    x_i = random_integer(security_level / 2)
    z_i = random_integer((security_level / 2) + 1) >> 7 # + 1 and >> 7 extends the value by 1 bit
    return x_i, z_i, (z_i * x_i) % modulus
        
def generate_public_key(private_key, modulus=P):    
    x_i, z_i, xz_i = private_key
    x = modular_inverse(x_i, modulus)
    z = modular_inverse(z_i, modulus)
    a = modular_subtraction(z, x, modulus) # z - x    
    public_key = ((a * x) + (x * 2)) % modulus
    return public_key
    
def generate_keypair(security_level=SECURITY_LEVEL, modulus=P):
    private_key = generate_private_key(security_level, modulus)
    public_key = generate_public_key(private_key, modulus)
    return public_key, private_key
    
def encapsulate_key(public_key, security_level=SECURITY_LEVEL, modulus=P):
    s = random_integer(security_level)
    e = random_integer(security_level)
    return ((public_key * s) + e) % modulus, s
    
def recover_key(ciphertext, private_key, modulus=P):
    x_i, z_i, xz_i = private_key
    return ((ciphertext * x_i * xz_i) % modulus) % xz_i
    
def test_encapsulate_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpiesquared", generate_keypair, encapsulate_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_encapsulate_key_recover_key()
    