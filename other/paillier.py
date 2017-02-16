from os import urandom

from crypto.utilities import gcd, modular_inverse, bytes_to_integer, integer_to_bytes  
from random import randrange
  
def not_random_prime():
    # from http://stackoverflow.com/a/21043936/3103584
    while True:
        p = randrange(2 ** 8, 2 ** 9, 2)
        if all(p % n != 0 for n in range(3, int((p ** 0.5) + 1), 2)):
            return p
            
def generate_prime():
    return not_random_prime()
    
def gcd_test(p, q):
    if gcd(p * q, (p - 1) * (q - 1)) == 1:
        return True
    else:
        return False
        
def generate_keypair():
    p, q = generate_prime(), generate_prime()        
    while not gcd_test(p, q):
        p, q = generate_prime(), generate_prime()
    
    n = p * q
    g = n + 1
    _lambda = (p - 1) * (q - 1)    
    mu = modular_inverse(_lambda, n)
    L_function = lambda x: (x - 1) / n
    return (n, g), (_lambda, mu, L_function)
    
def encrypt(message, public_key):
    m = bytes_to_integer(bytearray(message))
    n, g = public_key
    r = bytes_to_integer(bytearray(urandom(len(message))))
    assert m < n, (m, n)
    print "Encrypting?", n, g
    part1 = pow(g, m)
    print "After part1"
    part2 = pow(r, n)
    print "After part2"
    part3 = pow(n, 2)
    print "After part3"
    return (part1 * part2) % part3    
    
def decrypt(ciphertext, public_key, private_key):
    _lambda, mu, L_function = private_key
    n, g = public_key
    print "Decrypting?"
    return integer_to_bytes((L_function(pow(ciphertext, _lambda, n ** 2)) * mu) % n)
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()
    message = "T"
    ciphertext = encrypt(message, public_key)
    print ciphertext
    plaintext = decrypt(ciphertext, public_key, private_key)
    assert plaintext == message, (plaintext[-1], ord(message))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    
        
        