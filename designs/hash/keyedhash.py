from os import urandom
from crypto.utilities import slide, pad_input

with open("publickey.bin", "a+b") as _file:
    PUBLIC_KEY = _file.read()
    if not PUBLIC_KEY:
        PUBLIC_KEY = urandom(32 * 256)
        _file.write(PUBLIC_KEY)
    PUBLIC_KEY = [bytearray(block) for block in slide(PUBLIC_KEY, 32)]
    
def addition_subroutine(data1, data2, modulus):
    for index, byte in enumerate(data1):
        data1[index] = (byte + next(data2)) % modulus
        
def hash_function(data, public_key=PUBLIC_KEY, modulus=256):     
    output = bytearray(32)        
    for index, byte in enumerate(bytearray(pad_input(data, 32))):
        value = public_key[byte]        
        addition_subroutine(output, ((value[count] * (index + count + byte + 1)) % modulus for count in range(len(value))), modulus)
    return bytes(output)    
    
def test_hash_function():        
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function)
    
if __name__ == "__main__":
    test_hash_function()
    