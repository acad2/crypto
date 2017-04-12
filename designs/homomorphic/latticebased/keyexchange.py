import secretkey

def generate_private_key(key_generation_function=secretkey.generate_key):
    return key_generation_function()
    
def generate_public_key(private_key, encryption_function=secretkey.encrypt):
    pb1 = encryption_function(0, private_key)
    pb2 = encryption_function(0, private_key)
    return pb1, pb2
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def exchange_key(random_secret, public_key, r_size=24):
    pb1, pb2 = public_key
    r1, r2 = secretkey.random_integer(r_size), secretkey.random_integer(r_size)
    return (pb1 * r1) + (pb2 * r2) + random_secret
    
def recover_key(ciphertext, private_key, decryption_function=secretkey.decrypt):
    return decryption_function(ciphertext, private_key)
    
def test_exchange_key_recover_key():    
    public_key, private_key = generate_keypair()
    message = 1
    for message in range(256):
        ciphertext = exchange_key(message, public_key)    
        plaintext = recover_key(ciphertext, private_key)
        assert plaintext == message, (plaintext, message)
    
    hamming_weight = lambda number: format(number, 'b').count('1')
    print("key exchange exchange_key/recover_key unit test passed")
    print("Public key size : {}".format(sum(hamming_weight(item) for item in public_key)))
    print("Private key size: {}".format(sum(hamming_weight(item) for item in private_key)))
    print("Secret size : {}".format(hamming_weight(ciphertext)))
    
def test_exchange_key_time():
    from timeit import default_timer as timer
    print "Calculating time to generate keypair... "    
    before = timer()
    for number in range(1024):
        public_key, private_key = generate_keypair()
    after = timer()
    print("Time taken to generate keypair: {}".format((after - before) / number))
    before = timer()
        
    message = 1
    for number in range(1024 * 16):                
        ciphertext = exchange_key(message, public_key)
        key = recover_key(ciphertext, private_key)
    after = timer()
    ciphertext_size = len(format(ciphertext, 'b'))
    print("Time taken to exchange {} keys: {}".format(number + 1, after - before))
        
if __name__ == "__main__":
    test_exchange_key_recover_key()
    test_exchange_key_time()
    