# implementation of a cipher that is partially homomorphic with respect to addition over integers
from os import urandom

from utilities import modular_subtraction, addition_subroutine, subtraction_subroutine, multiplication_subroutine, modular_inverse
from crypto.utilities import modular_inverse

# key generation functions
def bytes_to_bits(data):
    return ''.join(format(word, 'b').zfill(8) for word in data)
    
def generate_key1(size_in_bytes, modulus=256):    
    key1_size = sum(range(2, size_in_bytes)) / 8
    key = bytearray(urandom(key1_size))    
    return key
    
def convert_key(key_material, modulus=256, switch=(0, 255)):    
    """ Convert each 0/1 bit into a word of all 0/1 """
    key = []
    for byte in key_material:
        for bit in range(8):
            key.append(switch[(byte >> bit) & 1])
    return key
    
def generate_key2(size_in_bytes, modulus=256):
    """ Generates random numbers that have a modular inverse. """
    key_material = iter(bytearray(urandom((size_in_bytes * 2) + 64)))
    key2 = bytearray()
    while len(key2) < size_in_bytes:
        try:
            key_byte = next(key_material)
        except StopIteration:
            key_material = iter(bytearray(urandom((size_in_bytes * 2) + 64)))
        try:
            modular_inverse(key_byte, modulus)
        except ValueError:
            pass
        else:
            key2.append(key_byte)    
    return key2
    
def generate_key(data_length_in_bytes):        
    return generate_key1(data_length_in_bytes) + generate_key2(data_length_in_bytes)
     
# cipher functions     
def psuedohadamard_transform(a, b, modulus=256):
    _a = (a + b) % modulus
    b = (a + (2 * b)) % modulus
    return _a, b
    
def invert_psuedohadamard_transform(a, b, modulus=256):
    _b = modular_subtraction(b, a, modulus)
    a = modular_subtraction((2 * a), b, modulus)
    return a, _b   
        
def choice(a, b, c):
    return c ^ (a & (b ^ c))
    
def choice_swap(k, a, b):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b                
                  
def encrypt(data, key, rounds=1, modulus=256):         
    """ Cipher that produces ciphertexts that are partially homomorphic with respect to addition over the integers.
        Design:
            
            key addition layer (multiplication)
            keyed transposition (choice swap)
            diffusion step (psuedo hadamard transform)
            
        The diffusion step is fused with the keyed transposition loop. """        
    size = len(data)        
    key2 = key[-size:]
    key1 = convert_key(key[:size])          
    for round in range(rounds):   
        key_index = 0    
        multiplication_subroutine(data, key2, modulus)
        for index1 in range(size):
            for index2 in reversed(range(index1 + 1, size)):                  
                word1, word2 = data[index1], data[index2]                                                           
                word1, word2 = choice_swap(key1[key_index % len(key1)], word1, word2)                                                 
                data[index1], data[index2] = psuedohadamard_transform(word1, word2, modulus)              
                key_index += 1                
    
    multiplication_subroutine(data, key2, modulus)        
    return data
    
def decrypt(data, key, rounds=1, modulus=256, multiplier=None):
    size = len(data)     
    inverse_key2 = [modular_inverse(item, modulus) for item in key[-size:]]
    key1 = convert_key(key[:size])    
    for round in range(rounds):
        key_index = sum(range(2, size))        
        multiplication_subroutine(data, inverse_key2, modulus)
        for index1 in reversed(range(size)):
            for index2 in range(index1 + 1, size):                
                word1, word2 = data[index1], data[index2]                                
                word1, word2 = invert_psuedohadamard_transform(word1, word2, modulus)           
                data[index1], data[index2] = choice_swap(key1[key_index % len(key1)], word1, word2)            
                key_index -= 1                                    
    
    multiplication_subroutine(data, inverse_key2, modulus)      
    return data

    
def test_pht_invert_pht():
    a, b = 10, 20
    _a, _b = psuedohadamard_transform(a, b)
    __a, __b = invert_psuedohadamard_transform(_a, _b)
    assert __a == a and __b == b, (__a, __b, a, b)
    
def test_encrypt_decrypt():        
    data = bytearray(8)
    _data = data[:]    
    data_size = len(data)

    _data_size = data_size * 2    
    key = generate_key(_data_size)    
    ciphertext = encrypt(data, key)[:]    
    plaintext = decrypt(ciphertext, key)[:]
    assert plaintext == _data, (plaintext, _data)

    test_homomorphic_permutation(encrypt, decrypt)
           
def test_homomorphic_permutation(_encrypt, _decrypt):    
    ROUNDS = 10
    data = bytearray(8)
    data[0] = 1
    key = generate_key(len(data))
    _data = data[:]
    
    ciphertext1 = _encrypt(data, key, ROUNDS)        
    print("Ciphertext1: {}".format(list(ciphertext1)))
    data = _decrypt(ciphertext1, key, ROUNDS)
    assert data == _data, (data, _data)
               
    data2 = bytearray(8)
    data2[0] = 2
    _data2 = data2[:]
    ciphertext2 = _encrypt(data2, key, ROUNDS)    
    
    print("Ciphertext2: {}".format(list(ciphertext2)))
    data2 = _decrypt(ciphertext2, key, ROUNDS)
    assert data2 == _data2, (data2, _data2)
            
    addition_subroutine(ciphertext1, ciphertext2, 256)
    print("Ciphertext1 + Ciphertext2: {}".format(list(ciphertext1))) 
    addition_subroutine(data, data2, 256)    
    
    ciphertext1 = _decrypt(ciphertext1, key, ROUNDS, multiplier=2)
    assert ciphertext1 == data, (ciphertext1, data)    
    
    message0 = bytearray(urandom(8))
    message1 = bytearray(urandom(8))
    message2 = bytearray(urandom(8))
    message0[0] = 1
    message1[0] = 2
    message2[0] = 3
    _encrypt(message0, key, ROUNDS)
    _encrypt(message1, key, ROUNDS)
    _encrypt(message2, key, ROUNDS)
    addition_subroutine(message0, message1, 256)
    addition_subroutine(message0, message2, 256)    
    _decrypt(message0, key, ROUNDS, multiplier=2)
    assert message0[0] == 1 + 2 + 3, message1
    
    data = bytearray(urandom(8))
    data2 = bytearray(urandom(8))
    data[0] = 7
    data2[0] = 131
    print("Data: {}".format(list(data)))
    print("Data2: {}".format(list(data2)))
    _encrypt(data, key, ROUNDS)
    _encrypt(data2, key, ROUNDS)
    print("Ciphertext: {}".format(list(data)))
    print("Ciphertext2: {}".format(list(data2)))
    
def test_encrypt_metrics():    
    from crypto.analysis.metrics import test_block_cipher
    from crypto.utilities import slide
    
    def cipher(message, key, iv=None, mode=None):
        data = bytearray(message) 
        key = bytearray(key)
        if iv is not None:
            addition_subroutine(data, bytearray(iv), 256)
        output = bytearray()        
        for block in slide(data, 16):
            addition_subroutine(block, output[-16:], 256)
            output.extend(encrypt(block, key, rounds=4))                
        return output
        
    test_block_cipher(cipher, bytearray(urandom(16)), bytearray(urandom(16)))
    
if __name__ == "__main__":
    test_pht_invert_pht()
    #test_encrypt_metrics()    
    test_encrypt_decrypt()
    