from crypto.utilities import random_integer, modular_inverse

N = 7150657033310474808113177160235494014128997703462478576505146107418033787849896037600989180579955158321238652341541336195700347159356616132042629495013432825979031033815661119880589370580083292207453683127109654619028474838812164032534900814142443210396797677468432367060471028670356333360683581746870668988272677413891709904181170771056492665825728796309717412663251345246956175179505257619703

def generate_key(p_size=33, k_size=32, n=N):
    p0, p1, p2 = random_integer(115), random_integer(p_size), random_integer(p_size)
    k = n - random_integer(k_size)
    return (p0, p1, p2, k, modular_inverse(k, n))
    
def encrypt(m, key, r_size=16, n=N):    
    p0, p1, p2, k, ki = key
    q1 = (p2 * random_integer(r_size)) + m # 50 bytes if p2 == 33, r == 16
    q0 = random_integer(r_size)      
    ciphertext = (p0 * q0) + (p1 * q1)     # 82 or 135 bytes
    ciphertext = (ciphertext * k) % n
    return ciphertext
    
def decrypt(ciphertext, key, n=N):
    p0, p1, p2, k, ki = key
    ciphertext = (ciphertext * ki) % n
    p1q1 = ciphertext % p0
    return (p1q1 / p1) % p2  
    
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular3", generate_key, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()    
    