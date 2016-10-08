from crypto.utilities import bytes_to_integer, integer_to_bytes, replacement_subroutine, slide
from crypto.analysis.metrics import test_hash_function

def mick_sponge_64_subroutine(state, mask=0xFFFFFFFFFFFFFFFF):    
    spunj = bytes_to_integer(state)
    PS = [3, 5, 11, 17, 23, 41, 47, 53, 59, 61]
    PD = [1078, 300, 90, 480, 3334, 86, 670, 2268, 122, 2068]    
    m = 0xFFFFFFFFFFFFFFFF    
    for i in range(10):
        m -= PD[i]
        spunj = (spunj * m) % mask
        spunj = (spunj << PS[i]) | (spunj >> (64 - PS[i]))
        spunj = (spunj + m) % mask    
    replacement_subroutine(state, integer_to_bytes(spunj, 8))

def mick_sponge_64(spunj, mask=0xFFFFFFFFFFFFFFFF):        
    PS = [3, 5, 11, 17, 23, 41, 47, 53, 59, 61]
    PD = [1078, 300, 90, 480, 3334, 86, 670, 2268, 122, 2068]    
    m = 0xFFFFFFFFFFFFFFFF    
    for i in range(10):
        m -= PD[i]
        spunj = (spunj * m) % mask
        spunj = (spunj << PS[i]) | (spunj >> (64 - PS[i]))
        spunj = (spunj + m) % mask    
    return spunj
    
def mick_hash(data, sponge_function=mick_sponge_64):
    data = [bytes_to_integer(word) for word in slide(bytearray(data))]
    
    buf = sponge_function(0)
    for i in range(len(data)):
        buf ^= data[i] # absorb a word
        buf = sponge_function(buf) # stir
    
    buf ^= 0x1F
    buf = sponge_function(buf)
    
    out = 0
    c = 64 / 8
    for _ in range(c):
        buf = sponge_function(buf)
        out <<= 8
        out |= buf & 0xFF
    return integer_to_bytes(out)
    
def test_mick_sponge_64():
    from crypto.designs.hash.sponge import crypto.designs.hash.sponge_factory    
    hash_function = sponge_factory(mick_sponge_64_subroutine, rate=1, capacity=7)
    test_hash_function(hash_function, avalanche_test=False, randomness_test=True)
    
def test_mick_hash():
    test_hash_function(mick_hash)    
        
if __name__ == "__main__":
    test_mick_sponge_64()
    #test_mick_hash()
    