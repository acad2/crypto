import struct

from crypto.utilities import slide, xor_subroutine, integer_to_bytes, rotate_left

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
            
def pad_input(hash_input, size, padding_character=chr(128)):        
    hash_input += padding_character
    input_size = len(hash_input) + 8 # + 8 for 64 bits for the size bytes at the end
    padding = size - (input_size % size)
    hash_input += ("\x00" * padding) + (struct.pack("Q", input_size)) 
    assert not len(hash_input) % size, (len(hash_input), size)
    return hash_input
                                    
def _hash(output, data, hash_key=HASH_KEY):    
    for index in range(len(data)):                
        byte8 = data[index]         
        byte8 ^= rotate_left(output[(index + 1) % STATE_SIZE], 1, 8)
        byte8 ^= rotate_left(output[(index + 2) % STATE_SIZE], 2, 8)
        byte8 ^= rotate_left(output[(index + 3) % STATE_SIZE], 3, 8)
        xor_subroutine(output, hash_key[byte8 % STATE_SIZE])          
        output[index % STATE_SIZE] ^= byte8
        
def hash_function(data, hash_key=HASH_KEY, post_processing_steps=32, post_processing_data=HASH_KEY[0]):         
    data = bytearray(pad_input(data, STATE_SIZE))
    output = bytearray(STATE_SIZE)    
    _hash(output, data, hash_key)  # compress data  
    _hash(output, post_processing_data[:post_processing_steps], hash_key) # output transformation
    return bytes(output)                
                
def stream_cipher(data, key, nonce):      
    state = bytearray(STATE_SIZE)
    _hash(state, key + nonce, HASH_KEY)        
    for counter, block in enumerate(slide(data, STATE_SIZE)):                
        key_stream = state[:]
        _hash(key_stream, pad_input(integer_to_bytes(counter), STATE_SIZE))
        _hash(key_stream, key)
        xor_subroutine(block, key_stream)                                                
                            
def encrypt(data, key, nonce, additional_data=''):
    data = bytearray(data)
    key = bytearray(key)
    nonce = bytearray(nonce)
    stream_cipher(data, key, nonce)
    tag = hash_function(key + nonce + data + additional_data)
    return bytes(data)#, tag
    
def decrypt(data, key, nonce, additional_data, tag): 
    plaintext, verifier = encrypt(data, key, nonce, additional_data)
    if tag == verifier:
        return plaintext, additional_data
    else:
        return '', ''
                
def store(data, block, index):
    data[(index * STATE_SIZE):((index + 1) * STATE_SIZE)] = block 
    
def setup_authenticated_stream_cipher(key, nonce, additional_data):    
    key_stream = bytearray(STATE_SIZE)
    key = bytearray(key)
    _hash(key_stream, key + nonce)
    last_ciphertext_block = additional_data
    return key_stream, key, last_ciphertext_block
    
def authenticated_stream_cipher(data, key, nonce, additional_data='', return_mode="saved"):       
    key_stream, key, last_ciphertext_block = setup_authenticated_stream_cipher(key, nonce, additional_data)
    for index, block in enumerate(slide(data, STATE_SIZE)):                
        _hash(key_stream, key + last_ciphertext_block)           
        xor_subroutine(block, key_stream)        
        store(data, block, index)        
        last_ciphertext_block = block[:]
        
    _hash(key_stream, key + last_ciphertext_block) # tag = key_stream             
    return bytes(data)
    
def authenticated_stream_cipher_decrypt(data, key, nonce, additional_data, tag):      
    key_stream, key, last_ciphertext_block = setup_authenticated_stream_cipher(key, nonce, additional_data)
    for index, block in enumerate(slide(data, STATE_SIZE)):
        _hash(key_stream, key + last_ciphertext_block)
        last_ciphertext_block = block[:]
        xor_subroutine(block, key_stream)
        store(data, block, index)
        
    _hash(key_stream, key + last_ciphertext_block)
    if key_stream == tag:
        return True
    else:
        return False
                        
def test_authenticated_stream_cipher():
    message = bytearray("I love you :)" * 10)
    _message = message[:]
    key = "\x00" * 16
    nonce = "\x00" * 16
    data = "Why not!"
    tag = authenticated_stream_cipher(message, key, nonce, data)    
    assert authenticated_stream_cipher_decrypt(message, key, nonce, data, tag)        
    assert message == _message              
                        
def test_encrypt_decrypt():
    key = "\x00" * 16
    nonce = "\x00" * 16
    data = "A most excellent test message! :)"
    additional_data = "Well, integrity is a good thing."
    ciphertext, tag = encrypt(data, key, nonce, additional_data)
    ciphertext[0] = 0    
    additional_data2 = "Well, integrity is a good thjng."    
    plaintext, _additional_data = decrypt(ciphertext, key, nonce, additional_data2, tag)
    assert (plaintext, _additional_data) != (data, additional_data), ((plaintext, _additional_data), (data, additional_data))
                        
def test_encrypt_metrics():
    from crypto.analysis.metrics import test_stream_cipher, PERFORMANCE_TEST
    print "Testing metrics of encryption algorithm"
    test_stream_cipher(encrypt, "\x00" * 16, "\x00" * 16, performance_test_sizes=(1500, 4096), **PERFORMANCE_TEST)
    
def test_authenticated_stream_cipher_metrics():
    from crypto.analysis.metrics import test_stream_cipher, PERFORMANCE_TEST
    print "Testing metrics of encryption algorithm"
    def test_algorithm(data, key, nonce):
        data = bytearray(data)
        authenticated_stream_cipher(data, key, nonce)
        return bytes(data)
    test_stream_cipher(test_algorithm, "\x00" * 16, "\x00" * 16, performance_test_sizes=(1500, 4096), **PERFORMANCE_TEST)
    
def test_hash_function_metrics(): 
    print "Testing metrics of hash function"
    from crypto.analysis.metrics import test_hash_function              
    test_hash_function(hash_function, avalanche_test=False, randomness_test=False, period_test=False)#, bias_test=False)#, compression_test=False, performance_test=False)
    
if __name__ == "__main__":
    #test_encrypt_decrypt()
    test_encrypt_metrics()
    #test_hash_function_metrics()    
    #test_authenticated_stream_cipher()
    test_authenticated_stream_cipher_metrics()