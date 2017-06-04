# "convergent", authenticated, deterministic variant of qtpiepublickey
from math import log
import hashlib

from crypto.utilities import random_integer, modular_inverse, integer_to_bytes, bytes_to_integer, size_in_bits

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

def generate_private_key(pi_size=65, n=N):
    pi = random_integer(pi_size)    
    p = modular_inverse(pi, n)   
    assert log(n, 2) - log(pi, 2) > 256, log(n, 2) - log(pi, 2)
    return p, pi
    
def generate_public_key(private_key, q_size=32, n=N): 
    p, pi = private_key
    pq = (p * random_integer(q_size)) % n  
    assert log(n, 2) - log(pq, 2) < 256
    assert log(n, 2) - log(modular_inverse(pq, n), 2) < 256, (log(n, 2), log(n - modular_inverse(pq, n), 2))
    return pq
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def prf(integer, _hash=lambda data: hashlib.sha256(data).digest()):
    _bytes = integer_to_bytes(integer, 100)# size_in_bits(integer) * 8)    
    psuedo_random_bytes = _hash(_bytes)
    return bytes_to_integer(bytearray(psuedo_random_bytes))    
        
def encrypt(m, public_key, n=N, prf=prf): 
    return ((public_key * prf(m)) + m) % n
        
def decrypt(ciphertext, private_key, n=N, prf=prf):    
    p, pi = private_key
    
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi    
    
    pie = pie_q - q
    m = pie / pi  
    _q = prf(m)
    if q % _q == 0:
        return m
    else:
        raise ValueError("Invalid Ciphertext")
        
def test_encrypt_decrypt():
    from unittesting import test_asymmetric_encrypt_decrypt
    test_asymmetric_encrypt_decrypt("qtpiepublickey", generate_keypair, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
   