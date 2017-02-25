def generate_private_key():
    """ Generates a uniformly random 256 bit private key. """
    return urandom(32)
    
def generate_public_key(encryption_function, key):  
    """ Generate a public key, given a key and an encryption function that outputs ciphertexts that are partially homomorphic. """        
    public_key = []
    location_marker = 0
    bit = 1
    for index, byte in enumerate(range(256)):   
        message = bytearray(32)        
        message[location_marker] = bit
        bit = (bit << 1) & 255
        if not bit:
            location_marker += 1
            bit = 1
        
        ciphertext = encryption_function(message, key)     
        public_key.append(bytes_to_words(ciphertext, 4))
    return public_key
    
def sign(data, private_key):
    """ Sign 256 bits of data using the private key. Produces 256-bit signature. """
    assert len(data) == 32
    signature = data[:]
    secretkey.decrypt(signature, key)
    return signature
    
def verify(data, signature, public_key):
    """ Verify a 256 bit signature using the public key. """
    encrypt(signature, public_key)
    if data == signature:
        return True
    else:
        return False
        

       
def test_sign_verify():
    public_key, private_key = generate_keypair()
    from hashlib import sha256
    digest = sha256("unit test").digest()
    signature = sign(digest, private_key)
    assert verify(digest, signature, public_key)
    
if __name__ == "__main__":
    test_sign_verify()
    