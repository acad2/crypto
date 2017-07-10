# broken by lattice reduction

from os import urandom

from crypto.utilities import gcd, bytes_to_integer, integer_to_bytes

# m1r1 + k, m1r2 + k
# m2r3 + k, m2r4 + k
# m1r1 + m2r3 + 2k, m1r2 + m2r4 + 2k


# xr1 + y, xr2 + y
# xr3 + y, xr4 + y
# xr5 + y, xr6 + y
# ...



def encrypt(message, key):
    assert message is not 0
    r1, r2 = random_bits(count=256), random_bits(count=256)
    while True:        
        if gcd(r1, r2) == 1:
            break
        r1, r2 = random_bits(count=256), random_bits(count=256)
    c1 = (message * r1) + key
    c2 = (message * r2) + key
    return c1, c2
    
def decrypt(ciphertext, key):
    c1, c2 = ciphertext
    c1 -= key
    c2 -= key
    return gcd(c1, c2)
    
def random_bits(count=None):
    assert count is not None
    assert not count % 8
    return bytes_to_integer(bytearray(urandom(count / 8)))
    
def test_encrypt_decrypt():
    message = "Testing!a;skldfp9a8ysdfkaljsdnlkwajerp98ydpf98yh1;i3oh4io9u3hrmou1 9pr1rpu91g3 rui1g riup1grp9u1gt5p91" * 300 # wtf? how does this work?
    m = bytes_to_integer(bytearray(message))
    key = 1
    #outputs = []
    #for count in range(1, 1024 + 1):     
    #    plaintext = decrypt(encrypt(m, key), key)
    #    if plaintext == m:
    #        outputs.append(1)
    #    else:
    #        outputs.append(0)
    #outputs = str(outputs)
    #successes, failures = outputs.count('1'), outputs.count('0')
    #print("Successes: {}; Failures: {};".format(successes, failures))
    
    ciphertext = encrypt(m, key)
    _ciphertext = ''.join(bytes(integer_to_bytes(item, 32)) for item in ciphertext)
    print("Ciphertext: ({} bytes) {}".format(len(_ciphertext), _ciphertext))
    plaintext = decrypt(ciphertext, key)
    print("Recovered plaintext: ({} bytes) {}".format(len(message), integer_to_bytes(plaintext, len(message))))
    assert plaintext == m, (plaintext, m)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    