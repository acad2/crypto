from crypto.utilities import big_prime, modular_inverse, gcd

def generate_random_rsa_modulus(size_in_bytes):
    print "Generating p..."
    prime = big_prime(size_in_bytes)     
    print "Generating q..."
    prime2 = big_prime(size_in_bytes)
    totient = (prime - 1) * (prime2 - 1)
    return prime * prime2, totient
    
def generate_keypair(size_in_bytes, e=65537):            
    assert e >= 3        
    print("Generating RSA keypair...")
    while True:
        modulus, totient = generate_random_rsa_modulus(size_in_bytes)        
        while gcd(e, totient) != 1:
            modulus, totient = generate_random_rsa_modulus(size_in_bytes)
        try:
            d = modular_inverse(e, totient)
        except ValueError: # the prime test is probabilistic
            continue
        else:
            print("...done")
            return e, d, modulus