from crypto.utilities import random_integer, modular_inverse

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

def generate_pi(pi_size=65, n=N):
    pi = random_integer(pi_size)       
    return pi
    
def generate_pq(private_key, q_size=32, n=N): 
    p = modular_inverse(private_key, n)
    q = random_integer(q_size)
    pq = (p * q) % n      
    return pq, q, p * pq
    
def generate_keypair():
    pi = generate_pi()
    pq, q, p= generate_pq(pi)
    private_key = (pi, q, p)
    public_key = pq
    return public_key, private_key
    
def verify(signature, message, public_key, n=N):     
    q, e = signature
    _message = ((public_key * q) + e) % n
    if _message == (public_key * message) % n:
        return True
    else:
        return False

def sign(message, private_key, n=N):
    pi, r, key_e = private_key            
    pie_q = (pi * message) % n
    qr, e = divmod(pie_q, pi)
    return qr, (key_e * e) % n    
    
    #prq + e
    #
    #assert (qr * pi) + e == (pi * message) % n
    #q = (qr * modular_inverse(r, n)) % n 
    #assert ((q * r * pi) + e) % n == (pi * message) % n
                
    #c = (p * message) % n # qr + pe == message
    #c = (p * r * message) % n # p q r r + p p r e == p r message
    #assert ((p * q * r * r) + (p * p * r * e)) % n == (p * r * message) % n
  #  print log(qr, 2), log(e, 2)
     
    
def test_sign_verify():
    from unittesting import test_sign_verify    
    test_sign_verify("signaturetest", generate_keypair, sign, verify, iterations=10000, message_size=64)
        
if __name__ == "__main__":
    test_sign_verify()
    