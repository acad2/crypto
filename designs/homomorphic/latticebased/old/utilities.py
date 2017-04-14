""" Contains helper functions that may be useful in more then one module. 
    These were all copied from crypto.utilities. """    
    
def slide(iterable, x=16):
    """ Yields x bytes at a time from iterable """
    slice_count, remainder = divmod(len(iterable), x)
    for position in range((slice_count + 1 if remainder else slice_count)):
        _position = position * x
        yield iterable[_position:_position + x] 

def addition_subroutine(data1, data2, modulus):
    assert len(data1) == len(data2), (len(data1), len(data2))
    for index, byte in enumerate(data1):
        data1[index] = (byte + data2[index]) % modulus
        
def subtraction_subroutine(data1, data2, modulus):
    assert len(data1) == len(data2), (len(data1), len(data2))
    for index, byte in enumerate(data1):
        data1[index] = modular_subtraction(byte, data2[index], modulus)        
    
def multiplication_subroutine(data1, data2, modulus):    
    assert len(data1) == len(data2), (len(data1), len(data2))
    for index, byte in enumerate(data1):
        data1[index] = (byte * data2[index]) % modulus   
 
def modular_subtraction(x, y, modulus):
    return (modulus + (x - y)) % modulus
    
def _egcd(a, b):
    if a == 0:
        return (b, 0, 1)
    else:
        g, y, x = _egcd(b % a, a)
        return (g, x - (b // a) * y, y)

def modular_inverse(a, m):
    g, x, y = _egcd(a, m)
    if g != 1:
        raise ValueError('modular inverse does not exist')
    else:
        return x % m
    
def shift_left_subroutine(data, amount, modulus):
    for index, word in enumerate(data):        
        data[index] = (word << amount) % modulus        
    
def bytes_to_words(seed, wordsize):
    state = []
    seed_size = len(seed)
    for offset in range(seed_size / wordsize):        
        byte = 0
        offset *= wordsize
        for index in range(wordsize):        
            byte |= seed[offset + index] << (8 * index)
        state.append(byte)
    return state
    
def words_to_bytes(state, wordsize):        
    output = bytearray()
    storage = list(state)
    while storage:
        byte = storage.pop(0)
        for amount in range(wordsize):
            output.append((byte >> (8 * amount)) & 255)
    return output
    
def test_addition_subtraction_subroutine():
    from os import urandom
    data0 = bytearray(urandom(8))
    _data0 = data0[:]
    data1 = bytearray(urandom(8))
    addition_subroutine(data0, data1, 256)
    subtraction_subroutine(data0, data1, 256)
    assert data0 == _data0, (data0, _data0)
    
if __name__ == "__main__":
    test_addition_subtraction_subroutine()
    