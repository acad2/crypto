# (pq mod n) + e
# pi(pq + e)
# q + pie
    
from crypto.utilities import random_integer, modular_inverse, big_prime

N = 237101113813953620270969330806006025049399043603906391618149513923978155016751359482264083636087965399490743114196630417078735604274001945650905066750866971390108480654823545169092511717693803334393114236493094012755877745659575491957875748765320391467482773108323514023621912824003804321413424354515457303424595752111656852394666539070787141578702945317476271

from math import log

def generate_key(pi_size=65, n=N):
    pi = random_integer(pi_size)
    p = modular_inverse(pi, n)    
    return p, pi
    
def encrypt(m, key, q_size=32, n=N):    
    p, pi = key
    q = random_integer(q_size)
    pq = (p * q) % n        
    ciphertext = pq + m
    return ciphertext       
    
def decrypt(ciphertext, key, n=N):    
    p, pi = key       
    pie_q = (pi * ciphertext) % n
    q = pie_q % pi
    pie = pie_q - q
    return pie / pi    
    
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("qtpie", generate_key, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
   