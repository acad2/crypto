from crypto.utilities import slide, xor_subroutine
from hash import hash_function

HASH_SIZE = 32

def store(data, block, index):
    data[(index * HASH_SIZE):((index + 1) * HASH_SIZE)] = block 
    
def authenticated_stream_cipher(data, key, nonce, additional_data=''):
    hash_input = key + nonce + additional_data    
    for index, block in enumerate(slide(data, HASH_SIZE)):
        print "Hash input: ", hash_input
        key_stream = bytearray(hash_function(hash_input))
        print "Generated key stream: ", key_stream
        raise SystemExit()
        xor_subroutine(block, key_stream)
        #print "After xor : ", block
        store(data, block, index)
        hash_input = key + nonce + block
    return hash_function(hash_input)
 
def authenticated_stream_cipher_decrypt(data, key, nonce, additional_data, tag):
    hash_input = key + nonce + additional_data    
    for index, block in enumerate(slide(data, HASH_SIZE)):
        key_stream = bytearray(hash_function(hash_input))
        hash_input = key + nonce + block
        xor_subroutine(block, key_stream)
        store(data, block, index)
    if hash_function(hash_input) == tag:
        return True
    else:
        return False
                      
def test_authenticated_stream_cipher():
    message = bytearray("I love you :)" * 10)
    _message = message[:]
    key = "\x00" * 16
    nonce = "\x32" * 16
    data = "Why not!"        
    tag = authenticated_stream_cipher(message, key, nonce, data)    
    #print message
    assert authenticated_stream_cipher_decrypt(message, key, nonce, data, tag)        
    assert message == _message    
    
    
    
if __name__ == "__main__":
    test_authenticated_stream_cipher()
    