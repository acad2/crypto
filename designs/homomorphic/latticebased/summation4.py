# 1 2 3 4 5     = 15
# 1 2 3 4 5 6 7 = 28
# q1 = 6; q2 = 8;

# g ^ x == g * r   mod p
# (g ^ a) ^ b == (g ^ b) ^ a   mod p

# pick a random m
# store it in the exponent
# exponentiate to multiply exponents
raise NotImplementedError()
from crypto.utilities import big_prime, random_integer, quicksum

G = 3
P = big_prime(32)

def generate_private_key(q_size=64):
    private_key = random_integer(q_size)            
    return private_key
    
def generate_public_key(private_key, g=G, p=P):        
    public_key = quicksum(private_key) % p    
    return public_key
    
def generate_keypair(q_size=64):
    private_key = generate_private_key(q_size)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def generate_secret(public_key, private_key, p=P):
    return (public_key * private_key) % p
    
def test_generate_public_key_generate_secret():
    from crypto.utilities import size_in_bits as size
    
    pb1, pr1 = generate_keypair()
    pb2, pr2 = generate_keypair()
    s1 = generate_secret(pb2, pr1)    
    s2 = generate_secret(pb1, pr2)
    assert s1 == s2, (s1, s2)
        
    
    print("Public key  A: {}".format(pb1))
    print("Public key  B: {}".format(pb2))
    print("Private key A: {}".format(pr1))
    print("Private key B: {}".format(pr2))
    print("Shared secret: {}".format(s1))
    print("Public key size: {}".format(size(pb1)))
    print("Private key size: {}".format(size(pr1)))
    print("Shared secret size: {}".format(size(s1)))
    
if __name__ == "__main__":
    test_generate_public_key_generate_secret()
    