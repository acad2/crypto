from os import urandom
from crypto.utilities import big_prime, modular_inverse, random_integer, gcd
    
def generate_random_keypair(size_in_bytes):
    print("Generating keypair...")
    while True:
        prime = big_prime(size_in_bytes)
        e = random_integer(size_in_bytes)
        totient = prime - 1    
        while e >= prime and gcd(e, totient) != 1:
            e = random_integer(size_in_bytes)                
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
                
def test_encrypt_decrypt():
    encryption_key, decryption_key, prime = generate_random_keypair(4)
    print("Encryption key: {}".format(encryption_key))
    print("Decryption key: {}".format(decryption_key))
    print("Prime modulus : {}".format(prime))
        
    message = 11
    ciphertext = encrypt(message, encryption_key, prime)
    plaintext = decrypt(ciphertext, decryption_key, prime)
    assert plaintext == message, (plaintext, message)
    
    message2 = 17
    ciphertext2 = encrypt(message2, encryption_key, prime)
    ciphertext3 = ciphertext2 * ciphertext  
    plaintext3 = decrypt(ciphertext3, decryption_key, prime)
    assert plaintext3 == (message * message2), (plaintext3, message * message2)
    
    #ciphertext4 = ciphertext3 + 1
    #plaintext4 = decrypt(ciphertext4, decryption_key, prime)
    #assert plaintext4 == (message * message2) + 1, (plaintext4, (message * message2) + 1)
    
    message3 = 1
    ciphertext3 = encrypt(message3, encryption_key, prime)
    ciphertext4 = ciphertext3 * ciphertext3
    plaintext4 = decrypt(ciphertext4, decryption_key, prime)
    assert plaintext4 == 1, plaintext4
    
    message5 = 220
    assert message5 < prime
    ciphertext5 = encrypt(message5, encryption_key, prime)
    ciphertext5 *= ciphertext5
    plaintext5 = decrypt(ciphertext5 % prime, decryption_key, prime)
    assert plaintext5 == (220 ** 2) % prime, (plaintext5, (220 ** 2) % prime)
        

    
if __name__ == "__main__":
    test_encrypt_decrypt()
    