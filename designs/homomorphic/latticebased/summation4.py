#p1 = 6
#p2 = 8
#
#1 2 3 4 5
#1 2 3 4 5 6 7
#
## prime = 17
## g ^ 5 = g1 g2 g3 g4 g5        mod prime
## g ^ 7 = g1 g2 g3 g4 g5 g6 g7  mod prime
#
## 5 ^ (g1 g2 g3 g4 g5 g6 g7) = 11 mod prime
## 7 ^ (g1 g2 g3 g4 g5) = 11 mod prime
#
#
#9 + 5 + 1 = 15
#15 + 6 + 7 = 28
#
#15 * p
#28 * p


from crypto.utilities import big_prime, random_integer, quicksum

G = 3
P = big_prime(32)

def generate_private_key(q_size=32):
    q1 = random_integer(q_size)
    private_key = quicksum(q1)
    return private_key
    
def generate_public_key(private_key, g=G, p=P):        
    public_key = private_key % p    
    return public_key
    
def generate_keypair(q_size=32):
    private_key = generate_private_key(q_size)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def generate_secret(public_key, private_key, p=P):
    return (public_key * private_key) % p
    
def test_generate_public_key_generate_secret():
    pb1, pr1 = generate_keypair()
    pb2, pr2 = generate_keypair()
    s1 = generate_secret(pb2, pr1)
    s2 = generate_secret(pb1, pr2)
    assert s1 == s2
    print("Public key  A: {}".format(pb1))
    print("Public key  B: {}".format(pb2))
    print("Private key A: {}".format(pr1))
    print("Private key B: {}".format(pr2))
    print("Shared secret: {}".format(s1))
    
if __name__ == "__main__":
    test_generate_public_key_generate_secret()
    