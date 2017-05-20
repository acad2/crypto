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
        
def encrypt(message_points, key_points):
    return sum(message_points[index] * key for index, key in enumerate(key_points))
    
def decrypt(ciphertext, key_points):
    message_points = []
    for key in reversed(key_points):
        temp = ciphertext % key
        point = ciphertext - temp
        message_points.append(point / key)
        ciphertext = temp
    return list(reversed(message_points))
    
def test_encrypt_decrypt():
    key = generate_key()
    m = [2, 5, 11] + ([0] * (len(key) - 4)) + [random_integer(64)]
    ciphertext = encrypt(m, key)
    print ciphertext
    print encrypt([2, 5, 11] + ([0] * (len(key) - 4)) + [random_integer(32)], key)    
    
    ciphertext += key[0] * 1
    plaintext = decrypt(ciphertext, key)
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
        