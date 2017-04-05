from crypto.utilities import prime_generator

def prime_hash(message_bytes, rounds=2):
    output = 1
    generator = prime_generator()
    for round in range(rounds):
        for hash_input in bytearray(message_bytes):
            prime = next(generator)
            output = (prime * hash_input) + (output + hash_input)
    return output
    