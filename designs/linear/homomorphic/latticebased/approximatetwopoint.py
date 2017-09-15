# ax + by + e1
# ay + bx + e2

# as + bt + e3
# at + bs + e4

# sax + sby + tay + tbx + se1 + te2
# sax + tbx + tay + sby + xe3 + ye4
from crypto.utilities import random_integer

SECURITY_LEVEL = 32
POINTS = [random_integer(SECURITY_LEVEL) for count in range(2)]

def generate_private_key(security_level=SECURITY_LEVEL):
    x = random_integer(security_level)
    y = random_integer(security_level)
    return x, y
    
def generate_public_key(private_key, points=POINTS, security_level=SECURITY_LEVEL):
    a, b = points
    x, y = private_key
    e1, e2 = random_integer(security_level), random_integer(security_level)
    return ((a * x) + (b * y) + e1,
            (a * y) + (b * x) + e2)
           
def generate_keypair(security_level=SECURITY_LEVEL, points=POINTS):
    private_key = generate_private_key(security_level)
    public_key = generate_public_key(private_key, points, security_level)
    return public_key, private_key
    
def key_agreement(public_key, private_key):
    a, b = public_key
    x, y = private_key
    n = (a * x) + (b * y)
    return int(format(n, 'b')[:233], 2)
    
def test_key_agreement():
    from unittesting import test_key_agreement
    test_key_agreement("approximatetwopoint", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    