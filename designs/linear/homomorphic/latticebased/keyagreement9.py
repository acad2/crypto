from crypto.utilities import random_integer, big_prime

SIZE = 32
POINTS = random_integer(SIZE), random_integer(SIZE)
P = big_prime(33)

def generate_private_key(size=SIZE):    
    x, y = random_integer(size), random_integer(size)
    z = x + y
    return x, y, z
    
def generate_public_key(private_key, points=POINTS, p=P):
    x, y, z = private_key
    a, b = points
    point1 = (a * x) + (b * y)
    point2 = (a * y) + (b * z)
    return point1 % p, point2 % p
    
def generate_keypair(size=SIZE, points=POINTS):
    private_key = generate_private_key(size)
    public_key = generate_public_key(private_key, points)
    return public_key, private_key

def key_agreement(public_key, private_key, p=P):
    x, y, z = private_key
    a, b = public_key
    return ((a * x) + (b * y)) % p       
    
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
    test_key_agreement("keyagreement9", generate_keypair, key_agreement, iterations=10000)

if __name__ == "__main__":
    test_key_agreement()
    