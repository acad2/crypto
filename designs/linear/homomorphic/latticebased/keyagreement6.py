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


# 2(5a 8b 5c 8d)    4(11a 17b 10c 17d)   3(8a 13b 8c 13d)     4(9a 15b 9c 14d)        
# 10a 16b 10c 16d     44a 68b 40c 68b      24a 39b 24c 39d    36a 60b 36c 56d   = 114a 183b 110c 179d

# 5(2a 4b 3c 4d)    8(3a 4b 2c 4d)   5(4a 6b 4c 7d)  8(4a 7b 4c 6d)
# 10a 20b 15c 20d     24a 32b 16c 32d    20a 30b 20c 35d   32a 56b 32c 48d      = 86a 138b 83c 135d



#10a 16b 10c 16d
#44a 68b 40c 68d
#24a 39b 24c 39d
#36a 60b 36c 56d

# 5(2a 4b 3c 4d)          10a 20b 15c 20d
# 8(3a 4b 2c 4d)          24a 32b 16c 32d
# 5(4a 6b 4c 7d)          20a 30b 20c 35d
# 8(4a 7b 4c 6d)          32a 56b 32c 48d


# 5(2a 4b 3c 4d)  8(



from crypto.utilities import big_prime, random_integer
# am bn co dp
# aw bx cy dz

# m(aw bx cy dz)     n(aw bx cy dz)   o(aw bx cy dz)    p(aw bx cy dz)
# maw mbx mcy mdz   naw nbx ncy ndz   oaw obx ocy odz   paw pbx pcy pdz
# aw(m n o p)   bx(m n o p)   cy(m n o p)  dz(m n o p)
# m n o p (aw bx cy dz)

# w(am bn co dp)  x(am bn co dp)  y(am bn co dp)  z(am bn co dp)
# am(w x y z) bn(w x y z) co(w x y z) dp(w x y z)
# 

SIZE = 32
P = big_prime(SIZE + 1)
DIMENSION = 4
POINTS = [random_integer(32) for count in range(DIMENSION)]

def generate_private_key(size=SIZE, points, dimension=DIMENSION):
    return [random_integer(size) for count in range(dimension)]
    
def mul(values):    
    output = 1    
    for value in values:
        output *= value
    return output
        
def generate_public_key(private_key, points=POINTS, p=P):
    return sum(private_key[index] * points[index] for index in range(len(points))) % p
    #return mul(pow(points[index], private_key[index], p) for index in range(len(points))) % p
    
def generate_keypair(size=SIZE, dimension=DIMENSION, points=POINTS, p=P):
    private_key = generate_private_key(size, dimension)
    public_key = generate_public_key(private_key, points, p)
    return public_key, private_key
    
def key_agreement(public_key, private_key, points=POINTS, p=P):    
    return (sum(private_key) * public_key) % p
    
    for index, value in enumerate(private_key):
        key += value
        #key += points[index] * value
        key = (key * pow(points[index], value, p)) % p
    return key % p
    
def test_key_agreement():
    public1, private1 = generate_keypair()
    public2, private2 = generate_keypair()
    
    secret1 = key_agreement(public2, private1)
    secret2 = key_agreement(public1, private2)
    assert secret1 == secret2, ('\n'.join(('\n' + format(number, 'b')[:80] for number in (secret1, secret2))))
    print("Public1: {}".format(public1))
    print("Public2: {}".format(public2))
    print("secret : {}".format(secret1))
    
    from unittesting import test_key_agreement
    test_key_agreement("keyagreement6", generate_keypair, key_agreement, iterations=10000)
    
if __name__ == "__main__":
    test_key_agreement()
    
    
    