from crypto.utilities import pad_input, xor_subroutine

STATE_SIZE = 64

with open("publickey.bin", "a+b") as _file:
    PUBLIC_KEY = _file.read()
    if not PUBLIC_KEY or len(PUBLIC_KEY) / STATE_SIZE != 256:
        from os import urandom
        PUBLIC_KEY = urandom(STATE_SIZE * 256)
        _file.write(PUBLIC_KEY)         
    from crypto.utilities import slide
    PUBLIC_KEY = [bytearray(block) for block in slide(PUBLIC_KEY, STATE_SIZE)]    
            
def hash_function(data, public_key=PUBLIC_KEY, modulus=256):     
    output = bytearray(STATE_SIZE)        
    for index, byte in enumerate(bytearray(pad_input(data, STATE_SIZE))):
        value = public_key[byte]
        output[:] = ((output[count] + (value[count] * (index + byte + count + 1))) % 256 for count in range(STATE_SIZE))               
    return bytes(output)    
    
def encrypt(data, key, nonce):    
    hash_input = key + nonce
    output = bytearray()        
    for block in slide(bytearray(data), STATE_SIZE):        
        key_stream = bytearray(hash_function(hash_input))                 
        xor_subroutine(block, key_stream)                        
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
        xor_subroutine(block, key_stream)        
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
    for byte in range(256):
        data = bytearray(2)
        data[0] = byte
        print hash_function(data)
    
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    #test_hash_function()
    
    