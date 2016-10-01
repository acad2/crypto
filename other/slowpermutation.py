import hashlib
from timeit import default_timer as timestamp
from pride.crypto.utilities import slide, brute_force
        
def tunable_hash(data, key, work_factor, algorithm="sha224"):
    return hashlib.pbkdf2_hmac(algorithm, data, key, work_factor)
    
def encrypt(data, key, iv, work_factor=1, hash_function=tunable_hash):
    """ usage: encrypt(data, key, iv, work_factor=1, 
                       hash_function=tunable_hash) => ciphertext
                       
        Encrypt data in a way that decryption takes significantly more computational
        expense then encryption, based on work_factor. 
            - Incrementing work factor increases decryption cost exponentially
        
        Ciphertext will be (len(data) / work_factor) * digest_size bytes in size. """
    ciphertext = b''
    cumulative_input = b''
    
    for data_bytes in slide(data, work_factor):        
        output = hash_function(key + iv + cumulative_input + data_bytes)
        ciphertext += output
        cumulative_input += data_bytes
    
    return ciphertext
    
def decrypt(ciphertext, key, iv, work_factor=1, hash_function=tunable_hash):
    """ usage: decrypt(ciphertext, key, iv, work_factor,
                       hash_function=tunable_hash) => plaintext
                       
        Slow decryption function for corresponding fast(er) encryption function.
            - Incrementing work factor increases decryption cost exponentially"""
    plaintext = b''    
    
    test_bytes = [bytes(bytearray(range(256))) for factor in range(work_factor)]    
    block_size = len(hash_function(''))
    
    for ciphertext_bytes in slide(ciphertext, block_size):        
        data_bytes = brute_force(ciphertext_bytes, hash_function, test_bytes, 
                                 prefix=key + iv + plaintext)                                 
        plaintext += data_bytes[-work_factor:]               
    
    return plaintext
  
def encrypt2(data, iv, key, work_factor1=1, hash_function=tunable_hash):
    """ usage: encrypt2(plaintext, iv, key, work_factor1=1, 
                        hash_function=tunable_hash) => ciphertext
        
        Tunably slow encryption function, with corresponding decryption function.
        This function is made exponentially slower via incrementing work_factor1:
            - Small changes will increase time required to encrypt considerably
            - Can use a slow hash such as pbkdf2_hmac for more fine grained tuning
        
        The corresponding decryption function is (relatively) fast
            - decryption performance is effectively unmodified regardless of work factor.
        
        Ciphertext will be (len(data) / work_factor) * digest_size bytes in size"""
    output = b''
    state = iv
    _looking_for = list(data)
    looking_for = ''.join(_looking_for.pop(0) for factor in range(work_factor1))    
    while True:        
        current_hash = hash_function(key + state)
        state += current_hash
        while current_hash[:work_factor1] != looking_for:
            hash_input = current_hash
            current_hash = hash_function(hash_input)
            state += current_hash
        output += hash_input
        try:
            looking_for = ''.join(_looking_for.pop(0) for factor in range(work_factor1))
        except IndexError:
            break
    
    return output
            
def decrypt2(ciphertext, iv, key, work_factor1=1, hash_function=tunable_hash):
    """ usage: decrypt2(ciphertext, iv, key, work_factor1=1,
                        hash_function=tunable_hash) => plaintext
                        
        Fast decryption function for corresponding slow encryption function. 
        work_factor1 has effectively no influence on computation time."""
    digest_size = len(hash_function(''))   
    plaintext = b''
    for hash_input in slide(ciphertext, digest_size):                
        plaintext += hash_function(hash_input)[:work_factor1]
    return plaintext               
                
def test_encrypt_decrypt():
    message = "Testing!"
    key = "\x00" * 16
    iv = "\x00" * 16    
    work_factor = 2 
    work_factor2 = 1
    hash_function = lambda data: tunable_hash(data, key, work_factor2)
    
    start = timestamp()
    ciphertext = encrypt(message, key, iv, work_factor, hash_function)
    encryption_time = timestamp() - start
    
    print "Testing fast encrypt/slow decrypt: "
    print "Plaintext size: ", len(message)
    print "Ciphertext size: ", len(ciphertext)
    
    start = timestamp()
    plaintext = decrypt(ciphertext, key, iv, work_factor, hash_function)
    decryption_time = timestamp() - start
    assert plaintext == message
    
    print "Encryption time: ", encryption_time
    print "Decryption time: ", decryption_time

def test_encrypt_decrypt2():
    data = "Testing!"
    iv = "\x00" * 16
    key = "\x00" * 16
    work_factor1 = 2
    work_factor2 = 1
    hash_function = lambda data: tunable_hash(data, key, work_factor2)
    start = timestamp()
    ciphertext = encrypt2(data, iv, key, work_factor1, hash_function)
    time_required = timestamp() - start
    print("Testing slow encrypt/fast decrypt: ")
    print( "Plaintext size: {}".format(len(data)))
    print("Ciphertext size: {}".format(len(ciphertext)))    
    print("Time taken to encrypt plaintext:  {}".format(time_required))
    
    start = timestamp()
    plaintext = decrypt2(ciphertext, iv, key, work_factor1, hash_function)
    print "Time taken to decrypt ciphertext: {}".format(timestamp() - start)    
    assert plaintext == data
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    test_encrypt_decrypt2()
    