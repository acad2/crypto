from math import log

from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

#1 + 33 + 32 = 66

# prq + e
# q + pirie

#65 + 97 + 32 =


#pq1 + e1 * (pq2 + e2)
#pq1(pq2 + e2) + e1(pq2 + e2)
#ppq1q2 + pq1e2 + pq2e1 + e1e2
 
# pq1q2 + q1e2 + q2e1 + pie1e2


#pq1 + e1 + pq2 + e2
#p(q1 + q2) + e1 + e2
 
def generate_pi(pi_size=65, n=N):
    pi = random_integer(pi_size)    
    assert log(n, 2) - log(pi, 2) > 256, log(n, 2) - log(pi, 2)
    return pi
    
def generate_pq(private_key, q_size=32, n=N): 
    p = modular_inverse(private_key, n)
    q = random_integer(q_size)
    pq = (p * q) % n  
    assert log(n, 2) - log(pq, 2) < 256
    assert log(n, 2) - log(modular_inverse(pq, n), 2) < 256, (log(n, 2), log(n - modular_inverse(pq, n), 2))
    return pq, q
    
def generate_keypair():
    pi = generate_pi()
    pq, q = generate_pq(pi)
    public_key = pq
    private_key = (pi, q)
    return public_key, private_key
    
def exchange_key(public_key, q_size=32, e_size=32, n=N): 
    assert n == N
    q = random_integer(q_size)
    e = random_integer(e_size)        
    return ((public_key * q) + e) % n, q           
    
def recover_key(ciphertext, private_key, n=N):
    pi, r = private_key
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    return q / r
        
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange, test_exchange_key_recover_key_time
    test_key_exchange("qtpiekeyexchange2", generate_keypair, exchange_key, recover_key, iterations=10000)

    print("Performing synthetic speed test (time does not include generation of random numbers)...")
    def exchange_key_speed_test(public_key, e=random_integer(32), q=random_integer(32), n=N):    
        return ((public_key * q) + e) % n, e
    test_exchange_key_recover_key_time(10000, exchange_key_speed_test, recover_key, *generate_keypair())
    
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
   