from math import log  

import secretkey

__all__ = ["generate_keypair", "randomize_public_key", "exchange_key", "recover_key",
           "generate_private_key", "generate_public_key"]
           
SECRET_SIZE = 32

def generate_private_key(key_generation_function=secretkey.generate_key):
    """ usage: generate_private_key(key_generation_function=secretkey.generate_key) => private_key
    
        Generates a private key, which is the key for a secret key homomorphic cipher. """
    return key_generation_function()
    
def generate_public_key(private_key, encryption_function=secretkey.encrypt):
    """ usage: generate_public_key(private_key, 
                                   encryption_function=secretkey.encrypt) => public_key
                                   
        Returns two encryptions of 0, suitable for use as a public key. """
    pb1 = encryption_function(0, private_key)
    pb2 = encryption_function(0, private_key)
    return pb1, pb2
    
def generate_keypair():
    """ usage: generate_keypair(): => public_key, private_key
    
        Generates a public key and a private key.
        A public key consists of 2 different numbers, which are both homomorphic encryptions of 0.
        The nature of the private key depends on the secret key cipher that is used to instantiate the scheme. """
    private_key = generate_private_key()    
    public_key = generate_public_key(private_key)
    _public_key = randomize_public_key(public_key)
    assert _public_key != public_key
    return _public_key, private_key
    
def exchange_key(random_secret, public_key, r_size=SECRET_SIZE): 
    """ usage: exchange_key(random_secret, public_key,
                            r_size=SECRET_SIZE) => encrypted random_secret
                            
        Creates a ciphertext from random_secret that only the holder of the private key may recover the plaintext from. """        
    pb1, pb2 = public_key
    r1, r2 = secretkey.random_integer(r_size), secretkey.random_integer(r_size)
    return ((pb1 * r1) + (pb2 * r2)) + random_secret
    
def recover_key(ciphertext, private_key, decryption_function=secretkey.decrypt):    
    """ usage: recover_key(ciphertext, private_key, 
                           decryption_function=secretkey.decrypt) => random_secret
                           
        Returns the random_secret that was encrypted using the public key. """
    return decryption_function(ciphertext, private_key)     
    
def _randomize_key(key, r = lambda: secretkey.random_integer(8)):
    _key = (key * r()) - (key * r()) + (key * r()) + (key * r())           
    while _key < 0 or log(_key, 2) > 1200: # re-roll if it's negative or too big
        _key = (key * r()) - (key * r()) + (key * r()) + (key * r())          
    return _key
    
def randomize_public_key(public_key):    
    """ usage: randomize_public_key(public_key) => randomized public_key
    
        Returns a randomized public key. 
        The resultant public key is still linked with the same private key, but it should not be possible to associate the new public key with the original one. """
    #raise NotImplementedError()
    pub1, pub2 = public_key
    _pub1 = pub1
    pub1 = _randomize_key(pub1 + pub2)
    assert not _pub1 % pub1 or pub1 % _pub1
    _pub2 = pub2
    pub2 = _randomize_key(_pub1 + pub2)    
    assert not _pub2 % pub2 or pub2 % _pub2
    assert pub1 > 0 and pub2 > 0, (pub1, pub2)
    return pub1, pub2        
        
def test_exchange_key_recover_key():    
    public_key, private_key = generate_keypair()   
    hamming_weight = lambda number: format(number, 'b').count('1')
    print("Public key size : {} + {} = {}".format(hamming_weight(public_key[0]), hamming_weight(public_key[1]), sum(hamming_weight(item) for item in public_key)))
    print("Private key size: {}".format(sum(hamming_weight(item) for item in private_key)))        
    ciphertext_size = []
    for counter in range(65536):
        message = secretkey.random_integer(32)
        ciphertext = exchange_key(message, public_key)    
        plaintext = recover_key(ciphertext, private_key)
        assert plaintext == message, (counter, plaintext, message)
        ciphertext_size.append(hamming_weight(ciphertext))
        
    print("Transported secret size : {}".format(sum(ciphertext_size) / float(len(ciphertext_size))))
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
    