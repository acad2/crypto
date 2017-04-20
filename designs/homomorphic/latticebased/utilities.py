def integer_to_bytes(integer, _bytes):
    return bytearray((integer >> (8 * (_bytes - 1 - byte))) & 255 for byte in range(_bytes))
    
def bytes_to_integer(data):
    output = 0    
    size = len(data)
    for index in range(size):
        output |= data[index] << (8 * (size - 1 - index))
    return output
    
def serialize_int(number):
    return str(number)

def deserialize_int(serialized_int):
    return int(serialized_int)
    
def xor_subroutine(bytearray1, bytearray2): 
    size = min(len(bytearray1), len(bytearray2))    
    for index in range(size):
        bytearray1[index] ^= bytearray2[index]