from crypto.designs.permutation.permutation3 import permutation_subroutine, invert_permutation_subroutine

from crypto.utilities import xor_subroutine

def cipher(data, encryption_key, permutation=permutation_subroutine, rounds=2):  
    """ Cipher construction with 2 inputs and 2 outputs.
        Inputs: 
            - Plaintext
            - Encryption key
        Outputs:
            - Ciphertext
            - Decryption key
            
        Encipher data in such a way that the key used to encrypt is not the same key used to decrypt.
        Generates a private decryption key for each processed message. 
        
        Ciphertexts remain confidential against an adversary that knows the key that was used to encrypt the plaintext."""            
    decryption_key = encryption_key[:]
    for round in range(rounds):
        xor_subroutine(data, decryption_key)
        permutation(data)
        
        xor_subroutine(decryption_key, data)
        permutation(decryption_key)
    xor_subroutine(data, decryption_key)    
    return decryption_key
    
def decipher(data, decryption_key, invert_permutation=invert_permutation_subroutine, rounds=2):
    """ Decryption component of the construction with 2 Inputs and 2 Outputs.
        Inputs:
            - Ciphertext
            - Decryption key
        Outputs:
            - Plaintext
            - Encryption key
        
        Decipher ciphertext using decryption_key. 
        Produces the associated public key alongside the plaintext, which can be used for verification. """            
    encryption_key = decryption_key[:]
    xor_subroutine(data, encryption_key)
    for round in range(rounds):
        invert_permutation(encryption_key)
        xor_subroutine(encryption_key, data)
        
        invert_permutation(data)
        xor_subroutine(data, encryption_key)
    return encryption_key # is now == encryption_key again (if all went well)
    
def encrypt(data, encryption_key):
    return cipher(data, encryption_key)    
    
def decrypt(ciphertext, decryption_key, encryption_key):
    _public_key = decipher(ciphertext, decryption_key)
    if _public_key == encryption_key:
        return ciphertext # is now == plaintext
    else:
        return -1
        
def test_encrypt_decrypt():
    data = bytearray(16)    
    encryption_key = bytearray(16)
    data[0] = 1
    plaintext = data[:]
    
    decryption_key = encrypt(data, encryption_key)
    ciphertext = data[:]
    print [byte for byte in ciphertext]
    print [byte for byte in decryption_key]
    _plaintext = decrypt(ciphertext, decryption_key, encryption_key)
    assert plaintext == _plaintext, (plaintext, _plaintext)
    
        
    decryption_key = encrypt(data, encryption_key)
    ciphertext = data[:]
    print [byte for byte in decryption_key]
    invalid_plaintext = decrypt(ciphertext, encryption_key, encryption_key) # cannot decrypt with the encryption key
    assert invalid_plaintext == -1, invalid_plaintext
    print [byte for byte in ciphertext]
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    