import hashlib
from hmac import compare_digest

from crypto.utilities import random_integer, modular_inverse, bytes_to_integer, integer_to_bytes

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

def hash_function(message, algorithm=lambda data: hashlib.sha256(data).digest(), size=32):
    return bytes_to_integer(bytearray(algorithm(integer_to_bytes(message, size))))
    
def generate_pi(pi_size=65, n=N):
    pi = random_integer(pi_size)       
    return pi
    
def generate_pq(private_key, q_size=32, n=N): 
    p = modular_inverse(private_key, n)
    q = random_integer(q_size)
    pq = (p * q) % n      
    return pq, modular_inverse(q, n), p
    
def generate_keypair():
    pi = generate_pi()
    pq, q, p = generate_pq(pi)
    private_key = (pi, q, p)
    public_key = pq
    return public_key, private_key
    
def pad_message(message, hash_function, size=256):    
    _message1 = hash_function(message)
    _message2 = hash_function(_message1)
    message = (_message2 << size) | _message1
    return message
    
def verify(signature, message, public_key, n=N, hash_function=hash_function, size=256):     
    q, e = signature    
    _message = ((public_key * q) + e) % n
    if _message == pad_message(message, hash_function, size):        
        return True
    else:
        return False
        
def sign(message, private_key, n=N, hash_function=hash_function, size=256):
    pi, ri, p = private_key       
    message = pad_message(message, hash_function, size)    
    
    pie_qr = (pi * message) % n    
    qr = pie_qr % pi    
    pie = pie_qr - qr     
    return (qr * ri) % n, (pie * p) % n

def test_sign_verify():
    from unittesting import test_sign_verify    
    test_sign_verify("signaturetest", generate_keypair, sign, verify, iterations=10000, message_size=64)
        
if __name__ == "__main__":
    test_sign_verify()
    