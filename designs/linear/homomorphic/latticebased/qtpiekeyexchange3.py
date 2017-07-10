from math import log

from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

N = 1097481826419894541207840799804032417985294214629938501221928405622346973220038221530494785494275370404572284591896436243

def generate_pi(pi_size=33, n=N):    
    pi = random_integer(pi_size)        
    return pi
    
def generate_pq(private_key, q_size=16, n=N): 
    p = modular_inverse(private_key, n)
    q = random_integer(q_size)
    pq = (p * q) % n          
    return pq, q
    
def generate_keypair():
    pi = generate_pi()
    pq, q = generate_pq(pi)
    public_key = pq
    private_key = (pi, q)
    return public_key, private_key
    
def exchange_key(public_key, n=N): 
    assert n == N
    q = random_integer(16)
    e = random_integer(16)        
    secret = (q + e) % n
    return ((public_key * q) + e) % n, secret 
    
def recover_key(ciphertext, private_key, n=N):
    pi, r = private_key
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    pie = pie_q - q
    e = pie / pi
    secret = ((q / r) + e) % n
    return secret
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange, test_exchange_key_recover_key_time
    test_key_exchange("qtpiekeyexchange2", generate_keypair, exchange_key, recover_key, iterations=10000, key_size=16)

    print("Performing synthetic speed test (time does not include generation of random numbers)...")
    def exchange_key_speed_test(public_key, e=random_integer(32), q=random_integer(32), n=N):    
        return ((public_key * q) + e) % n, e
    test_exchange_key_recover_key_time(10000, exchange_key_speed_test, recover_key, *generate_keypair(), key_size=16)
    
    
if __name__ == "__main__":
    test_exchange_key_recover_key()
   