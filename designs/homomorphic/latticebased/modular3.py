from crypto.utilities import random_integer, modular_inverse

N = 225241569627851595350838763681785906724428697290141769801417622676568654297666710841212749141365354701580553980093849901004039773586835061419475389683261733366356402019584392943366827909987225051679644735050009473774055785709735868550935917252113327365761454283845798784266844015580824147815866496951983755425002748038076897447553238870256861001436001898169

def generate_key(p_size=33, k_size=32, n=N):
    p0, p1, p2 = random_integer(100), random_integer(16), random_integer(p_size)
    k = n - random_integer(k_size)
    return (p0, p1, p2, k, modular_inverse(k, n))
    
def encrypt(m, key, r_size=16, n=N):    
    p0, p1, p2, k, ki = key
    q0 = random_integer(r_size)      
    q1 = (p2 * random_integer(r_size)) + m  # 50 bytes if p2 == 33, r == 16, m adds +1
    ciphertext = (p0 * q0) + (p1 * q1)     #       16 + 50 = 66 + 32 = 98
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
    