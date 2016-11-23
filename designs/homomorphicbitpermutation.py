""" Python implementation of a homomorphic secret key cipher and associated public key system based on it. """

from os import urandom

from crypto.utilities import bytes_to_words, words_to_bytes, xor_subroutine
from crypto.designs.ciphercomponents import choice, rotate_left, rotate_right

def new_key(wordcount=4, wordsize=4):
    return tuple(bytes_to_words(bytearray(urandom(wordcount * wordsize)), wordsize)) 

def choice_swap(a, b, k):
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)

    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def bit_permutation128(inputs, key, wordsize=32): 
    a, b, c, d = inputs
    k0, k1, k2, k3 = key
    for round in range(1):              
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 1, wordsize)
        c = rotate_left(c, 2, wordsize)
        d = rotate_left(d, 3, wordsize)               
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                
        b = rotate_left(b, 4, wordsize)
        c = rotate_left(c, 8, wordsize)
        d = rotate_left(d, 12, wordsize)                              
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)                    
        b = rotate_left(b, 8, wordsize)
        c = rotate_left(c, 12, wordsize)
        d = rotate_left(d, 16, wordsize)        
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3)
  #      a, b, c, d = b, c, d, a     
    return a, b, c, d
    
def invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    a, d = choice_swap(a, d, k3)
    c, b = choice_swap(c, b, k2)
    c, d = choice_swap(c, d, k1)
    a, b = choice_swap(a, b, k0)
    return a, b, c, d       
        
def invert_bit_permutation128(inputs, key, wordsize=32):
    a, b, c, d = inputs
    k0, k1, k2, k3 = key
    for round in range(1):
 #       a, b, c, d = d, a, b, c
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 16, wordsize)
        c = rotate_right(c, 12, wordsize)
        b = rotate_right(b, 8, wordsize)        
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 12, wordsize)
        c = rotate_right(c, 8, wordsize)
        b = rotate_right(b, 4, wordsize)
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)
        
        d = rotate_right(d, 3, wordsize)
        c = rotate_right(c, 2, wordsize)
        b = rotate_right(b, 1, wordsize)
        a, b, c, d = invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3)

    return a, b, c, d
      
def encrypt64(data, key, output_type="bytes"):
    padding = new_key(2, 4) # generate 2 32-bit words
    inputs = tuple(bytes_to_words(bytearray(data), 4)) + padding
    if output_type == "bytes":
        return words_to_bytes(bit_permutation128(inputs, key), 4)
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type))
        return bit_permutation128(inputs, key)
        
def decrypt64(data, key, output_type="bytes"):
    output = invert_bit_permutation128(bytes_to_words(data, 4), key)
    if output_type == "bytes":
        return words_to_bytes(output, 4)[:8]
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type)) 
        return invert_bit_permutation128(bytes_to_words(data, 4), key)
        
def encrypt64v2(data, key, output_type="bytes"):
    padding = new_key(2, 4)
    inputs = bytes_to_words(bytearray(data), 4)
    inputs[0] ^= padding[0]
    inputs[1] ^= padding[1]
    inputs = tuple(inputs) + padding
    if output_type == "bytes":
        return words_to_bytes(bit_permutation128(inputs, key), 4)
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type)) 
        return bit_permutation128(inputs, key)
                
def decrypt64v2(data, key, output_type="bytes"):
    output = list(invert_bit_permutation128(bytes_to_words(data, 4), key))
    output[0] ^= output[2]
    output[1] ^= output[3]
    if output_type == "bytes":
        return words_to_bytes(output, 4)[:8]
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type)) 
        return output
        
def test_encrypt64v2_decrypt64v2():
    data = "Awesome!"
    key = (123, 456, 789, 101112)
    ciphertext = encrypt64v2(data, key)    
    plaintext = decrypt64v2(ciphertext, key)
    _print_bits(bytearray(data), ciphertext)
    assert plaintext == data
    
def homomorphic_adder(data1, data2, data3):
    print data1, data2
    for index, byte in enumerate(data1):
        data3[index] ^= byte & data2[index]    
    xor_subroutine(data1, data2)
    print data1, data2
    
def test_homomorphic_adder():
    input1 = [1 for count in range(8)]
    input2 = input1[:]
    carry = [0 for count in range(8)]
    key = (123, 456, 789, 101112)
    
    ciphertext1 = encrypt64(input1, key)
    ciphertext2 = encrypt64(input2, key)    
    ciphertext3 = encrypt64(carry, key)
    homomorphic_adder(ciphertext1, ciphertext2, ciphertext3)
    
    _input1 = decrypt64(ciphertext1, key)
    _input2 = decrypt64(ciphertext2, key)
    _carry = decrypt64(ciphertext3, key)
    print list(_input1)
    print list(_input2)
    print list(_carry)
    
def test_encrypt64_decrypt64():
    data = "TestData"
    key = new_key(4, 4) # 4 32-bit words
    ciphertext = encrypt64(data, key)
    plaintext = decrypt64(ciphertext, key)
    assert plaintext == data, (plaintext, data)
    
    data2 = bytearray((3, 13, 28, 21, 19, 9, 21, 21))
    ciphertext2 = encrypt64(data2, key)
    
    ciphertextxor = bytearray((ciphertext[index] ^ ciphertext2[index] for index in range(len(ciphertext))))
    plaintextxor = decrypt64(ciphertextxor, key)
    assert plaintextxor == "WhoaWhat", plaintextxor   

    data3 = bytearray((4, 7, 44, 14, 56, 4, 64, 85))
    ciphertext3 = encrypt64(data3, key)
   
    ciphertextxor2 = bytearray((ciphertextxor[index] ^ ciphertext3[index] for index in range(len(ciphertextxor))))
    plaintextxor2 = decrypt64(ciphertextxor2, key)
    assert plaintextxor2 == "SoCool!!"
    
    data4 = bytearray(urandom(8))
    ciphertext4 = encrypt64(data4, key)
    
    ciphertextand = bytearray((ciphertextxor2[index] & ciphertext4[index] for index in range(len(ciphertextxor2))))
    plaintextand = decrypt64(ciphertextand, key)
    _plaintextand = bytearray(ord("SoCool!!"[index]) & data4[index] for index in range(len("SoCool!!")))
    assert plaintextand == _plaintextand, (plaintextand, _plaintextand)
    #_print_bits(ciphertext, ciphertext2, ciphertext3, ciphertext4, ciphertextxor, ciphertextxor2, ciphertextand)
    print "Encrypt64/Decrypt64 unit test pass"
        
def test_invert_shuffle_columns():
    inputs = (1, 2, 4, 8)
    key = (123, 456, 789, 101112)
    outputs = shuffle_columns(*inputs + key)
    _inputs = invert_shuffle_columns(*outputs + key)
    assert _inputs == inputs, (_inputs, inputs)
    print "Invert shuffle columns unit test pass"
    
def test_invert_bit_permutation():
    inputs = (1, 2, 4, 8)
    key = (123, 456, 789, 101112)
    output = bit_permutation128(inputs, key)
    _inputs = invert_bit_permutation128(output, key)
    #_print_bits(_inputs)
    assert _inputs == inputs, (_inputs, inputs)
    print "Invert bit permutation unit test pass"    
    
def _print_bits(*inputs):
    for _input in inputs:
        print '-' * 80
        print '\n'.join(format(word, 'b').zfill(8) for word in _input)
            
def _print_bits32(*inputs):
    for _input in inputs:
        print '-' * 80
        print '\n'.join(format(word, 'b').zfill(32) for word in _input)                
def test_homomorphic_property():
    input1 = (1, 2, 4, 8)
    input2 = (2, 4, 8, 16)
    key = new_key()
    ciphertext1 = bit_permutation128(input1, key)
    ciphertext2 = bit_permutation128(input2, key)
    
    ciphertextxor = tuple(ciphertext1[index] ^ ciphertext2[index] for index in range(len(ciphertext1)))
    plaintextxor = tuple(input1[index] ^ input2[index] for index in range(len(input1)))
    
    ciphertextand = tuple(ciphertext1[index] & ciphertext2[index] for index in range(len(ciphertext1)))
    plaintextand = tuple(input1[index] & input2[index] for index in range(len(input1)))
    
    decryptedxor = invert_bit_permutation128(ciphertextxor, key)
    decryptedand = invert_bit_permutation128(ciphertextand, key)
            
    input3 = (4, 8, 16, 32)
    ciphertext3 = bit_permutation128(input3, key)
    #_print_bits(decryptedxor, plaintextxor, input1, input2)
    assert decryptedxor == plaintextxor, (decryptedxor, plaintextxor, input1, input2)
    assert decryptedand == plaintextand, (decryptedand, plaintextand, input1, input2)
    print "Homomorphic unit test pass"
    
    
#-------- public key test    
def generate_public_key(private_key):    
    public_key = []
    for integer in range(256):
        data = bytearray(8)
        data[-1] = integer
        ciphertext = encrypt64v2(data, private_key, "words")
        public_key.append(ciphertext)
    return public_key
    
def generate_private_key():
    return bytes_to_words(bytearray(urandom(16)), 4)
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def public_key_encryption(message, public_key, ciphertext_count=16):
    output = []
    for symbol in bytearray(message):
        ciphertext_byte = [0, 0, 0, 0]
        _key_byte = 0
        for count in range(ciphertext_count - 1):        
            key_byte = ord(urandom(1))
            _key_byte ^= key_byte
            ciphertext_key_byte = public_key[key_byte]
            ciphertext_byte[0] ^= ciphertext_key_byte[0]
            ciphertext_byte[1] ^= ciphertext_key_byte[1]
            ciphertext_byte[2] ^= ciphertext_key_byte[2]
            ciphertext_byte[3] ^= ciphertext_key_byte[3]
            
        final_key_byte = _key_byte ^ symbol
        final_ciphertext = public_key[final_key_byte]
        ciphertext_byte[0] ^= final_ciphertext[0]
        ciphertext_byte[1] ^= final_ciphertext[1]
        ciphertext_byte[2] ^= final_ciphertext[2]
        ciphertext_byte[3] ^= final_ciphertext[3]
        output.append(ciphertext_byte)        
    return output
    
def private_key_decryption(ciphertexts, private_key):
    message = bytearray()
    for ciphertext_byte in ciphertexts:        
        plaintext_byte = decrypt64v2(words_to_bytes(ciphertext_byte, 4), private_key)[-1]
        message.append(plaintext_byte)
    return message
    
def test_public_key_encryption_private_key_decryption():
    public_key, private_key = generate_keypair()
    message = "Testing!"
    ciphertext = public_key_encryption(message, public_key)
    plaintext = private_key_decryption(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    ciphertext2 = public_key_encryption(message, public_key)
    assert ciphertext2 != ciphertext
    plaintext2 = private_key_decryption(ciphertext2, private_key)
    assert plaintext2 == message
    


if __name__ == "__main__":
    test_invert_shuffle_columns()
    test_invert_bit_permutation()
    test_homomorphic_property()
    test_encrypt64_decrypt64()
    test_homomorphic_adder()
    test_encrypt64v2_decrypt64v2()
    test_public_key_encryption_private_key_decryption()
    