# public parameter:
#     N := big_prime(100)
#     
# keygen:
#     k_{private} := random_integer(65)
#     k_{public} := inverse(k_{private}, N) * random_integer(32)
# 
# public key operation:
#     q := random_integer(32)
#     e := random_integer(32)
#     c := (k_{public} * q) + e mod N
#     output c, e
#     
# private key operation:
#     q_pie := c * k_{private} mod N
#     q := q_pie mod k_{private}
#     e := (q_pie - q) / k_{private}
#     output e  
from math import log

from os import urandom as random_bytes

N = 90539821999601667010016498433538092350601848065509335050382778168697877622963864208930434463149476126948597274673237394102007067278620641565896411613073030816577188842779580374266789048335983054644275218968175557708746520394332802669663

# utilities
def random_integer(size_in_bytes):
    return bytes_to_integer(bytearray(random_bytes(size_in_bytes)))
    
def bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modular_inverse(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise ValueError('modular inverse does not exist')
    else:
        return x % m
        
def generate_private_key(pi_size=65, n=N):
    pi = random_integer(pi_size)    
    assert log(n, 2) - log(pi, 2) > 256, log(n, 2) - log(pi, 2)
    return pi
    
def generate_public_key(private_key, q_size=32, n=N): 
    p = modular_inverse(private_key, n)
    pq = (p * random_integer(q_size)) % n  
    assert log(n, 2) - log(pq, 2) < 256
    assert log(n, 2) - log(modular_inverse(pq, n), 2) < 256, (log(n, 2), log(n - modular_inverse(pq, n), 2))
    return pq
    
def generate_keypair():
    private_key = generate_private_key()
    public_key = generate_public_key(private_key)
    return public_key, private_key
    
def exchange_key(public_key, q_size=32, n=N, e=random_integer(32), q=random_integer(32)):    
    e = random_integer(q_size)   
    q = random_integer(q_size)
    return ((public_key * q) + e) % n, e           
    
# pq + e == q + pie mod n    
    
def recover_key(ciphertext, private_key, n=N):
    pi = private_key
    q_pie = (pi * ciphertext) % n
    q = q_pie % pi
    pie = q_pie - q
    return pie / pi   
        
def break_qtpie(p, c, n):    
    x = n - p
    q, e = divmod(c, x)
    _c = (((x * q) + e) % n)
    assert _c == c, (_c, c)
    
    e -= 1
    _c = c - e
    q = (_c * modular_inverse(p, n)) % n    
    return q, e

        
# unit tests

def size_in_bits(integer):
    return int(log(integer or 1, 2)) + 1
    
def determine_key_size(key):    
    sizes = []
    try:
        sizes.append(size_in_bits(key))
    except TypeError:        
        for item in key:
            try:
                for _item in item:
                    sizes.append(size_in_bits(_item))
            except TypeError:
                sizes.append(size_in_bits(item))    
    return sizes
    
def test_exchange_key_recover_key_time(iterations, exchange_key, recover_key, public_key, private_key, key_size=32):   
    from timeit import default_timer
    
    if iterations == 0:
        return None    
    print("Exchanging {} {}-byte keys...".format(iterations, key_size))            
    before = default_timer()
    for count in range(iterations):                     
        ciphertext, key = exchange_key(public_key)
    after = default_timer()
    print("Time required: {}".format(after - before))
    
    print("Recovering {} {}-byte keys...".format(iterations, key_size))
    before = default_timer()
    for count in range(iterations):
        _key = recover_key(ciphertext, private_key)       
    after = default_timer()
    print("Time required: {}".format(after - before))        
    
def test_key_exchange(algorithm_name, generate_keypair, exchange_key, recover_key, 
                      iterations=1024, key_size=32):
    print("Beginning {} unit test...".format(algorithm_name))
    print("Generating keypair...")
    public_key, private_key = generate_keypair()
    print("...done")
    
    print("Validating correctness...")
    for count in range(iterations):
        ciphertext, key = exchange_key(public_key)
        _key = recover_key(ciphertext, private_key)
        if _key != key:
            raise BaseException("Unit test failed")
    print("...done")
    
    test_exchange_key_recover_key_time(iterations, exchange_key, recover_key, public_key, private_key, key_size)
    
    public_sizes = determine_key_size(public_key)
    private_sizes = determine_key_size(private_key)
    print("Public key size : {}".format(sum(public_sizes)))
    print("Private key size: {}".format(sum(private_sizes)))
    print("Ciphertext size : {}".format(size_in_bits(exchange_key(public_key)[0])))
    print("(sizes are in bits)")
    print("{} unit test passed".format(algorithm_name))
    
    
def test_exchange_key_recover_key():    
    test_key_exchange("qtpiekeyexchange", generate_keypair, exchange_key, recover_key, iterations=10000)
    
    print("Performing synthetic speed test (time does not include generation of random numbers)...")
    def exchange_key_speed_test(public_key, n=N, e=random_integer(32), q=random_integer(32)):    
        return ((public_key * q) + e) % n, e
    test_exchange_key_recover_key_time(10000, exchange_key_speed_test, recover_key, *generate_keypair(), key_size=32)
      
def test_break():
    N = 65537#big_prime(3)
   # assert is_prime(N)    
    p_i = 256
    p = modular_inverse(p_i, N)
    
    q = random_integer(1)
    e = random_integer(1)
    c = ((p * q) + e) % N
    print q, e, p_i * e < N
    _q, _e = break_qtpie(p, c, N)
    assert (q, e) == (_q, _e), ((q, e), (_q, _e))
    assert _e == e, (e, _e)
    
if __name__ == "__main__":
    test_break()
    test_exchange_key_recover_key()
    