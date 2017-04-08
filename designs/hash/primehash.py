from crypto.utilities import prime_generator

def generate_primes(count):
    generator = prime_generator()
    prime = next(generator)
    yield prime
    _prime = next(generator)
    for number in range(count - 1):
        while _prime < (prime ** 2):
            _prime = next(generator)
        prime = _prime
        yield prime
        
def prime_hash(message_bytes, rounds=1):
    # p1m1 + p2m2 + p3m3 + p4m4
    
    output = 1
    generator = prime_generator()
    prime = reversed([next(generator) for count in range(len(message_bytes) * 2)][::2])
    for round in range(rounds):
        for index, hash_input in enumerate(bytearray(message_bytes)):            
            output += (next(prime) * hash_input * (index + 1))
            print output
            #output += output
    return output
    