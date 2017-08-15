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
from crypto.utilities import big_prime, modular_inverse, random_integer

P = 8363611929314843244418165732845160056768294644866481880237909314846651059847284651413665012081896746055299061590412365155982082474810102431562762875636969078460629865966846650825275231130759827473726741493263396508468347714716339436419349621236908729931834374702368532052145485188537111220111655544440468633832035255001492144293648312738599613984346148053732526911015158952748202109995751413003478446294390177334313597715254457410975046926747259041095335143226730279

def generate_secret_key(inverse_size=65, p=P):
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
    