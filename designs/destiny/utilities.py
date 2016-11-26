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
    
def slide(iterable, x=16):
    """ Yields x bytes at a time from iterable """
    slice_count, remainder = divmod(len(iterable), x)
    for position in range((slice_count + 1 if remainder else slice_count)):
        _position = position * x
        yield iterable[_position:_position + x] 

def rotate_right(x, r, bit_width=8, _mask=dict((bit_width, ((2 ** bit_width) - 1)) for bit_width in (8, 16, 32, 64, 128))): 
    r %= bit_width
    return ((x >> r) | (x << (bit_width - r))) & _mask[bit_width]
    
def rotate_left(x, r, bit_width=8, _mask=dict((bit_width, ((2 ** bit_width) - 1)) for bit_width in (8, 16, 32, 64, 128))):  
    r %= bit_width
    return ((x << r) | (x >> (bit_width - r))) & _mask[bit_width]        
    
def xor_subroutine(bytearray1, bytearray2): 
    size = min(len(bytearray1), len(bytearray2))
    for index in range(size):
        bytearray1[index] ^= bytearray2[index]    