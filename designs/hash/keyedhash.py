import struct

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
    from crypto.utilities import slide
    HASH_KEY = [bytearray(block) for block in slide(HASH_KEY, STATE_SIZE)]    
            
def pad_input(hash_input, size, padding_character=chr(128)):        
    hash_input += padding_character
    input_size = len(hash_input) + 8 # + 8 for 64 bits for the size bytes at the end
    padding = size - (input_size % size)
    hash_input += ("\x00" * padding) + (struct.pack("Q", input_size)) 
    assert not len(hash_input) % size, (len(hash_input), size)
    return hash_input
    
def addition_subroutine(data1, data2, modulus):
    for index, byte in enumerate(data1):
        data1[index] = (byte + data2[index]) % modulus
        
def subtraction_subroutine(data1, data2, modulus):
    for index, byte in enumerate(data1):
        data1[index] = (modulus + (byte - data2[index])) % modulus
              
def _hash(output, data, hash_key, modulus):
    for index in range(len(data)):
        byte8 = data[index]
        byte8 += output[index % STATE_SIZE]
        byte8 += output[(index + 1) % STATE_SIZE]
        byte8 += output[(index + 2) % STATE_SIZE]
        byte8 += index        
        addition_subroutine(output, hash_key[byte8 % modulus], modulus)          
        
def hash_function(data, hash_key=HASH_KEY, modulus=256):         
    data = bytearray(pad_input(data, STATE_SIZE))
    output = data[:STATE_SIZE]
    _hash(output, data, hash_key, modulus)  # compress data  
    _hash(output, output, hash_key, modulus) # output transformation
    return bytes(output)    
            
def test_length_extension_attack():
    data = "test"
    desired_extended_data = "testing"
    adjusted_data = pad_input(pad_input(data, STATE_SIZE) + "ing", STATE_SIZE)
    key = "secret"
    
    original_hash = bytearray(hash_function(key + data))       
    extended_hash = _hash(original_hash, "ing", HASH_KEY, 256)
    
    
                
                
def test_hash_function_bad_key():
    key = [bytearray(32) for count in range(256)]
    for index, _key in enumerate(key):
        _key[index % 32] = index
    
    for count in range(256):
       # if raw_input("any key + enter to exist, or enter to continue"):
       #     break        
        print hash_function(chr(count))    
    
def encrypt(data, key, nonce, additional_data=''):    
    hash_input = key + nonce
    output = bytearray()        
    for block in slide(bytearray(data), STATE_SIZE):        
        key_stream = bytearray(hash_function(hash_input))                 
        addition_subroutine(block, key_stream, 256)                        
        hash_input = key + nonce + block
        output.extend(block)
    tag = hash_function(hash_input + additional_data)
    return output, tag
    
def decrypt(data, key, nonce, additional_data, tag):
    hash_input = key + nonce
    output = bytearray()    
    for block in slide(bytearray(data), STATE_SIZE):               
        key_stream = bytearray(hash_function(hash_input))     
        hash_input = key + nonce + block        
        subtraction_subroutine(block, key_stream, 256)        
        output.extend(block)
    if hash_function(hash_input + additional_data) == tag:        
        return output, additional_data
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
    assert (plaintext, _additional_data) != (data, additional_data), (plaintext, data)
    
def test_encrypt_metrics():
    from crypto.analysis.metrics import test_stream_cipher
    print "Testing metrics of encryption algorithm"
    test_stream_cipher(encrypt, "\x00" * 16, "\x00" * 16, avalanche_test=False)
    
def test_hash_function(): 
    #outputs = []
    #for byte in range(256):
    #    print byte
    #    for byte2 in range(256):
    #        data = bytearray(2)
    #        data[0] = byte
    #        data[1] = byte2
    #        output = hash_function(data)
    #        assert output not in outputs, (byte, byte2)
    print "Testing metrics of hash function"
    from crypto.analysis.metrics import test_hash_function            
    test_hash_function(hash_function)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    #test_encrypt_metrics()
    test_hash_function()
    
    