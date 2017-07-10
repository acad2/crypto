def OAEP_encode(message, G, H, k0, k1, n, L):
    
    #https://www.ietf.org/rfc/rfc3447.txt



    #message = null_pad(message, n - k0)
    #r = bytearray(urandom(k0))
    #X = message
    #G_r = G(r)
    #xor_subroutine(message, G_r)
    #H_X = H(X)
    #Y = r
    #xor_subroutine(Y, H_X)
    #return X, Y
    
def OAEP_decode(X, Y, G, H):
    #r = Y
    #H_X = H(X)
    #xor_subroutine(r, H_X)
    #G_r = G(r)
    #padded_message = X
    #xor_subroutine(padded_message, G_r)
    #return padded_message
    
def KEM_encode(random_value, recipients_public_key, encryption_algorithm=encrypt, hash_function=hash_function):
    ciphertext = encryption_algorithm(random_value, recipients_public_key)   
    return ciphertext, hash_function(random_value)
    
def KEM_decode(ciphertext, private_key, decryption_algorithm=decrypt, hash_function=hash_function):
    random_value = decryption_algorithm(ciphertext, private_key)
    return hash_function(random_value)
    