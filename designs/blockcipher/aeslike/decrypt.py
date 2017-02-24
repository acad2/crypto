from encrypt import S_BOX256

INVERSE_S_BOX256 = [0] * 256
for index in range(256):
    INVERSE_S_BOX256[S_BOX256[index]] = index
    
    
def decrypt(ciphertext, key, wordsize=WORDSIZE, rounds=ROUNDS): 
    a, b, c, d = ciphertext[:4], ciphertext[4:8], ciphertext[8:12], ciphertext[12:16]
    for round in range(rounds):
        invert_transposition(a, b, c, d)
        unmix_state(a, b, c, d)
        invert_sbox_layer(a, b, c, d)
        add_constants(a, b, c, d, constants, round) # add = xor = subtract
        add_key(a, b, c, d, key, round)        
    ciphertext[:] = a + b + c + d
    return ciphertext    