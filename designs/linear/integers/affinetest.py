from os import urandom

def egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modular_inverse(a, m):
    g, x, y = egcd(a, m)
    if g != 1:
        raise Exception('modular inverse does not exist')
    else:
        return x % m
    
def modular_subtraction(a, b, modulus):
    return (modulus + (a - b)) % modulus
    
def generate_key(size):
    key = bytearray(size)
    for index in range(size):        
        while True:
            byte = ord(urandom(1))
            try:
                modular_inverse(byte, 256)
            except Exception:
                continue
            else:
                break
        key[index] = byte
    return key
        
def encrypt(data, key, modulus=256):      
    randomizer = key[-1]
    for index, byte in enumerate(data):        
        byte = (((key[index] * byte) % modulus) + randomizer) % modulus        
        randomizer = byte + index        
        data[index] = byte
    
def decrypt(data, key, modulus=256):    
    for index in reversed(range(1, len(data))):
        byte = data[index]    
        randomizer = data[index - 1] + (index - 1)        
        byte = (modular_inverse(key[index], modulus) * modular_subtraction(byte, randomizer, modulus)) % modulus        
        data[index] = byte
    randomizer = key[-1]
    data[0] = (modular_inverse(key[0], modulus) * modular_subtraction(data[0], randomizer, modulus)) % modulus
    
def test_encrypt_decrypt():
    data = bytearray(range(8))
    _data = data[:]
    key = generate_key(8 + 1)
    encrypt(data, key)
    decrypt(data, key)
    assert data == _data, (data, _data)
    
    for x in range(256):
        data = bytearray(8)
        data[0] = x
        encrypt(data, key)
        print data
        
if __name__ == "__main__":
    test_encrypt_decrypt()
    