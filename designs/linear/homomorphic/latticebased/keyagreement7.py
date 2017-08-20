from crypto.utilities import big_prime, random_integer

SIZE = 32
P = big_prime(SIZE + 1)
DIMENSION = 4
POINTS = [random_integer(32) for count in range(DIMENSION)]

def f(a, b, c, d, p=P):
    a = (a + b) % p
    c = (c + d) % p
    b = (b + c) % p
    d = (d + a) % p
    return a, b, c, d
    
# g(a, b, c, d):
#   a = f(a, b)
#   c = f(c, d)
#   b = f(b, c)
#   d = f(d, a)

def shortcut_f(a, b, c, d, iterations):
    raise NotImplementedError()
    #  a  b 0c 0d
    # 0a  b  c  d
    # 0a 0b  c  d
    #  a  b 0c  d
    
    #  a 2b  c  d
    #  a  b  c 2d
    #  a 2b 2c 3d
    # 2a 3b  c 2d
    
    # 2a 4b 3c 4d   
    # 3a 4b 2c 4d
    # 4a 6b 4c 7d
    # 4a 7b 4c 6d
    
    # 5a 8b 5c 8d
    # 11a 17b 10c 17d
    # 8a 13b 8c 13d
    # 9a 15b 9c 14d
    
def generate_private_key(size=SIZE, dimension=DIMENSION):
    return random_integer(1)
    #if random_integer(1) & 1:
    #    return [1, 2, 1, 1, 1, 1, 1, 2, 1, 2, 2, 3, 2, 3, 1, 2]
    #else:
    #    return [2, 4, 3, 4, 3, 4, 2, 4, 4, 6, 4, 7, 4, 7, 4, 6]
    #return [random_integer(size) for count in range(dimension ** 2)]
        
def function(private_key, points=POINTS, p=P, dimension=DIMENSION, f=f, cache={}):
    try:
        return cache[(private_key, str(points))]
    except KeyError:
        pass
    assert dimension == 4
    a, b, c, d = points
    for step in range(private_key):
        a, b, c, d = f(a, b, c, d, p)
    cache[(private_key, str(points))] = a, b, c, d
    return a, b, c, d
    
    #return [sum(private_key[index] * points[index] for index in range(dimension)),
    #        sum(private_key[4 + index] * points[index] for index in range(dimension)),
    #        sum(private_key[8 + index] * points[index] for index in range(dimension)),
    #        sum(private_key[12 + index] * points[index] for index in range(dimension))]
        
def generate_public_key(private_key, points=POINTS, p=P, dimension=DIMENSION):
    return function(private_key, points, p, dimension)    
        
def generate_keypair(size=SIZE, dimension=DIMENSION, points=POINTS, p=P):
    private_key = generate_private_key(size, dimension)
    public_key = generate_public_key(private_key, points, p)
    return public_key, private_key
    
def key_agreement(public_key, private_key, points=POINTS, p=P, dimension=DIMENSION):    
    return function(private_key, public_key, p, dimension)
    
def test_key_agreement():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    
    secret1 = key_agreement(public2, private1)
    secret2 = key_agreement(public1, private2)
    assert secret1 == secret2, (secret1, secret2)#('\n'.join(('\n' + format(number, 'b')[:80] for number in (secret1, secret2))))
    print("Public1: {}".format(public1))
    print("Public2: {}".format(public2))
    print("secret : {}".format(secret1))
    #a, b = public1[0], public2[0]
    #print("{}".format(format(a, 'b').zfill(80)[:80]))
    #print("{}".format(format(b, 'b').zfill(80)[:80]))
    #print("{}".format(format((a + b) % P, 'b').zfill(80)[:80]))
    #print("{}".format(format(secret1[0], 'b').zfill(80)[:80]))
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement7", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    
    
    