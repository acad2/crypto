from os import urandom

from crypto.utilities import prime_generator, gcd, bytes_to_words, bytes_to_integer, choice

generator = prime_generator()
PRIMES = [next(generator) for count in range(256)]
INVERT_PRIMES = dict()
for index, prime in enumerate(PRIMES):
    INVERT_PRIMES[prime] = index    
del generator

def random_word(wordsize=1):
    return bytes_to_integer(bytearray(urandom(wordsize)))
    
def encrypt(data, key, primes=PRIMES):
    ciphertext = []
    for index, word in enumerate(bytearray(data)):
        randomized1 = primes[word] * primes[random_word()]
        randomized2 = primes[word] * primes[random_word()]
        assert gcd(randomized1, randomized2) == primes[word] # random_word will output word for both values every so often
        _randomized1 = randomized1
        randomized1 = choice(key[index], randomized1, randomized2)
        randomized2 = choice(key[index], randomized2, _randomized1)
        ciphertext.append((randomized1, randomized2))
    return ciphertext
    
def decrypt(ciphertext, key):
    plaintext = bytearray()
    for index, _ciphertext in enumerate(ciphertext):
        randomized1, randomized2 = _ciphertext
        _randomized1 = randomized1
        randomized1 = choice(key[index], randomized1, randomized2)
        randomized2 = choice(key[index], randomized2, _randomized1)
        plaintext.append(INVERT_PRIMES[gcd(randomized1, randomized2)])
    return plaintext   
        
def test_encrypt_decrypt():
    message = "Testing!"
    key = bytes_to_words(bytearray(urandom(32)), 2)
    ciphertext = encrypt(message, key)
    print ciphertext
    plaintext = decrypt(ciphertext, key)
    assert plaintext == message, plaintext
       
if __name__ == "__main__":
    test_encrypt_decrypt()
    