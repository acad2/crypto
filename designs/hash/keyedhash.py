import struct

from crypto.utilities import slide, xor_subroutine, integer_to_bytes, rotate_left
from crypto.persistence import save_data, load_data

STATE_BITS = 256
WORDSIZE = 8
STATE_SIZE = STATE_BITS / WORDSIZE

with open("keyedhashkey.bin", "a+b") as _file:
    HASH_KEY = _file.read()    
    if not HASH_KEY or len(HASH_KEY) / STATE_SIZE != 256:
        from os import urandom
        HASH_KEY = urandom(STATE_SIZE * 256)
        _file.truncate(0)
        _file.write(HASH_KEY)             
    HASH_KEY = [bytearray(block) for block in slide(HASH_KEY, STATE_SIZE)]    
            
def pad_input(hash_input, post_processing_steps): 
    hash_input += chr(post_processing_steps)
    input_size = len(hash_input)
    padding = (4 - (input_size % 4)) - 1    
    hash_input += ("\x00" * padding) + "\x80" # chr(128) 0b1000 0000
    hash_input += struct.pack("Q", input_size)
    return bytearray(hash_input)
              
    hash_input += chr(128)
    input_size = len(hash_input) + 8 # + 8 for 64 bits for the size bytes at the end
    padding = size - (input_size % size)
    hash_input += ("\x00" * padding) + (struct.pack("Q", input_size)) 
    assert not len(hash_input) % size, (len(hash_input), size)
    return hash_input
    
def _hash(output, data, hash_key=HASH_KEY):    
    for index in range(len(data)):                        
        byte8 = rotate_left(data[index], 1, 8) #^ (index % 256)
        byte8 ^= output[(index + 1) % STATE_SIZE]
        output[index % STATE_SIZE] ^= byte8        
        xor_subroutine(output, hash_key[output[index % STATE_SIZE]])       
    #for a, b, c, d in slide(data, 4):
    #    key = 0
    #    key ^= rotate_left(output[0], 1, 8)
    #    key ^= rotate_left(output[1], 2, 8)
    #    key ^= rotate_left(output[2], 3, 8)
    #    key ^= rotate_left(output[3], 4, 8)
    #    xor_subroutine(output, hash_key[key ^ rotate_left(a, 1, 8)])
    #    xor_subroutine(output, hash_key[key ^ rotate_left(b, 2, 8)])
    #    xor_subroutine(output, hash_key[key ^ rotate_left(c, 3, 8)])
    #    xor_subroutine(output, hash_key[key ^ rotate_left(d, 4, 8)])
       
       
       
def output_transformation(output, data, hash_key=HASH_KEY, post_processing_steps=STATE_SIZE):        
    rounds, extra = divmod(post_processing_steps, STATE_SIZE)
    for round in range(rounds):
        _hash(output, output, hash_key)
    if extra:
        _hash(output, output[:extra], hash_key)
        
def hash_function(data, hash_key=HASH_KEY, post_processing_steps=STATE_SIZE):        
    data = pad_input(data, post_processing_steps)    
    output = bytearray(STATE_SIZE)        
    _hash(output, data, hash_key) 
    output_transformation(output, data, hash_key, post_processing_steps)
    return bytes(output)                
                  
def encrypt(data, key, nonce, additional_data='', post_processing_steps=STATE_SIZE):
    data = bytearray(data)
    key = bytearray(key)
    nonce = bytearray(nonce)
    tag = authenticated_stream_cipher(data, key, nonce, additional_data, post_processing_steps)    
    return save_data(nonce, additional_data, data, tag, post_processing_steps)
    
def decrypt(cryptogram, key):
    nonce, additional_data, data, tag, post_processing_steps = load_data(cryptogram)
    if authenticated_stream_cipher_decrypt(data, key, nonce, additional_data, tag, post_processing_steps):
        return data, additional_data
    else:
        return None, None
                
def store(data, block, index):
    data[(index * STATE_SIZE):((index + 1) * STATE_SIZE)] = block 
    
def authenticated_stream_cipher(data, key, nonce, additional_data='', post_processing_steps=STATE_SIZE):
    hash_input = key + nonce + additional_data    
    for index, block in enumerate(slide(data, STATE_SIZE)):
        key_stream = bytearray(hash_function(hash_input, post_processing_steps=post_processing_steps))
        xor_subroutine(block, key_stream)
        store(data, block, index)
        hash_input = key + nonce + block
    return hash_function(hash_input, post_processing_steps=post_processing_steps)
 
def authenticated_stream_cipher_decrypt(data, key, nonce, additional_data, tag, post_processing_steps):
    hash_input = key + nonce + additional_data    
    for index, block in enumerate(slide(data, STATE_SIZE)):
        key_stream = bytearray(hash_function(hash_input, post_processing_steps=post_processing_steps))
        hash_input = key + nonce + block
        xor_subroutine(block, key_stream)
        store(data, block, index)
    if hash_function(hash_input, post_processing_steps=post_processing_steps) == tag:
        return True
    else:
        return False
                      
def test_authenticated_stream_cipher():
    message = bytearray("I love you :)" * 10)
    _message = message[:]
    key = "\x00" * 16
    nonce = "\x00" * 16
    data = "Why not!"
    post_processing_steps = 1
    tag = authenticated_stream_cipher(message, key, nonce, data, post_processing_steps)    
    assert authenticated_stream_cipher_decrypt(message, key, nonce, data, tag, post_processing_steps)        
    assert message == _message              
                        
def test_encrypt_decrypt():
    key = "\x00" * 16
    nonce = "\x00" * 16
    data = "A most excellent test message! :)"
    additional_data = "Well, integrity is a good thing."
    cryptogram = bytearray(encrypt(data, key, nonce, additional_data))
    _cryptogram = cryptogram[:]
    cryptogram[48] = 11    
    plaintext, _additional_data = decrypt(bytes(cryptogram), key)
    assert (plaintext, _additional_data) != (data, additional_data), ((plaintext, _additional_data), (data, additional_data))                        
    plaintext, _additional_data = decrypt(bytes(_cryptogram), key)
    assert (plaintext, _additional_data) == (data, additional_data), ((plaintext, _additional_data), (data, additional_data))
    
def test_encrypt_metrics():
    from crypto.analysis.metrics import test_stream_cipher, PERFORMANCE_TEST
    print "Testing metrics of encryption algorithm"
    test_stream_cipher(encrypt, "\x00" * 16, "\x00" * 16, performance_test_sizes=(1500, 4096), **PERFORMANCE_TEST)
    
def test_authenticated_stream_cipher_metrics():
    from crypto.analysis.metrics import test_stream_cipher, PERFORMANCE_TEST
    print "Testing metrics of encryption algorithm"
    def test_algorithm(data, key, nonce):
        data = bytearray(data)
        authenticated_stream_cipher(data, key, nonce, post_processing_steps=0)
        return bytes(data)
    test_stream_cipher(test_algorithm, "\x00" * 16, "\x00" * 16, performance_test_sizes=(1500, 4096), **PERFORMANCE_TEST)
    
def test_hash_function_metrics(): 
    print "Testing metrics of hash function"
    from crypto.analysis.metrics import test_hash_function, PERFORMANCE_TEST       
    #key = []
    #index = 0
    #bit = 1
    #for byte in range(256):
    #    entry = bytearray(STATE_SIZE)        
    #    entry[index] = bit
    #    bit <<= 1
    #    bit &= 255        
    #    if not bit:
    #        index += 1
    #        bit = 1
    #    key.append(entry)
        
    test_hash_function(lambda data: hash_function(data), avalanche_test=False, randomness_test=False, period_test=False)#, bias_test=False)#, compression_test=False, performance_test=False)
    
if __name__ == "__main__":
    #test_encrypt_decrypt()    
    #test_authenticated_stream_cipher()
    test_hash_function_metrics()        
    #test_authenticated_stream_cipher_metrics()
    