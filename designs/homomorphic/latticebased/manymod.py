#encrypt:
#    p1m1 + p2m2 + p3m3 + p4m4 + p5m5 + ...
#
#decrypt:
#    p2345 = c % p1
#    p1m1 = c - p2345
#    m1 = p1m1 / p1
#    
#    ...
from math import sqrt

from crypto.utilities import random_integer
   
def generate_key(dimension=8):
    size = 1
    points = [random_integer(size)]
    size *= 2
    for count in range(dimension - 1):
        point = random_integer(size)
        while points[-1] > sqrt(point):
            point = random_integer(size)
        points.append(point)
        size *= 2
    return points
        
def encrypt(message_points, key_points, r_size=32):
    assert len(message_points) == len(key_points) - 1, (len(message_points), len(key_points))    
    ciphertext = sum(message_points[index] * key for index, key in enumerate(key_points[:-1]))
    ciphertext += (key_points[-1] * random_integer(r_size)) # randomization
    return ciphertext
    
def decrypt(ciphertext, key_points):
    message_points = []
    for key in reversed(key_points):
        temp = ciphertext % key
        point = ciphertext - temp
        message_points.append(point / key)
        ciphertext = temp
    return list(reversed(message_points[1:]))
    
def test_encrypt_decrypt():
    key = generate_key()
    m = [2, 5, 11] + ([0] * (len(key) - 4))
    ciphertext = encrypt(m, key)      
    #ciphertext += key[0] * 1
    plaintext = decrypt(ciphertext, key)
    assert plaintext == m, (plaintext, m)
    print("manymod encrypt_decrypt unit test pass")
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        