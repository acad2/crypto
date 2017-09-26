# (ad * s) mod kd
# (ad * x) mod kd
#ad * sx mod kd
from crypto.utilities import random_integer

SECURITY_LEVEL = 32

def generate_public_parameters(security_level=SECURITY_LEVEL):
    d = random_integer(security_level)
    a = random_integer(security_level)
    k = random_integer(security_level)
    return d, a * d, k * d
    
D, AD, KD = generate_public_parameters(SECURITY_LEVEL)

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level)
    return s
    
def generate_public_key(private_key, parameters=(D, AD, KD)):    
    d, ad, kd = parameters
    s = private_key
    return (ad * s * d) % kd
    
def generate_keypair(security_level=SECURITY_LEVEL, parameters=(D, AD, KD)):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, parameters)
    return public_key, private_key
    
def key_agreement(public_key1, private_key2, kd=KD):
    return (public_key1 * private_key2) % kd
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("noinverse2", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    unit_test()