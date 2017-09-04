from crypto.utilities import random_integer, big_prime

SIZE = 32
POINTS = random_integer(SIZE), random_integer(SIZE), random_integer(SIZE), random_integer(SIZE)
P = big_prime(33)

def generate_private_key(size=SIZE):    
    return random_integer(1)   
        
def generate_public_key(private_key, points=POINTS, p=P):
    a, b, x, y = points
    for count in range(private_key):    
        a, b = ((a * x) + (b * y)) % p, ((a * y) + (b * x)) % p
    return a, b
    
    # ax + by
def generate_keypair(size=SIZE, points=POINTS):
    private_key = generate_private_key(size)
    public_key = generate_public_key(private_key, points)
    return public_key, private_key

def key_agreement(public_key, private_key, points=POINTS, p=P):
    a, b = public_key
    x, y = points[-2:]
    for count in range(private_key):
        a, b = ((a * x) + (b * y)) % p, ((a * y) + (b * x)) % p
    return a, b
    
def test_key_agreement():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    
    secret1 = key_agreement(public2, private1)
    secret2 = key_agreement(public1, private2)
    assert secret1 == secret2, (secret1, secret2)
    print("Public1: {}".format(public1))
    print("Public2: {}".format(public2))
    print("secret : {}".format(secret1))
    
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement10", generate_keypair, key_agreement, iterations=10000)

if __name__ == "__main__":
    test_key_agreement()
    