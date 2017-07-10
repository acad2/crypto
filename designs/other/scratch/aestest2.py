import _aes

import pride.functions.security

def encrypt(data, key, iv, mode="CBC"):
    _mode = _aes.AESModeOfOperation()
    output = _mode.encrypt(data, _mode.modeOfOperation[mode], key, _mode.aes.keySize["SIZE_128"], iv)    
    return (output[-1], output[0], output[1])
    
def decrypt(cryptogram, key, iv):    
    _mode = _aes.AESModeOfOperation()
    _mode, orig_len, plaintext = _mode.decrypt(*cryptogram + (key, _mode.aes.keySize["SIZE_128"], iv))
    return plaintext
    
def encrypt_block(data, key,
    
def test_encrypt_decrypt():
    data = "Testing!" * 2
    key = [0 for x in range(16)]
    iv = [0 for x in range(16)]
    mode = "ECB"
    
    cryptogram = encrypt(data, key, iv, mode)
    arguments = cryptogram + (key, iv)
    plaintext = decrypt(*arguments)
    
    assert plaintext == data, (plaintext, data)
    #(ciph, orig_len, mode, cypherkey, moo.aes.keySize["SIZE_128"], iv)
    
if __name__ == "__main__":
    test_encrypt_decrypt()
    