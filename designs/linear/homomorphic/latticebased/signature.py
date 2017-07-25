import epqcrypto.asymmetric.keyexchange
from epqcrypto.utilities import modular_inverse

P = epqcrypto.asymmetric.keyexchange.P

def generate_keypair(p=P):
    public_key, private_key = epqcrypto.asymmetric.keyexchange.generate_keypair()
    ai, a, b, c = private_key
    private_key = (ai, a, modular_inverse(b, p), c)
    return public_key, private_key
       
def sign(message_digest, private_key, p=P):
    ai, a, bi, c = private_key
    sb_aics_e = (ai * message_digest) % p
    s = ((sb_aics_e % ai) * bi) % p    
    e = (sb_aics_e / ai - (s * c)) % p
    return s, e
    
from math import log    
def verify(signature, message_digest, public_key, p=P):
    s, e = signature        
    if ((public_key * s) + e) % p == message_digest:#constant_time_comparison(((public_key * s) + e) % p, message_digest):
        return True
    else:
        return False        
        
def test_sign_verify():
    from epqcrypto.unittesting import test_sign_verify
    test_sign_verify("epqcrypto.signature", generate_keypair, sign, verify, iterations=100000, message_size=129)
    
if __name__ == "__main__":    
    test_sign_verify()
    