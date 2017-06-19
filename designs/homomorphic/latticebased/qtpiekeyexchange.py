# public parameter:
#     N := big_prime(100)
#     
# keygen:
#     k_{private} := random_integer(65)
#     k_{public} := inverse(k_{private}, N) * random_integer(32)
# 
# public key operation:
#     q := random_integer(32)
#     e := random_integer(32)
#     c := (k_{public} * q) + e mod N
#     output c, e
#     
# private key operation:
#     q_pie := c * k_{private} mod N
#     q := q_pie mod k_{private}
#     e := (q_pie - q) / k_{private}
#     output e  
from math import log

from crypto.utilities import random_integer, modular_inverse

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663
 
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
    
def exchange_key(public_key, q_size=32, n=N, e=random_integer(32), q=random_integer(32)):    
    e = random_integer(q_size)   
    q = random_integer(q_size)
    return ((public_key * q) + e) % n, e           
    
# pq + e == q + pie mod n    
    
def recover_key(ciphertext, private_key, n=N):
    pi = private_key
    q_pie = (pi * ciphertext) % n
    q = q_pie % pi
    pie = q_pie - q
    return pie / pi   
    
def test_exchange_key_recover_key():
    from unittesting import test_key_exchange, test_exchange_key_recover_key_time
    test_key_exchange("qtpiekeyexchange", generate_keypair, exchange_key, recover_key, iterations=10000)
    
    print("Performing synthetic speed test (time does not include generation of random numbers)...")
    def exchange_key_speed_test(public_key, n=N, e=random_integer(32), q=random_integer(32)):    
        return ((public_key * q) + e) % n, e
    test_exchange_key_recover_key_time(10000, exchange_key_speed_test, recover_key, *generate_keypair(), key_size=32)
   
   
def break_exchange_key(ciphertext, public_key, n=N):
    pn = n - public_key
    ciphertext_n = n - ciphertext
    q, e = divmod(ciphertext_n, pn)
    #q = n - q
   # e = pn - e
    #q += 1    
    
    return q, e

def test_break_exchange_key():
    #public = random_integer(1)
    #n = 257
    #qs = [random_integer(1) & 15 for count in range(4)]
    #points = [(public * qs[count]) % n for count in range(4)]    
    #print public
    #print qs
    #print points
    #_qes = [break_exchange_key(points[index], public, n) for index in range(4)]
    #print _qes
    #q = random_integer(1) & 15
    #e = 0#random_integer(1) & 15
    #c = ((public * q) + e) % n
    #_q, _e = break_exchange_key(c, public, n) 
    #
    #assert (_q, _e) == (q, e), (_q, _e, q, e)
    
    public, private = generate_keypair()    
    while True:
        ciphertext, secret = exchange_key(public)
        q, e = break_exchange_key(ciphertext, public)
        if secret == e:
            print "is qtpie broken?"
    
    
    
if __name__ == "__main__":
    #test_break_exchange_key()
    test_exchange_key_recover_key()
    