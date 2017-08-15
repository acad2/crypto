# as1 + e1 + as2 + e2
# a(s1 + s2) + e1 + e2
# s1 + s2 + ai(e1 + e2)

# as1 + e1 * as2 + e2
# as2(as1 + e1) + e2(as1 + e1)
# as2as1 + as2e1 + as1e2 + e1e2
# s2as1 + s2e1 + s1e2 + aie1e2
# s2s1 + ai(s2e1 + s1e2 + aie1e2)   # 32 32 = 64       65    32 32   32 32   65 32 32 = 129

from crypto.utilities import big_prime, modular_inverse, random_integer

P = 125144020858170922360015647637191250572291861440634520045444855015071913026592383320678639688987480520765357605117520571545356531647532429286730524322955568279400181643779049961135732859753467157618205307940516239740454514364450841009902055414593461976279720413246157727739374086627018182928125081032880715103

def generate_secret_key(inverse_size=64, p=P):
    ai = random_integer(inverse_size)
    return modular_inverse(ai, p), ai
    
def encrypt(bit, key, s_size=31, e_size=31, p=P):
    a, ai = key
    s = random_integer(s_size)
    e = random_integer(e_size) << 1
    return ((a * s) + e + bit) % p
    
def decrypt(ciphertext, key, p=P):
    a, ai = key
    return (((ciphertext * ai) % p) / ai) & 1    
    
def test_encrypt_decrypt():
    key = generate_secret_key()
    iterations = 1024
    for count in range(iterations):
        bit = random_integer(1) & 1
        ciphertext = encrypt(bit, key)
        _bit = decrypt(ciphertext, key)
        if bit != _bit:
            raise Warning("Unit test failed.")
    
    for bit1 in range(2):
        for bit2 in range(2):
            ciphertext1 = encrypt(bit1, key)
            ciphertext2 = encrypt(bit2, key)
            ciphertext3 = ciphertext1 + ciphertext2
            ciphertext4 = ciphertext1 * ciphertext2
            plaintext3 = decrypt(ciphertext3, key)
            plaintext4 = decrypt(ciphertext4, key)
            assert plaintext3 == (bit1 ^ bit2)
            assert plaintext4 == (bit1 & bit2)
            
            
if __name__ == "__main__":
    test_encrypt_decrypt()
    