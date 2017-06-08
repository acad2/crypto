from math import log

from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

#1 + 33 + 32 = 66

# prq + e
# q + pirie

#65 + 97 + 32 =
def generate_private_key(pi_size=65, n=N):
    pi = random_integer(pi_size)    
    assert log(n, 2) - log(pi, 2) > 256, log(n, 2) - log(pi, 2)
    return pi
    
def generate_public_key(private_key, q_size=32, n=N): 
    p = modular_inverse(private_key, n)
    pq = (p * random_integer(q_size)) % n  
    assert log(n, 2) - log(pq, 2) < 256
    assert log(n, 2) - log(modular_inverse(pq, n), 2) < 256, (log(n, 2), log(n - modular_inverse(pq, n), 2))
    return pq
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def exchange_key(public_key, q_size=32, n=N): 
    assert n == N
    e = random_integer(q_size)        
    return ((public_key * random_integer(q_size)) + e) % n, e % n
        
    # pq + e == q + pie mod n
    
def recover_key(ciphertext, private_key, n=N):
    pi = private_key
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    pie = pie_q - q
    return pie / pi   
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange
    test_key_exchange("qtpiekeyexchange", generate_keypair, exchange_key, recover_key, iterations=10000)
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
   