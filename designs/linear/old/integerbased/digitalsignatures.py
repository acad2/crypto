raise NotImplementedError() # does not work with current secret key cipher implementation
# may not work regardless of secret key cipher implementation
#   - homomorphic secret key cipher is weak to known/chosen plaintext attack without randomization
#   - signature scheme can't appear to make use of randomization


from os import urandom

from crypto.utilities import bytes_to_integer

from utilities import addition_subroutine
import secretkey

def generate_private_key():
    """ Generates a private key. """
    return secretkey.generate_key(32)
    
def generate_public_key(encryption_function, key):  
    """ Generate a public key, given a key and an encryption function that outputs ciphertexts that are partially homomorphic. """        
    public_key = []
    location_marker = 0
    bit = 1
    for byte in range(256):   
        message = bytearray(32)        
        message[location_marker] = bit
        bit = (bit << 1) & 255
        if not bit:
            location_marker += 1
            bit = 1
        
        ciphertext = encryption_function(message, key)     
        public_key.append(ciphertext[:])
    return public_key

def generate_keypair(encryption_function=secretkey.encrypt):
    private_key = generate_private_key()
    public_key = generate_public_key(encryption_function, private_key)
    return public_key, private_key
    
def sign(data, private_key, decryption_function=secretkey.decrypt):
    """ Sign 256 bits of data using the private key. Produces 256-bit signature. """
    assert len(data) == 32
    signature = bytearray(data)
    decryption_function(signature, private_key)    
    return signature
    
def verify(data, signature, public_key, modulus=256):
    """ Verify a 256 bit signature using the public key. """
    validator = bytearray(32)        
    for count, byte in enumerate(signature):         
        for bit in range(8):            
            if byte & 1:                       
                addition_subroutine(validator, public_key[(count * 8) + bit], modulus)
            byte >>= 1  
    if validator == data:
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
    