from crypto.utilities import random_integer, modular_inverse, big_prime
# s1(ab) + s2(ac)
# a(bs1 + cs2)
# bs1 + cs2
# s1 + bics2     32  33 32 32  =      97

P = 9539921445519523889033033905749357596361808280071308047274771110653439168206920575832027609615885769827646233687565094939619495879018036671095885764287274804429870778183573391723581274241004062238260157787336021415153379723260890676942841

def generate_private_key(inverse_size=33):
    ai = random_integer(inverse_size)
    bi = random_integer(inverse_size)
    return ai, bi
    
def generate_public_key(private_key, c_size=32, p=P):
    ai, bi = private_key
    a = modular_inverse(ai, p)
    b = modular_inverse(bi, p)
    c = random_integer(c_size)    
    public_key = ((a * b) % p, (a * c) % p)
    return public_key
    
def generate_keypair(inverse_size=33, c_size=32, p=P):
    private_key = generate_private_key(inverse_size)
    public_key = generate_public_key(private_key, c_size, p)
    return public_key, private_key
    
def exchange_key(public_key, s_size=32, p=P):
    s1 = random_integer(s_size)
    s2 = random_integer(s_size)    
    p1, p2 = public_key
    ciphertext = ((p1 * s1) + (p2 * s2)) % p
    return ciphertext, s1
    
def recover_key(ciphertext, private_key, p=P):
    #a(bs1 + cs2)
    #bs1 + cs2
    #s1 + bics2    
    ai, bi = private_key
    bs1_cs2 = (ciphertext * ai) % p
    s1_bics2 = (bi * bs1_cs2) % p
    return s1_bics2 % bi    
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpie2pointm", generate_keypair, exchange_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
    