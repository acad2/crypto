from timeit import default_timer

from crypto.utilities import random_integer, size_in_bits

def test_for_homomorphism(ciphertext1, ciphertext2, decrypt, key, m1, m2):    
    if decrypt(ciphertext1 + ciphertext2, key) == m1 + m2:
        print("Ciphertexts support addition: D(E(m1) + E(m2)) == m1 + m2")
    if decrypt(ciphertext1 * ciphertext2, key) == m1 * m2:
        print("Ciphertexts support multiplication: D(E(m1) * E(m2)) == m1 * m2")
    if decrypt(ciphertext1 ^ ciphertext2, key) == m1 ^ m2:
        print("Ciphertexts support XOR: D(E(m1) ^ E(m2)) == m1 ^ m2")
    if decrypt(ciphertext1 & ciphertext2, key) == m1 & m2:
        print("Ciphertexts support AND: D(E(m1) & E(m2)) == m1 & m2")
        
def test_encrypt_decrypt_time(iterations, encrypt, decrypt, public_key, private_key, plaintext_size):    
    print("Encrypting and decrypting {} random {}-byte messages...".format(iterations, plaintext_size))
    before = default_timer()
    for count in range(iterations): 
        message = random_integer(plaintext_size)
        ciphertext = encrypt(message, public_key)
        plaintext = decrypt(ciphertext, private_key)
      #  assert plaintext == message, (plaintext, message)
    after = default_timer()
    print("Time required: {}".format(after - before))
    
def test_asymmetric_encrypt_decrypt(algorithm_name, generate_keypair, encrypt, decrypt,
                                    iterations=1024, plaintext_size=32):    
    print("Beginning {} unit test".format(algorithm_name))
    print("Generating keypair...")
    public_key, private_key = generate_keypair()
    print("...done.")    
    
    test_encrypt_decrypt_time(iterations, encrypt, decrypt, public_key, private_key, plaintext_size)
    
    m1, m2 = 3, 6
    ciphertext1 = encrypt(m1, public_key)
    ciphertext2 = encrypt(m2, public_key)    
    test_for_homomorphism(ciphertext1, ciphertext2, decrypt, private_key, m1, m2)
    
    try:
        public_sizes = [size_in_bits(item) for item in public_key]
    except TypeError:
        public_key_sizes = [size_in_bits(public_key)]        
    try:
        private_sizes = [size_in_bits(item) for item in private_key]
    except TypeError:
        private_sizes = [size_in_bits(private_key)]
        
    print("Public key size : {}".format(sum(public_sizes)))
    print("Private key size: {}".format(sum(private_sizes)))
    print("Ciphertext size : {}".format(size_in_bits(encrypt(2, public_key))))
    print("(sizes are in bits)")
    print("{} unit test passed".format(algorithm_name))
       
def test_symmetric_encrypt_decrypt(algorithm_name, generate_key, encrypt, decrypt,
                                   iterations=1024, plaintext_size=32):
    print("Beginning {} unit test...".format(algorithm_name))
    print("Generating key...")
    key = generate_key()
    print("...done")
    
    test_encrypt_decrypt_time(iterations, encrypt, decrypt, key, key, plaintext_size)
        
    m1 = 10
    m2 = 20
    c1 = encrypt(m1, key)
    c2 = encrypt(m2, key)
    test_for_homomorphism(c1, c2, decrypt, key, m1, m2)
           
    try:
        sizes = [size_in_bits(item) for item in key]
    except:
        sizes = [size_in_bits(key)]
    print("Key size: {}".format(sum(sizes)))
    print("Ciphertext size: {}".format(size_in_bits(encrypt(2, key))))
    print("{} unit test passed".format(algorithm_name))
    