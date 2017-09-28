# as + (y << n) == as + y*(2**n)    32 32   32 32    64  64
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
SECURITY_LEVEL_BITS = 32 * 8
A = random_integer(SECURITY_LEVEL)
N = 2 ** (SECURITY_LEVEL_BITS)

def generate_private_key(security_level=SECURITY_LEVEL):
    s = random_integer(security_level)
    return s
    
def generate_public_key(private_key, security_level=SECURITY_LEVEL, a=A, shift=SECURITY_LEVEL_BITS):
    s = private_key
    e = random_integer(security_level)
    return (a * s) + (e << shift)
    
def generate_keypair(security_level=SECURITY_LEVEL, a=A, shift=SECURITY_LEVEL_BITS):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, security_level, a, shift)
    return public_key, private_key
    
def key_agreement(public_key, private_key, mask=N - 1):
    return (public_key * private_key) & mask
    
def unit_test():
    from unittesting import test_key_agreement
    test_key_agreement("highekeyagreement", generate_keypair, key_agreement, iterations=10000)
    
def test_lower_bits_correlation():
    from crypto.utilities import integer_to_bytes
    outputs = []
    for test_number in range(10000):
        public1, private1 = generate_keypair()
        public2, private2 = generate_keypair()
        share = key_agreement(public1, private2)
        test = (public1 * public2) % N
        outputs.append(str(integer_to_bytes((public1 ^ public2), 32))) 
    random_data = ''.join(outputs)
        
    from crypto.analysis.metrics import test_randomness, test_bias_of_data
    test_randomness(random_data)
    test_bias_of_data(random_data)
    
    assert ((public1 * public2) / (A + 1)) % N != key_agreement(public1, private2)
    
if __name__ == "__main__":
    unit_test()
    test_lower_bits_correlation()
    