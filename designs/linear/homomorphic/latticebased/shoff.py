# as1 + e1 + as2 + e2
# a(s1 + s2) + e1 + e2
# s1 + s2 + ai(e1 + e2)

# as1 + e1 * as2 + e2
# as2(as1 + e1) + e2(as1 + e1)
# as2as1 + as2e1 + as1e2 + e1e2
# s2as1 + s2e1 + s1e2 + aie1e2
# s2s1 + ai(s2e1 + s1e2 + aie1e2)   # 32 32 = 64       65    32 32   32 32   65 32 32 = 129   + 65 
#                                     32 32  64        65    32 16   32 16   65 16 16 = 97
# 64 + 32 = 96


# s2s1 + ai(s2e1 + s1e2 + ai)       64      65   32 16   65    = 130
from crypto.utilities import big_prime, modular_inverse, random_integer

P = 15624554725589300108028359420813649421358687587335913932516791047818722590040554599807493933062956667312163710471909420935282181282705895744425684147635747355088535662464428923668351746572873233876824347271520785884923390213864707521193624103726993925639378366518319658181903836973013201204557500590779473711073416857030483827553309270379961411727642118205474395101535197662351883169453

def generate_secret_key(inverse_size=64, p=P):
    ai = random_integer(inverse_size)
    return modular_inverse(ai, p), ai
    
def encrypt(bit, key, s_size=31, e_size=16, p=P):
    a, ai = key    
    s = (random_integer(s_size) >> 1) << 1    
    e = random_integer(e_size)
    return ((a * (s + bit)) + e) % p
    
def decrypt(ciphertext, key, p=P, depth=1):
    a, ai = key
    return (((ciphertext * pow(ai, depth, p)) % p) % ai) & 1
        
def test_encrypt_decrypt():
    key = generate_secret_key()
    iterations = 1024
    for count in range(iterations):
        bit = random_integer(1) & 1
        ciphertext = encrypt(bit, key)
        _bit = decrypt(ciphertext, key)
        if bit != _bit:
            raise Warning("Unit test failed.")
    
    for count in range(iterations):
        for bit1 in range(2):
            for bit2 in range(2):
                assert bit1 in (0, 1)
                assert bit2 in (0, 1)
                ciphertext1 = encrypt(bit1, key)
                ciphertext2 = encrypt(bit2, key)
                ciphertext3 = ciphertext1 + ciphertext2
                ciphertext4 = ciphertext1 * ciphertext2
                plaintext3 = decrypt(ciphertext3, key)
                plaintext4 = decrypt(ciphertext4, key, depth=2)
                assert plaintext3 == (bit1 ^ bit2)
                assert plaintext4 == (bit1 & bit2), (bit1, bit2)
            
            
if __name__ == "__main__":
    test_encrypt_decrypt()
    