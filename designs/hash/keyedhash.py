import struct

from crypto.utilities import slide, xor_subroutine

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
                  
def _hash(output, data, hash_key, modulus):
    for index in range(len(data)):
        byte8 = data[index]        
        byte8 ^= output[index % STATE_SIZE]        
        byte8 ^= output[(index + 1) % STATE_SIZE]
        byte8 ^= output[(index + 2) % STATE_SIZE]
        byte8 ^= (index % modulus)        
        xor_subroutine(output, hash_key[byte8 % STATE_SIZE])          
        output[index % STATE_SIZE] ^= byte8
        
def hash_function(data, hash_key=HASH_KEY, modulus=256):         
    data = bytearray(pad_input(data, STATE_SIZE))
    output = bytearray(STATE_SIZE)
    _hash(output, data, hash_key, modulus)  # compress data  
    _hash(output, output, hash_key, modulus) # output transformation
    return bytes(output)                
        
def stream_cipher(data, key, nonce):
    hash_input = key + nonce        
    for counter, block in enumerate(slide(data, STATE_SIZE)):        
        key_stream = bytearray(hash_function(hash_input))                 
        xor_subroutine(block, key_stream)                        
        hash_input = key + nonce
        hash_input.append(counter)
    
def encrypt(data, key, nonce, additional_data=''):
    data = bytearray(data)
    key = bytearray(key)
    nonce = bytearray(nonce)
    stream_cipher(data, key, nonce)
    tag = hash_function(key + nonce + data + additional_data)
    return data, tag
    
def decrypt(data, key, nonce, additional_data, tag): 
    plaintext, verifier = encrypt(data, key, nonce, additional_data)
    if tag == verifier:
        return plaintext, additional_data
    else:
        return '', ''
                
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
    from crypto.analysis.metrics import test_stream_cipher
    print "Testing metrics of encryption algorithm"
    test_stream_cipher(encrypt, "\x00" * 16, "\x00" * 16, avalanche_test=False)
    
def test_hash_function(): 
    print "Testing metrics of hash function"
    from crypto.analysis.metrics import test_hash_function            
    test_hash_function(hash_function, avalanche_test=False, randomness_test=False, bias_test=False, period_test=False, compression_test=False, performance_test=False)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    #test_encrypt_metrics()
    test_hash_function()
    
    