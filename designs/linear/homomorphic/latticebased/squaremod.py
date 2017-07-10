#p = random_integer(1)
#ps = [p]
#for count in range(8):
#    ps.append(ps[-1] ** 2)
#    
#    
#   103
#   201
#   ----
#   103
#  000   
# 206
# 20703
# 
# 
#p + pp * (p + pp)
#p(p + pp) + pp(p + pp)
#pp + ppp + ppp + pp
#pppppppppp
#
#2p + 2pp * (3p + 3pp)
#3p(2p + 2pp) + 3pp(2p + 2pp)
#6pp + 6ppp + 6ppp + 6pppp
# / pp
#6 + 12p + 6pp


#2p + 2pp * (6pp + 12ppp + 6pppp)
#2p(6pp + 12ppp + 6pppp) + 2pp(6pp + 12ppp + 6pppp)
#12ppp + 24pppp + 12ppppp + 12pppp + 24ppppp + 12pppppp
#12ppp + 36pppp + 36ppppp + 12pppppp
# / ppp
#12 + 36p + 36pp + 12ppp


from crypto.utilities import random_integer

P_SIZE = 33
# m size = 32
# 
def generate_key(p_size=P_SIZE, dimensions=3):
    p = random_integer(p_size)
    key = [p]
    for count in range(dimensions - 1):
        key.append(key[0] ** (count + 2))                
    return key
    
def encrypt(m, key, r_size=32):
    k_m = key[0]
    k_r = (item for item in key[1:])
    return (k_m * m) + sum(k_ri * random_integer(r_size) for k_ri in k_r)
    
def decrypt(ciphertext, key, depth=1):
    k_r = (item for item in reversed(key[1:]))  
    if depth > 1:
        ciphertext /= key[0]   
    for k_ri in k_r:
        ciphertext %= k_ri    
    return ciphertext / key[0]
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("squaremod", generate_key, encrypt, decrypt)
    key = generate_key()#[10, 100, 1000]
    m1 = 12389124981
    m2 = 1000129012
    ciphertext1 = encrypt(m1, key)
    ciphertext2 = encrypt(m2, key)
    test_function = lambda a, b: (a * b) + (a * b) + (b * b)
    ciphertext3 = test_function(ciphertext1, ciphertext2)
    plaintext = decrypt(ciphertext3, key, 2)
    assert plaintext == test_function(m1, m2) % key[0], (plaintext, m1, m2, test_function(m1, m2))
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    