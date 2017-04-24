from os import urandom
from crypto.utilities import big_prime, modular_inverse, random_integer, gcd, bytes_to_integer, integer_to_bytes

def generate_keypair_for_e(size_in_bytes, e=None):            
    if e is None:
        raise ValueError("e not supplied")
    print("Generating keypair...")
    while True:
        prime = big_prime(size_in_bytes)                            
        totient = prime - 1    
        while e >= prime and gcd(e, totient) != 1:
            prime = big_prime(size_in_bytes)
        try:
            d = modular_inverse(e, totient)
        except ValueError: # the prime test is probabilistic
            continue
        else:
            print("...done")
            return e, d, prime
            
def encrypt(data, e, p):
    return pow(data, e, p)

def decrypt(data, d, p):    
    return pow(data, d, p) 
          
def test_identity_encrypt():
    bobs_identity = bytes_to_integer(bytearray("Bob"))
    message = bytes_to_integer(bytearray(urandom(3)))
    public_key, private_key, prime = generate_keypair_for_e(8, e=bobs_identity)
    
    ciphertext = encrypt(message, public_key, prime)
    plaintext = decrypt(ciphertext, private_key, prime)
    assert plaintext == message, (plaintext, message)
    
    print("Identity  : {}".format(bobs_identity))
    print("Prime     : {}".format(prime))
    print("d exponent: {}".format(private_key))
    print("Ciphertext: {}".format(ciphertext))
    
if __name__ == "__main__":
    test_identity_encrypt()    