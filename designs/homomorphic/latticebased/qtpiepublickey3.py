raise NotImplementedError("q needs to be randomized")
from math import log

from crypto.utilities import random_integer, modular_inverse, big_prime, modular_subtraction

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663905398219996016670100164984335380923506018480655093350503827781686978776229638642089304344631494761269485972746732373941020070672786206415658964116130730308165771888427795803742667890483359830546442752189681755577087465203943328026696639053982199960166701001649843353809235060184806550933505038277816869787762296386420893043446314947612694859727467323739410200706727862064156589641161307303081657718884277958037426678904833598305464427521896817555770874652039433280266966390539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

#1 + 33 + 32 = 66

# prq + e
# q + pirie

#65 + 97 + 32 =


#pq1 + e1 * (pq2 + e2)
#pq1(pq2 + e2) + e1(pq2 + e2)
#ppq1q2 + pq1e2 + pq2e1 + e1e2
 
# prrq1q2 + rq1e2 + rq2e1 + e1e2


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
    
def encrypt(q, public_key, e_size=32, n=N): 
    assert n == N
    e = random_integer(e_size)    
    return ((public_key * q) + e) % n
    
def decrypt(ciphertext, private_key, n=N, operation_count=1):
    pi, r = private_key
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    return q / (r ** operation_count)
        
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("qtpiepublickey3", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
   