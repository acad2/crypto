from os import urandom

from utilities import multiplication_subroutine, modular_inverse, modular_subtraction, slide, addition_subroutine

def generate_key(size=1):
    return bytearray(urandom(2))
    
def encrypt(input_bytes, key, rounds=1, modulus=256, blocksize=16):
    size = len(input_bytes)    
    output = bytearray(size * 2)
    random_data = bytearray(urandom(size))
    key = [item | 1 for item in key]    
    for index, byte in enumerate(input_bytes):
        random_byte = random_data[index]
        output[(index * 2)] = ((byte + random_byte) * key[0]) % modulus
        output[(index * 2) + 1] = (random_byte * key[1]) % modulus        
    return output
    
def decrypt(ciphertexts, key, rounds=1, modulus=256, blocksize=16):
    output = bytearray()    
    key = [modular_inverse(item | 1, modulus) for item in key]
    for index, block in enumerate(slide(ciphertexts, 2)):
        block[1] = (block[1] * key[1]) % modulus
        block[0] = (block[0] * key[0]) % modulus
        block[0] = modular_subtraction(block[0], block[1], modulus)        
        output.append(block[0])
    return output
    
def test_encrypt_decrypt():
    message = bytearray("Testing!" * 256)
    key = generate_key()
    ciphertext = encrypt(message, key)
    plaintext = decrypt(ciphertext, key)    
    assert plaintext == message, (plaintext, message)
                
    message2 = bytearray(range(16))
    message3 = bytearray(range(1, 17))
    answer = bytearray((message2[index] + message3[index]) % 256 for index in range(len(message2)))
    ciphertext2 = encrypt(message2, key)
    ciphertext3 = encrypt(message3, key)
    addition_subroutine(ciphertext2, ciphertext3, 256)
    _answer = decrypt(ciphertext2, key)
    assert _answer == answer, (_answer, answer)    

    #from crypto.analysis.metrics import test_block_cipher
    #def test_function(data, key, iv=None, mode=None):
    #    data = bytearray(data)
    #    key = bytearray(key)
    #    return encrypt(data, key)
    #test_block_cipher(test_function, key, bytearray(16))
#def break_cipher(ciphertext, known_plaintext, modulus=256):
#    data_size = len(ciphertext)    
#    _data = bytearray(data_size)
#    valid_keys = []
#    import itertools
#    print "Testing ciphertext: ", [byte for byte in ciphertext]
#    for key_guess in range(256):#itertools.product(range(256), range(256)):
#        _data[:] = ciphertext[:] # r1 + k1, r1 + m + k2
#        _data[0] = modular_subtraction(_data[0], key_guess, modulus) # r1 + k1 - k1 = r1
#        _data[1] = modular_subtraction(_data[1], _data[0], modulus) # m + r1 + k2 - r1 = m + k2
#        _data[1] = modular_subtraction(_data[1], known_plaintext, modulus) # m + k2 - m = k2
#        valid_keys.append((key_guess, _data[1])) 
#        
#        #subtraction_subroutine(_data, key_guess, modulus)
#        #print "After key removal : ", [byte for byte in _data]
#        #plaintext = (_data[1] + _data[0]) % modulus
#        #if plaintext == known_plaintext:
#        #    valid_keys.append(key_guess)
#    return valid_keys
#    
#def test_break_cipher():
#    data = bytearray(1)
#    known_plaintext = 0
#    data[0] = known_plaintext
#    key = generate_key()    
#    ciphertext = encrypt(data, key, rounds=1)
#    keys1 = break_cipher(ciphertext, known_plaintext)
#    ciphertext2 = encrypt(data, key, rounds=1)
#    keys2 = break_cipher(ciphertext2, known_plaintext)
#    print len(keys1), len(keys2), len(set(keys1).union(keys2))
        
if __name__ == "__main__":
    test_encrypt_decrypt()
#    test_break_cipher()
    
    