from crypto.utilities import bytes_to_integer, integer_to_bytes

def add(data, keystream, mask=0xFFFFFFFF):
    #size = len(data)
    #word1 = bytes_to_integer(data)
    #word2 = bytes_to_integer(keystream)
    #word1 = (word1 + word2) & ((2 ** (8 * size)) - 1)
    #return integer_to_bytes(word1, size)

    for index, key_word in enumerate(keystream):
        data[index] = (data[index] + key_word) & mask
        
def subtract(data, keystream, mask=0xFFFFFF):
    #size = len(data)
    #mask = ((2 ** (8 * size)) - 1)
    #word1 = bytes_to_integer(data)
    #word2 = bytes_to_integer(keystream)
    #word1 = ((mask + 1) + (word1 - word2)) & mask
    #return integer_to_bytes(word1, size)
    
    for index, key_word in enumerate(keystream):                       
        data[index] = ((mask + 1) + (data[index] - key_word)) & mask
        
def test_add_subtract():
    data = range(16)
    key = range(1, 17)
    print data
    add(data, key, 255)
    print data
    subtract(data, key, 255)
    print data          
        
def test_addition():
    from os import urandom
    size = 255
    ciphertexts = 100
    data1 = bytearray(urandom(16))
    correct_result = data1[:]
    
    key1 = bytearray(urandom(16))
    add(data1, key1, size)
    private_key = key1[:]
    
    for ciphertext in range(1024):        
        data2 = bytearray(urandom(16))        
        add(correct_result, data2, size)
                
        key2 = bytearray(urandom(16))       
        add(private_key, key2, size)        
        
        add(data2, key2, size)
        
        add(data1, data2, size)
            
    subtract(data1, private_key, size)        
    assert data1 == correct_result
            
if __name__ == "__main__":
    test_add_subtract()
    test_addition()
    