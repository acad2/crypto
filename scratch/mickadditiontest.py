
def addition_test():
    plaintext1 = bytearray(16)
    plaintext1[-1] = 1

    secret_key = bytearray(os.urandom)
    private_base = generate_key(256)
    public_base = generate_key(256)
    
    arbitrary_base_addition(plaintext, secret_key, ASCII)
    ciphertext1 = convert(plaintext, private_base, public_base)
    
    plaintext2 = bytearray(16)
    plaintext2[-1] = 1
    
    secret_key2 = bytearray(os.urandom)
    arbitrary_base_addition(plaintext2, secret_key2, ASCII)
    arbitrary_base_addition(secret_key, secret_key2, ASCII)
    
    ciphertext2 = convert(plaintext2, private_base, public_base)
    
    arbitrary_base_addition(ciphertext, ciphertext2, public_base)
    
    correct_string = convert(ciphertext, public_base, private_base)
    arbitrary_base_subtraction(correct_string, secret_key, ASCII)
    
    print"Correct string: {}".format(correct_string))
    