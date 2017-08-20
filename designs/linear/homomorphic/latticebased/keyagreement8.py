# a += b
# b += a 

# a + b
# a + 2b

# 2a + 3b
# 3a + 5b

# 5a + 8b
# 8a + 13b

# 13a + 21b
# 21a + 34b
from crypto.utilities import random_integer, big_prime

SIZE = 32
POINTS = random_integer(SIZE), random_integer(SIZE)
P = big_prime(33)

from math import sqrt
def fib_f(n):
    def fib_inner(n):
        if n == 0:
            return 0, 2
        m = n >> 1
        # q = 2*(-1)**m
        q = -2 if (m & 1) == 1 else 2
        u, v = fib_inner(m)
        u, v = u * v, v * v - q
        if n & 1 == 1:
            # u, v of 2m+1
            u1 = (u + v) >> 1
            return u1, 2*u + u1
        else:
            # u, v of 2m
            return u, v

    if n <= 0:
        return 0
    # the outermost loop is unrolled
    # to avoid calculating an unnecessary v
    m = n >> 1
    u, v = fib_inner(m)
    if n & 1 == 1:
        # u of m+1
        u1 = (u + v) >> 1
        # u of 2m+1
        return u*u + u1*u1
    else:
        # u of 2m
        return u * v
        
def fib_generator(start=None):        
    assert start is not None    
    x = fib_f(start)
    y = fib_f(start + 1)    
    z = x + y
    while x == y or x == z:
        x = fib_f(start)
        start += 1
        y = fib_f(start)
        start += 1    
    return x, y, z
    
def generate_private_key(size=SIZE):
    #x, y, z = fib_generator(start=random_integer(size))
    x, y = random_integer(size), random_integer(size)
    z = x + y
    return x, y, z
    
def generate_public_key(private_key, points=POINTS, p=P):
    x, y, z = private_key
    a, b = points
    point1 = (a * x) + (b * y)
    point2 = (a * y) + (b * z)
    return point1 % p, point2 % p
    
    # am + bn
    # an + bo
    
    # ax + by
    # ay + bz
    
    # m(ax + by)  max + mby
    # n(ay + bz)  nay + nbz
    # x(am + bn)  max + xbn
    # y(an + bo)  nay + ybo
    
    #ybo == nbz
    #ybm + n = x + y bn
    
def generate_keypair(size=SIZE, points=POINTS):
    private_key = generate_private_key(size)
    public_key = generate_public_key(private_key, points)
    return public_key, private_key

def key_agreement(public_key, private_key, p=P):
    x, y, z = private_key
    a, b = public_key
    s1 = (a * x) + (b * y)
    s2 = (a * y) + (b * z)
    return s1 % p, s2 % p
    
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
    test_key_agreement("keyagreement8", generate_keypair, key_agreement, iterations=10000)

if __name__ == "__main__":
    test_key_agreement()
    