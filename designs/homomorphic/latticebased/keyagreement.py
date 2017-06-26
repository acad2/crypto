from crypto.utilities import random_integer, big_prime

G = random_integer(32)
N = random_integer(33)
POINT_COUNT = 16

def random_walk(starting_point, directions, point_count, n=N):
    q, e = directions   
    current_location = starting_point
    for count in range(point_count):
        current_location = ((current_location * q) + (n * e)) % n
    return current_location
    
def generate_private_key(q_size=32, e_size=32):
    q = random_integer(q_size)
    e = random_integer(e_size)
    return q, e
    
def generate_public_key(private_key, g=G, point_count=POINT_COUNT, n=N):
    return random_walk(g, private_key, point_count, n)
        
def generate_keypair(q_size=32, e_size=32, g=G, point_count=POINT_COUNT, n=N):
    private_key = generate_private_key(q_size, e_size)
    public_key = generate_public_key(private_key, g, point_count, n)
    return public_key, private_key
       
def key_agreement(public_key, private_key, point_count=POINT_COUNT, n=N):
    return random_walk(public_key, private_key, point_count, n)
        
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    