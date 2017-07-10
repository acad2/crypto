def generate_public_key(encryption_function, key):  
    """ Generate a public key, given an encryption function and key that outputs ciphertexts that are partially homomorphic. 
        
        A public key consists of encryptions of the range of numbers 0-255, in order. 
        Encryption consists of (randomly) selecting numbers that sum to the value of the message (represented as an 8-bit byte)
 """        
    public_key = []
    location_marker = 1
    bit = 1
    for index, byte in enumerate(range(256)):   
        message = bytearray(64)
        message[0] = byte
        message[location_marker] = bit
        bit = (bit << 1) & 255
        if not bit:
            location_marker += 1
            bit = 1
        
        ciphertext = encryption_function(message, key)     
        public_key.append(bytes_to_words(ciphertext, 8))
    return public_key
    
def encrypt(data, key, padding=None):
    """ Encrypt 64 bits of data using key. Produces 128-bit ciphertext.
        Ciphertexts are partially homomorphic. """
    
    xor_subroutine(data, key[16:])
    assert len(data) == 16
    keyed_homomorphic_permutation(data, key[:16])   
    xor_subroutine(data, key[16:])    
    return data    
    
def decrypt(data, key):    
    """ Decrypt 64 bits of data from 128-bit ciphertext using key. """
    xor_subroutine(data, key[16:])
    invert_keyed_homomorphic_permutation(data, key[:16])
    xor_subroutine(data, key[16:])
    #padding = data[8:]
    #xor_subroutine(data, padding)
    del data[8:]
    return data[:8]