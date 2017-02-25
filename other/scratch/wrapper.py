import ctypes

library = ctypes.CDLL("libblockcipher.so")
library.encrypt.argtypes = (ctypes.POINTER(ctypes.c_ubyte), 
                            ctypes.POINTER(ctypes.c_ubyte),
                            ctypes.c_int)
                            
def encrypt(data, key, rounds):
    c_data = ctypes.create_string_buffer(data)
    c_key = ctypes.create_string_buffer(key)
    library.encrypt(c_data, c_key, ctypes.c_int(rounds))
    print c_data.value
    
def test_encrypt():
    data = "Testing!"
    key = "\x00" * 8
    
    encrypt(data, key, 1)
    
if __name__ == "__main__":
    test_encrypt()