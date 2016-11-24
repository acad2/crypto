""" Python implementation of a homomorphic secret key cipher. 
    Uses keyed transposition to hide message bits in a sea of random bits.
    Since transposing bits according to a key results in bits at index i relocating to index j,
    transposing two separate messages means their bits will still "line up" in the resulting ciphertexts.
    This, combined with padding with random data and possibly masking, facilitates homomorphic cryptography. """

from os import urandom

from crypto.utilities import bytes_to_words, words_to_bytes, xor_subroutine
from crypto.designs.ciphercomponents import choice, rotate_left, rotate_right

def new_key(wordcount=4, wordsize=4):
    return tuple(bytes_to_words(bytearray(urandom(wordcount * wordsize)), wordsize)) 

def choice_swap(a, b, k):
    """ Conditionally swaps a and b, based on the value of k. """
    t = a
    a = choice(k, a, b)
    b = choice(k, b, t)
    return a, b
    
def shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    """ Transposes each 1 bit wide/4 bit tall column such that each bit has 1/4 probability of being in any word """
    a, b = choice_swap(a, b, k0)      
    c, d = choice_swap(c, d, k1)

    c, b = choice_swap(c, b, k2)
    a, d = choice_swap(a, d, k3)
    return a, b, c, d
    
def bit_permutation128(inputs, key, wordsize=32): 
    """ Transpose the bits of the supplied inputs according to key.
        Selects one of 128! permutations of bits. """
    a, b, c, d = inputs
    k0, k1, k2, k3 = key
    for round in range(1):              
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4 bit tall column is now active
        b = rotate_left(b, 1, wordsize)
        c = rotate_left(c, 2, wordsize)
        d = rotate_left(d, 3, wordsize)               
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 4x4 bit subsection is now active
        b = rotate_left(b, 4, wordsize)
        c = rotate_left(c, 8, wordsize)
        d = rotate_left(d, 12, wordsize)                              
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 16x4 bit subsection is now active                  
        b = rotate_left(b, 8, wordsize)
        c = rotate_left(c, 12, wordsize)
        d = rotate_left(d, 16, wordsize)        
        
        
        a, b, c, d = shuffle_columns(a, b, c, d, k0, k1, k2, k3) # each 32x4 bit subsection is now active  
    return a, b, c, d
    
def invert_shuffle_columns(a, b, c, d, k0, k1, k2, k3):
    """ Inverts the transposition performed by shuffle_columns. """
    a, d = choice_swap(a, d, k3)
    c, b = choice_swap(c, b, k2)
    c, d = choice_swap(c, d, k1)
    a, b = choice_swap(a, b, k0)
    return a, b, c, d       
        
def invert_bit_permutation128(inputs, key, wordsize=32):
    """ Inverts the transposition performed by bit_permutation. """
    a, b, c, d = inputs
    k0, k1, k2, k3 = key
    for round in range(1): 
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
    """ Encrypt 64 bits of data using key.
        Encryption is:
            - Randomized
                - The randomizing value is kept secret/not sent in the clear
            - Homomorphic
                - Supports unlimited fully homomorphic operations
                    - D(E(x) ^ E(y)) == x ^ y
                    - D(E(x) & E(y)) == x & y
                
        Encryption is performed by generating a 64-bit random padding value and
        then concatenating the padding to the 64-bit message, and finally applying a keyed bit permutation on the result. 
        
        To compute the XOR/AND of 2 ciphertexts, simply XOR/AND the ciphertexts together. 
            - An encryption of 0 should be added to the target of any AND afterwards
                - This is due to the tendency of AND to set bits to 0.
                - The noise from the ciphertext will ensure hamming weight on the target ciphertext stays balanced"""                
    padding = new_key(2, 4) # generate 2 32-bit words
    inputs = tuple(bytes_to_words(bytearray(data), 4)) + padding
    if output_type == "bytes":
        return words_to_bytes(bit_permutation128(inputs, key), 4)
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type))
        return bit_permutation128(inputs, key)
        
def decrypt64(data, key, output_type="bytes"):
    """ Decrypts ciphertext produced by encrypt64.
        First, the bit permutation is reversed. 
        Then the padding is xor'd with the message and discarded. 
        It is crucial for the long term security of the secret key that the random padding is not leaked."""        
    output = invert_bit_permutation128(bytes_to_words(data, 4), key)    
    if output_type == "bytes":                
        return words_to_bytes(output, 4)[:8]
    else:
        if output_type != "words":
            raise ValueError("Invalid output_type '{}'".format(output_type))         
        return invert_bit_permutation128(bytes_to_words(data, 4), key)
        
def encrypt64v2(data, key, output_type="bytes"):
    """ Encrypt 64 bits of data using key. Returns the resulting ciphertext
        Encryption is:
            - Randomized
                - The randomizing value is kept secret/not sent in the clear
            - Homomorphic
                - Supports unlimited partially homomorphic operationss
                - D(E(x) ^ E(y)) == x ^ y
                
        Encryption is performed by generating a 64-bit random padding value and masking the data with it,
        then concatenating the padding to the masked 64-bit message, and finally applying a keyed bit permutation on the result. 
        
        To compute the XOR of 2 ciphertexts, simply XOR the ciphertexts together.""" 
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
    """ Decrypts data encrypted by encrypt64v2. Returns resulting plaintext message. 
        Inverts the bit transposition, unmasks the data, and discards the padding. """
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
    
    print("\nData bits: ")
    _print_bits(bytearray(data))
    print("\nCiphertext bits: ")
    _print_bits(ciphertext)
    assert plaintext == data
    
    ciphertext2 = encrypt64v2(data, key)
    assert ciphertext2 != ciphertext
    plaintext2 = decrypt64v2(ciphertext2, key)
    assert plaintext2 == data
    print("\nCiphertext2 bits: ")
    _print_bits(ciphertext2)
    print "encrypt64v2 and decrypt64v2 unit test pass"
    
def homomorphic_adder(data1, data2, data3):
    """ Homomorphic half-adder to test homomorphic properties of ciphertexts. """    
    for index, byte in enumerate(data1):
        data3[index] ^= byte & data2[index]    
    xor_subroutine(data1, data2)    
    
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
    
    assert list(_input1) == [0 for count in range(8)], _input1
    assert list(_input2) == [1 for count in range(8)]
    assert list(_carry) == [1 for count in range(8)]
    print "Homomorphic adder unit test pass"
    
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
        
def encrypt8(byte, key):
    padding = bytearray(urandom(15))
    for padding_byte in padding:
        byte ^= padding_byte
    
    inputs = bytearray()
    inputs.append(byte)
    inputs.extend(padding)
    return words_to_bytes(bit_permutation128(bytes_to_words(inputs, 4), key), 4)
            
def decrypt8(ciphertext, key):
    output = words_to_bytes(invert_bit_permutation128(bytes_to_words(ciphertext, 4), key), 4)
    for padding_byte in output[1:]:
        output[0] ^= padding_byte
    return output[0]
            
def test_encrypt8_decrypt8():
    key = (123, 456, 789, 101112)
    byte = 0
    ciphertext = encrypt8(byte, key)
    plaintext = decrypt8(ciphertext, key)
    assert plaintext == byte
    
if __name__ == "__main__":
    #test_invert_shuffle_columns()
    #test_invert_bit_permutation()
    #test_homomorphic_property()
    #test_encrypt64_decrypt64()
    #test_homomorphic_adder()
    #test_encrypt64v2_decrypt64v2()    
    #micks_attack()
    test_encrypt8_decrypt8()
    