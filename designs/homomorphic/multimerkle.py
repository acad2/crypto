# "subset product" 
# p1 * p2 * p3 * ... * p5 mod N

# pick a secret set of random primes
# to create a public key:
#    encrypt the primes using a homomorphic cipher that preserves multiplication modulo N
#    for example:
#        private_primes = [ 2,  3,  5,  7, 11, 13]
#        public_numbers = [p1, p2, p3, p4, p5, p6]
#
# to encrypt:
#   choose elements of the public key according the message bits 
#   multiply all of the selected elements together into a single product to produce the ciphertext
#   for example:
#        message_bits =  [ 0,  1,  1,  0,  1]
#        public_primes = [p1, p2, p3, p4, p5]
#        ciphertext =         p2 * p3 * p5   

# to decrypt:
#   decrypt the sum to obtain the product of primes
#   enumerate the secret primes of the private key and
#       - if ciphertext % prime == 0:
#           - set the plaintext bit at the corresponding index to 1
#       otherwise, set the plaintext bit at the corresponding index to 0
from crypto.utilities import big_prime, random_integer, modular_inverse, shuffle, random_bytes, prime_generator

generator = prime_generator()
PRIMES = []
for count in range(1000):
    PRIMES.append(next(generator))
del generator
del count

def generate_private_key(prime_count=1000, key_size=16, modulus_size=66):
    primes = PRIMES[:]
    shuffle(primes, bytearray(random_bytes(len(primes))))
    key = random_integer(key_size)
    modulus = big_prime(modulus_size)
    return primes[:prime_count], key, modulus
    
def generate_public_key(private_key):
    primes, key, modulus = private_key
    return [(key * prime) % modulus for prime in primes]
    
def generate_keypair(prime_count=32, prime_size=4):
    private_key = generate_private_key(prime_count, prime_size)
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def _to_bits(integer, bit_size):
    return format(integer, 'b').zfill(bit_size)    
    
def verify(message, public_key, message_size=4):
    ciphertext = 1    
    for index, bit in enumerate(_to_bits(message, message_size * 8)):
        if bit == '1':
            ciphertext *= public_key[index]
        #else:
        #    ciphertext *= 1
    return ciphertext
    
def sign(ciphertext, private_key, message_size=4):    
    primes, key, modulus = private_key
    ciphertext = (modular_inverse(key, modulus) * ciphertext) % modulus
    
    plaintext_bits = ['0'] * (message_size * 8)  
    for count in range(2):
        for index, prime in enumerate(reversed(primes)):
            if ciphertext % prime == 0:   
                print "Setting bit: ", index, prime
                plaintext_bits[index] = '1'
                ciphertext = (ciphertext * modular_inverse(prime, modulus)) % modulus
            else:
                print "Prime not in ciphertext", prime
            
    return int(''.join(plaintext_bits), 2)

def test_sign_verify():
    print("Generating keypair...")
    public_key, private_key = generate_keypair()
    print("...done.")
    for message in range(1, 256):
        message = hash(message)
        signature = sign(message, private_key)
        plaintext = verify(signature, public_key)
        assert plaintext == message, (plaintext, message)
        
if __name__ == "__main__":
    test_sign_verify()




# subset sum where you encode information as the # of terms summed
