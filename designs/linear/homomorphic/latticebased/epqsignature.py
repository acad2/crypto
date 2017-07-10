#t <- k1 * m mod P
#qr <- t mod k1
#pie <- t - qr mod P
#q <- qr * k2 mod P
#e <- (pie * k3) mod P

from crypto.utilities import random_integer, modular_inverse

P = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

def generate_key(key_size=65):
    """ usage: generate_key(key_size=KEY_SIZE) => random integer
    
        Returns a random integer. 
        key_size should be set such that log(key, 2) + log(e, 2) < log(p, 2), as well as log(key, 2) > log(rk, 2) + log(q, 2)
        For 32-byte rk, e, q values, key should be 65 bytes, and p should be 98 bytes.
        If the key is not large enough, it cannot be used to obtain q or e
        If the key is too large, it cannot be used to obtain q or e
        It is recommended to use the generate_keypair function to generate a public/private keypair"""
    key = random_integer(key_size)       
    return key
    
def generate_encrypted_inverse_key(private_key, r_size=32, p=P): 
    """ usage: generate_encrypted_inverse_key(private_key, r_size=R_SIZE, 
                                              p=P) => ek, dk, rk
                                              
        Returns three integers.
        ek is the public key for the trapdoor function.
        dk and rk are used in the private key for the trapdoor function.
        It is recommended to use the generate_keypair function to generate a public/private keypair"""
    inverse_key = modular_inverse(private_key, p)
    randomizing_key = random_integer(r_size)
    encrypted_inverse_key = (inverse_key * randomizing_key) % p  
    return encrypted_inverse_key, inverse_key, modular_inverse(randomizing_key, p)
    
def generate_keypair(key_size=65, r_size=32, p=P):
    """ usage: generate_keypair(key_size=KEY_SIZE, r_size=R_SIZE, p=P) => public_key, private_key
    
        Returns a public key and a private key.
        A private key is required to use the sign function to produce a digital signature on some data.
        A public key is required to use the verify function to validate a digital signature on some data. """
    key = generate_key(key_size)
    ek, dk, rk = generate_encrypted_inverse_key(key, r_size, p)
    private_key = (key, dk, rk)
    public_key = ek
    return public_key, private_key
    
def verify(signature, message, public_key, p=P):     
    """ usage: verify(signature, message, public_key, p=P) => True or False
        
        If the signature on the message verifies with the public key, then returns True.
        Otherwise, returns False. """
    q, e = signature
    _message = ((public_key * q) + e) % p
    if _message == message:        
        return True
    else:
        return False
     
def sign(message, private_key, p=P):
    """ usage: sign(message, private_key, p=P) => s1, s2
    
        Returns two integers that constitute a digital signature on message.
        The output of sign can be passed to the verify function to validate a signature on the message. """
    key, dk, rk = private_key       
    pie_qr = (key * message) % p  
    qr = pie_qr % key   
    pie = pie_qr - qr     
    return (qr * rk) % p, (pie * dk) % p

def test_sign_verify():
    from unittesting import test_sign_verify    
    test_sign_verify("signaturetest", generate_keypair, sign, verify, iterations=10000, message_size=64)
        
if __name__ == "__main__":
    test_sign_verify()
    