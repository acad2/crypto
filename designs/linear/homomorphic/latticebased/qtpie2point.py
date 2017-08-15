from crypto.utilities import random_integer, modular_inverse, big_prime

# s1(a + b) + s2(a + c)
# s1a + s1b + s2a + s2c
# a(s1 + s2) + s1b + s2c
# s1 + s2 + ai(s1b + s2c) # 33 + 64 = 97
P = 19064325421643658013629586464318852023031914148829110707126861601516538388394515806752268301569374534808104205745147766334975994270147373365664347239668149405586891723968596341602867795686857510445867404981702440410011904167729751612822279

def generate_private_key(ai_size=33):
    ai = random_integer(34) #| ((random_integer(1) & 1) << (ai_size * 8))
    return ai
    
def generate_public_key(private_key, b_size=32, c_size=32, p=P):
    a = modular_inverse(private_key, p)
    b = random_integer(b_size)
    c = random_integer(c_size) 
    print format(a, 'b').zfill(256)[:80]
    print format((a + b) % p, 'b').zfill(256)[:80]
    print format((a + c) % p, 'b').zfill(256)[:80]
    public_key = ((a + b) % p, (a + c) % p)
    return public_key
    
def generate_keypair(ai_size=32, b_size=32, c_size=32, p=P):
    private_key = generate_private_key(ai_size)
    public_key = generate_public_key(private_key, b_size, c_size, p)
    return public_key, private_key
    
def exchange_key(public_key, s_size=32, p=P):
    s1 = random_integer(s_size)
    s2 = random_integer(s_size)    
    p1, p2 = public_key
    ciphertext = ((p1 * s1) + (p2 * s2)) % p
    return ciphertext, (s1 + s2) % p
    
def recover_key(ciphertext, private_key, p=P):
    #s1 + s2 + ai(s1b + s2c)
    return ((ciphertext * private_key) % p) % private_key
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpie2point", generate_keypair, exchange_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    