# a += b   ab    abbcd
# c += d   cd    abcdd
# b += c   bcd   abbccddd
# d += a   dab   aabbbcdd

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



from crypto.utilities import big_prime, random_integer
# am bn co dp
# aw bx cy dz

SIZE = 32
P = big_prime(SIZE + 1)
DIMENSION = 4
POINTS = [random_integer(32) for count in range(DIMENSION)]

def generate_private_key(size=SIZE, dimension=DIMENSION):
    return [random_integer(size) for count in range(dimension)]
    
def generate_public_key(private_key, points=POINTS, p=P):
    return sum(private_key[index] * points[index] for index in range(len(points))) % p
    
def generate_keypair(size=SIZE, dimension=DIMENSION, points=POINTS, p=P):
    private_key = generate_private_key(size, dimension)
    public_key = generate_public_key(private_key, points, p)
    return public_key, private_key
    
def key_agreement(public_key, private_key, points=POINTS, p=P):    
    key = public_key
    for index, value in enumerate(private_key):
        key += points[index] * value
    return key % p
    
def test_key_agreement():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    
    secret1 = key_agreement(public2, private1)
    secret2 = key_agreement(public1, private2)
    assert secret1 == secret2
    print("Public1: {}".format(public1))
    print("Public2: {}".format(public2))
    print("secret : {}".format(secret1))
    
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement6", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    
    
    