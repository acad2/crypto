from crypto.utilities import random_integer, modular_inverse, big_prime

N = big_prime(100)# 225241569627851595350838763681785906724428697290141769801417622676568654297666710841212749141365354701580553980093849901004039773586835061419475389683261733366356402019584392943366827909987225051679644735050009473774055785709735868550935917252113327365761454283845798784266844015580824147815866496951983755425002748038076897447553238870256861001436001898169

def generate_key(p_size=33, k_size=64, n=N):
    p0 = random_integer(p_size)
    k = random_integer(k_size)
    return (p0, k, modular_inverse(k, n))
    
# pm1 + e1 + pm2 + e2
# p(m1 + m2) + (e1 + e2)
# pm2 + e2

def encrypt(m, key, r_size=31, n=N):    
    p0, k, ki = key         
    ciphertext = (p0 * m) + random_integer(r_size)     #      33 + 32 + 32 = 97 
    ciphertext = (ciphertext * k) % n
    return ciphertext
    
def decrypt(ciphertext, key, n=N):
    p0, k, ki = key
    ciphertext = (ciphertext * ki) % n
    e = ciphertext % p0
    p0m = ciphertext - e
    return p0m / p0
        
def test_encrypt_decrypt():
    from unittesting import test_symmetric_encrypt_decrypt
    test_symmetric_encrypt_decrypt("modular3", generate_key, encrypt, decrypt, iterations=10000)
    
if __name__ == "__main__":
    test_encrypt_decrypt()    
    