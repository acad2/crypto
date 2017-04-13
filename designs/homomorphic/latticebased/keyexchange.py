import secretkey

SECRET_SIZE = 32

def generate_private_key(key_generation_function=secretkey.generate_key):
    return key_generation_function()
    
def generate_public_key(private_key, encryption_function=secretkey.encrypt):
    pb1 = encryption_function(0, private_key)
    pb2 = encryption_function(0, private_key)
    return pb1, pb2
    
def generate_keypair():
    private_key = generate_private_key()    
    public_key = generate_public_key(private_key)
    _public_key = randomize_public_key(public_key)
    assert _public_key != public_key
    return _public_key, private_key
    
def exchange_key(random_secret, public_key, r_size=SECRET_SIZE):    
    pb1, pb2 = public_key
    r1, r2 = secretkey.random_integer(r_size), secretkey.random_integer(r_size - 8)
    return ((pb1 * r1) - (pb2 * r2)) + random_secret
    
def recover_key(ciphertext, private_key, decryption_function=secretkey.decrypt):    
    return decryption_function(ciphertext, private_key)
      
from math import log      
def _randomize_key(key, r = lambda: secretkey.random_integer(8)):
    _key = (key * r()) - (key * r()) + (key * r()) + (key * r())           
    while _key < 0 or log(_key, 2) > 1200: # re-roll if it's negative or too big
        _key = (key * r()) - (key * r()) + (key * r()) + (key * r())          
    return _key
    
def randomize_public_key(public_key):
    pub1, pub2 = public_key
    pub1 = _randomize_key(pub1)
    pub2 = _randomize_key(pub2)    
    assert pub1 > 0 and pub2 > 0, (pub1, pub2)
    return pub1, pub2        
        
def test_exchange_key_recover_key():    
    public_key, private_key = generate_keypair()   
    hamming_weight = lambda number: format(number, 'b').count('1')
    print("Public key size : {} + {} = {}".format(hamming_weight(public_key[0]), hamming_weight(public_key[1]), sum(hamming_weight(item) for item in public_key)))
    print("Private key size: {}".format(sum(hamming_weight(item) for item in private_key)))        
    for counter in range(65536):
        message = secretkey.random_integer(32)
        ciphertext = exchange_key(message, public_key)    
        plaintext = recover_key(ciphertext, private_key)
        assert plaintext == message, (counter, plaintext, message)
    print("Transported secret size : {}".format(hamming_weight(ciphertext)))        
    print("key exchange exchange_key/recover_key unit test passed")
    
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
    for number in range(1024 * 8):                
        ciphertext = exchange_key(message, public_key)
        key = recover_key(ciphertext, private_key)
    after = timer()
    ciphertext_size = len(format(ciphertext, 'b'))
    print("Time taken to exchange {} keys: {}".format(number + 1, after - before))
        
if __name__ == "__main__":
    test_exchange_key_recover_key()
    test_exchange_key_time()
    