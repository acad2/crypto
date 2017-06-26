from crypto.utilities import random_integer, big_prime

G = random_integer(32)
N = big_prime(33)
POINT_COUNT = 16

def generate_private_key(q_size=32, e_size=32):
    q = random_integer(q_size)
    e = random_integer(e_size)
    return q, e
    
def generate_public_key(private_key, g=G, points=POINT_COUNT, n=N):
    q, e = private_key
    starting_point = g
    for count in range(points):
        starting_point = ((starting_point * q) + (n * e)) % n
    return starting_point
        
def generate_keypair(q_size=32, e_size=32, g=G):
    private_key = generate_private_key(q_size, e_size)
    public_key = generate_public_key(private_key, g)
    return public_key, private_key
       
def key_agreement(public_key, private_key, g=G, points=POINT_COUNT, n=N):
    q, e = private_key    
    starting_point = public_key
    for count in range(points):
        starting_point = ((starting_point * q) + (n * e)) % n
    return int(format(starting_point, 'b')[:224], 2)
        
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    