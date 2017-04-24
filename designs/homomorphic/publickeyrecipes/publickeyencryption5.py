# distribute encrypted private key - does not work :(
raise NotImplementedError()
# use encrypted private key to generate random encryption of 0
#   - randomize the encrypted private key via the encryption of 0
# use the randomized encrypted private key to generate a ciphertext of the message
# decrypt the ciphertext using the root private key

import epqcrypto.secretkey as secretkey

def generate_private_key():
    return secretkey.generate_key()
    
def generate_public_key(private_key):
    p1, p2 = private_key
    public_key = (secretkey.encrypt(private_key[0], private_key) % p1,
                  secretkey.encrypt(private_key[1], private_key) % p2)
    return public_key
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    _private_key = secretkey.decrypt(public_key[0], private_key), secretkey.decrypt(public_key[1], private_key)
    assert _private_key == private_key, (_private_key, private_key)
    return public_key, private_key
    
def encrypt(message, public_key):
    p1, p2 = public_key    
    p1 += secretkey.encrypt(0, public_key)
    p2 += secretkey.encrypt(0, public_key)
    return secretkey.encrypt(message, (p1 % public_key[0], p2 % public_key[1]))
    
def decrypt(message, private_key):
    return secretkey.decrypt(message, private_key)
    
def test_encrypt_decrypt():
    public_key, private_key = generate_keypair()    
    message = 1
    ciphertext = encrypt(message, public_key)
    plaintext = decrypt(ciphertext, private_key)
    assert plaintext == message, (plaintext, message)
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    