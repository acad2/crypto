import struct

STATE_SIZE = 64

with open("publickey.bin", "a+b") as _file:
    HASH_KEY = _file.read()
    if not HASH_KEY or len(HASH_KEY) / STATE_SIZE != 256:
        from os import urandom
        HASH_KEY = urandom(STATE_SIZE * 256)
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
                
def hash_function(data, hash_key=HASH_KEY, modulus=256):     
    output = bytearray(STATE_SIZE)           
    for index, byte in enumerate(bytearray(pad_input(data, STATE_SIZE))):                                        
        addition_subroutine(output, hash_key[(byte + output[index % STATE_SIZE] + index) % modulus], modulus)                               
    return bytes(output)    
    
def encrypt(data, key, nonce):    
    hash_input = key + nonce
    output = bytearray()        
    for block in slide(bytearray(data), STATE_SIZE):        
        key_stream = bytearray(hash_function(hash_input))                 
        addition_subroutine(block, key_stream, 256)                        
        hash_input = key + nonce + block
        output.extend(block)
    tag = hash_function(hash_input)
    return output, tag
    
def decrypt(data, key, nonce, tag):
    hash_input = key + nonce
    output = bytearray()    
    for block in slide(bytearray(data), STATE_SIZE):               
        key_stream = bytearray(hash_function(hash_input))     
        hash_input = key + nonce + block        
        subtraction_subroutine(block, key_stream, 256)        
        output.extend(block)
    if hash_function(hash_input) == tag:
        return output
        
def test_encrypt_decrypt():
    key = "\x00" * 16
    nonce = "\x00" * 16
    data = "A most excellent test message! :)"
    ciphertext, tag = encrypt(data, key, nonce)
    ciphertext[0] = 0    
    plaintext = decrypt(ciphertext, key, nonce, tag)
    assert plaintext != data, (plaintext, data)
            
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
    
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function, avalanche_test=False)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    test_hash_function()
    
    