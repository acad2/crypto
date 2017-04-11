# public key: 2 homomorphic encryptions of 0
# encryption: generate two random r and do (pb1 * r1) + (pb2 * r2) + m
# decryption: homomorphic decrypt

# p1q1 + p2q2 + e
import secretkey

def generate_private_key(key_generation_function=secretkey.generate_key):
    return key_generation_function()
    
def generate_public_key(private_key, encryption_function=secretkey.encrypt):
    pb1 = encryption_function(0, private_key)
    pb2 = encryption_function(0, private_key)
    return pb1, pb2
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encrypt(m, public_key, r_size=16):
    pb1, pb2 = public_key
    r1, r2 = secretkey.random_integer(r_size), secretkey.random_integer(r_size)
    return (pb1 * r1) + (pb2 * r2) + m
    
def decrypt(ciphertext, private_key, decryption_function=secretkey.decrypt):
    return decryption_function(ciphertext, private_key)
    
def test_encrypt_decrypt():    
    public_key, private_key = generate_keypair()
    message = 1
    ciphertext = encrypt(message, public_key)    
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
    
    hamming_weight = lambda number: format(number, 'b').count('1')
    print("publickeyencryption4 encrypt/decrypt unit test passed")
    print("Public key size : {}".format(sum(hamming_weight(item) for item in public_key)))
    print("Private key size: {}".format(sum(hamming_weight(item) for item in private_key)))
    print("Ciphertext size : {}".format(hamming_weight(ciphertext)))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    