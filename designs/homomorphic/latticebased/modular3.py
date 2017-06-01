from crypto.utilities import random_integer, modular_inverse

N = 3829881147097778858647394886316944143293149023372194777360468077735653292768022339084241839359823240104933227594841312421065065039907178240549238840711149806558383153854054449649950417569068440878117635853575899915555186786494707753033755268037495750694748657840993006529279020406087411042593779142841123450891954686901858279502570545396703797709563170741108758876834071401447569741099879804413762947643098597140305177613703429903548156253829413794215300563338172508545225463744523881189095851510594725792142162903185405793580759947669586439

def generate_key(p_size=33, k_size=32, n=N):
    p0, p1, p2 = random_integer(p_size * 3), random_integer(p_size), random_integer(p_size)
    k = n - random_integer(k_size)
    return (p0, p1, p2, k, modular_inverse(k, n))
    
def encrypt(m, key, r_size=16, n=N):    
    p0, p1, p2, k, ki = key
    q0 = (p2 * random_integer(r_size)) + m
    q1 = random_integer(r_size)      
    ciphertext = (p0 * q0) + (p1 * q1)
    assert ciphertext % p0 == (p1 * q1)         
    ciphertext = (ciphertext * k) % n
    return ciphertext
    
def decrypt(ciphertext, key, n=N):
    p0, p1, p2, k, ki = key
    ciphertext = (ciphertext * ki) % n
    p1q1 = ciphertext % p0
    p0q0 = ciphertext - p1q1
    q0 = p0q0 / p0
    return q0 % p2   
    
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular3", generate_key, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()    
    