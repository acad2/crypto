from crypto.utilities import random_integer, modular_inverse

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

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
    
def verify(signature, message, public_key, n=N):     
    q, e = signature
    _message = ((public_key * q) + e) % n
    if _message == message:        
        return True
    else:
        return False

        
#t <- k1 * m mod P
#qr <- t mod k1
#pie <- t - qr mod P
#q <- qr * k2 mod P
#e <- (pie * k3) mod P
     
# ((k1m mod P) mod k1) * k2     
# ((k1m mod P) - ((k1m mod P) mod k1)) * k3

# (x mod k1) * k2
# (x - (x mod k1)) * k3

# y k2
# (x - y) * k3
# k3x - k3y

# k1k2r + k2e1
# (pq + e2 - k1r + e1) * k3
#

def sign(message, private_key, n=N):
    pi, ri, p = private_key       
    pie_qr = (pi * message) % n    
    qr = pie_qr % pi
    assert qr == message
    pie = pie_qr - qr     
    return (qr * ri) % n, (pie * p) % n

def test_sign_verify():
    from unittesting import test_sign_verify    
    test_sign_verify("signaturetest", generate_keypair, sign, verify, iterations=10000, message_size=64)
        
if __name__ == "__main__":
    test_sign_verify()
    