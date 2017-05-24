# encrypt:
#   c := p * (kq + m) mod n
# decrypt:
#   p := c * pi mod n mod k

# pq1 mod n
# pq2 mod n
# ppq1q2 mod n

#(kq1 + m1) * (kq2 + m2)
# kkq1q2 + kq2m1 + kq1m1 + m1m2

#kq2(kq1 + m1) + m2kq1 + m1m2
#kkq1q2 + kq2m1 + m2kq1 + m1m2

# pq + e
# e must be smaller then p
# q should be much larger then p
# therefore it is better to store the data in q then e
# 0 is a problem for in either place, q, or e
# encrypt message to randomize it before it using as q
from crypto.utilities import big_prime, random_integer, modular_inverse, size_in_bits

def generate_key(p_size=33, k_size=33, n_size=67):
    p = big_prime(p_size)
    k = random_integer(k_size)
    n = random_integer(n_size)
   # assert size_in_bits(p) + size_in_bits(k) < size_in_bits(n)
    return p, k, n
    
def encrypt(m, key, q_size=32):
    p, k, n = key
    q = random_integer(q_size)     
    return (p * ((k * q) + m)) % n
        
def decrypt(ciphertext, key, operation_count=1):
    p, k, n = key       
    return ((ciphertext * modular_inverse(p ** operation_count, n)) % n) % k
        
def test_encrypt_decrypt():
    key = generate_key()
    for message in range(256):
        message = random_integer(31)
        ciphertext = encrypt(message, key)
        plaintext = decrypt(ciphertext, key)
        assert plaintext == message, (plaintext, message)
    c1 = encrypt(10, key)
    c2 = encrypt(20, key)
    assert decrypt(c1 + c2, key) == 30
       
    sizes = [size_in_bits(item) for item in key]
    print("Key size: p: {}; k: {}; n: {}; total: {}".format(*sizes + [sum(sizes)]))
    print("Ciphertext size: {}".format(size_in_bits(ciphertext)))
    print("modular encrypt/decrypt unit test passed")
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    