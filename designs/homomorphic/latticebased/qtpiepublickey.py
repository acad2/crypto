from crypto.utilities import random_integer, modular_inverse, big_prime

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

from math import log

def generate_private_key(pi_size=65, n=N):
    pi = random_integer(pi_size)    
    p = modular_inverse(pi, n)   
    return p, pi
    
def generate_public_key(private_key, q_size=32, n=N): 
    p, pi = private_key
    pq = (p * random_integer(q_size)) % n
    return pq
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def encrypt(m, public_key, q_size=32, n=N):        
    q = random_integer(q_size)
    pq = (public_key * q) % n        
    ciphertext = pq + m
    return ciphertext       
    
def decrypt(ciphertext, private_key, n=N):    
    p, pi = private_key
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    pie = pie_q - q
    return pie / pi    
    
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("qtpiepublickey", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
   