def shuffle_extract(data, key, state):    
    """ State update and round key extraction function. """
    for i in reversed(range(1, 256)):
        # Fisher-Yates shuffle
        j = state & (i - 1)                
        data[i], data[j] = data[j], data[i]           

        key[i] ^= data[j] ^ data[i] ^ i # randomize key value   
        state ^= key[i] ^ key[j] # randomize value with output feedback
        
    key[0] ^= data[j] ^ data[i] 
    state ^= key[0] ^ key[j]
    return state
    
def sponge(input_data, output_bytes, rate=256):
    state = ord(input_data[0]) if input_data else 0
    tweak = bytearray(range(256))
    seed = bytearray(256)
    for block in slide(bytearray(input_data), 256):
        state = shuffle_extract(tweak, block, state)        
        xor_subroutine(seed, block)
        
    chunks, extra = divmod(output_bytes, 256)    
    output = bytearray(output_bytes)
    
    for chunk in range(chunks):
        state = shuffle_extract(tweak, seed, state)
        print seed
        for index in range(rate):
            output[(chunk * 256) + index] = seed[tweak[index]]
    else:
        chunk = -1
    if extra:
        shuffle_extract(tweak, seed, state)
        for index in range(extra):
            output[((chunk + 1) * 256) + index] = seed[tweak[index]]
    return bytes(output)
    
def random_number_generator(key, seed, output_size=256, tweak=range(256)):
    """ Psuedorandom number generator. Operates by randomly shuffling the
        set of 256 elements according to an internal state array.
        
        One round consists of a permutation of the set array along with a
        randomizing of the internal state array. 
        
        Each output byte is obtained by selecting a byte from the state in
        a random location determined by the set.
        
        Output size is configurable to allow for a tunable security capacity,
        similar to a cryptographic sponge function. 
        
        Internally, two states are used: The main state array, and an 8-bit
        byte. The 8-bit byte contributes to diffusion and avalanche"""   
    state = key[0]           
    tweak = tweak[:]
    state = shuffle_extract(tweak, key, state)
    state = shuffle_extract(tweak, seed, state)
    output = bytearray(output_size)
    while True:                  
        state = shuffle_extract(tweak, seed, state)        
        for index in range(output_size):            
            output[index] = seed[tweak[index]]   
        yield bytes(output)                                              
   
def random_number_generator_subroutine(key, seed, tweak, output, output_size=256):
    """ Identical to random_number_generator; This uses less allocations and is more performant. """        
    state = key[0]
    state = shuffle_extract(tweak, key, state)
    state = shuffle_extract(tweak, seed, state)
    
    while True:         
        state = shuffle_extract(tweak, seed, state)        
        for index in range(output_size):            
            output[index] = seed[tweak[index]]   
        yield        
        
def null_pad(seed, size):
    return bytearray(seed + ("\x00" * (size - len(seed))))
            
def random_bytes(count, seed="\x00" * 256, key="\x00" * 256, tweak=tuple(range(256)), output_size=256):  
    """ Generates count random bytes using random_number_generator using the 
        supplied/default seed, key, tweak, and output_size. """      
    output = bytearray(256)
    key = null_pad(key, 256)
    seed = null_pad(seed, 256)
    generator = random_number_generator_subroutine(key, bytearray(seed), bytearray(tweak), output, output_size)    
    amount, extra = divmod(count, output_size) 
    amount += 1 if extra else 0
    for chunk in range(amount):            
        next(generator)           
        output.extend(output[:output_size])
        
    return output[:count]
    
def _random_bytes(count, output, seed="\x00" * 256, key="\x00" * 256, tweak=tuple(range(256)), output_size=256):  
    """ Generates count random bytes using random_number_generator using the 
        supplied/default seed, key, tweak, and output_size. 
        Identical to random_bytes, except uses a bytearray and avoids allocations"""             
    key = null_pad(key, 256)
    generator = random_number_generator_subroutine(key, bytearray(seed), bytearray(tweak), output, output_size)    
    amount, extra = divmod(count, output_size) 
    amount += 1 if extra else 0
    for chunk in range(amount):            
        next(generator)           
        output.extend(output[:output_size])   

try:
    import crypto    
except ImportError:
    pass
else:
    from crypto.utilities import xor_subroutine, xor_sum
    
    class Stream_Cipher(object):
        
        def __init__(self, key, rate=224):
            super(Stream_Cipher, self).__init__()
            assert isinstance(key, str) or isinstance(key, bytearray), type(key)            
            self.key = key            
            self.rate = rate
            self.default_tweak = tuple(range(256))
                        
        def encrypt(self, data, seed, tag=None):
            data = bytearray(data)
            xor_subroutine(data, self.random_bytes(len(data), seed))
            return bytes(data)
            
        def decrypt(self, data, seed, tag=None):
            data = bytearray(data)
            xor_subroutine(data, self.random_bytes(len(data), seed))
            return bytes(data)
            
        def random_bytes(self, quantity, seed, tweak=None):
            output = bytearray(256)            
            _random_bytes(quantity, output, key=self.key, seed=null_pad(seed, 256), tweak=tweak or self.default_tweak)
            return output
            
        @classmethod
        def test_metrics(cls, *args, **kwargs):        
            crypto.analysis.metrics.test_stream_cipher(lambda data, key, seed: cls(key).encrypt(data, seed),
                                                    *args, **kwargs)    
    
            
    class Stream_Cipher2(Stream_Cipher):
                            
        def encrypt(self, data, seed, tag=None, tweak=None):
            data = bytearray(data)
            data_size = len(data)            
            seed = null_pad(seed, 256)            
            tweak = bytearray(tweak or self.default_tweak)
            key = self.random_bytes(data_size, seed, tweak)            
            self.crypt(data, key, tweak, 0, 1)
            return bytes(data)
            
        def crypt(self, data, key, tweak, start, direction):
            xor_subroutine(data, key)
            self.substitute_bytes(data, tweak, start, direction)
            xor_subroutine(data, key)            
            
        def substitute_bytes(self, data, tweak, start, direction):
            data_size = len(data)        
            index = start
            state = xor_sum(data)
            for count in range(0, data_size):                                                
                state ^= data[index]                           
                random_place = state & (data_size - 1)                                  
                data[index] ^= data[random_place & (index - 1)] ^ random_place
                state ^= data[index]                 
                
                index += direction
                
        def decrypt(self, data, seed, tag=None, tweak=None):
            data = bytearray(data)
            data_size = len(data)
            seed = null_pad(seed, 256)
            tweak = bytearray(tweak or self.default_tweak)
            key = self.random_bytes(data_size, seed, tweak)
            self.crypt(data, key, tweak, data_size - 1, -1)       
            return bytes(data)
            
def test_random_number_generator():
    import os
    key = bytearray(os.urandom(256))#"\x00" * 256)
    tweak = range(256)    
    import pride.components.datastructures
    from crypto.analysis.metrics import hamming_distance, cast, test_randomness, test_prng_performance, test_bias_of_data
    random_megabyte = bytes(random_bytes(1024 * 1024, "\x00" * 256, key=key))
    test_randomness(random_megabyte)
    random_megabyte2 = bytes(random_bytes(1024 * 1024, "\x00" * 255 + "\x01", key=key))
    ratio = pride.components.datastructures.Average(size=65535)
    for chunk in range((1024 * 1024) / 256):
        _slice = slice(chunk * 256, (chunk + 1) * 256)
        distance = hamming_distance(random_megabyte[_slice], random_megabyte2[_slice])
        ratio.add(distance) 
        
    minimum, average, maximum = ratio.range
    bit_count = float(len(cast(random_megabyte[_slice], "binary")))
    print "Minimum Hamming distance and ratio: ", minimum / bit_count
    print "Average Hamming distance and ratio: ", average / bit_count
    print "Maximum Hamming distance and ratio: ", maximum / bit_count     
        
    test_bias_of_data(random_megabyte)    
    test_prng_performance(lambda data, output_size: bytes(random_bytes(output_size, key=key)))               
    
def test_shuffle_extract():
    from crypto.analysis.metrics import test_randomness, test_avalanche
    random_megabyte = bytearray()
    data = range(256)
    key = bytearray("\x00" * 256)
    state = bytearray(1)
    for chunk in range((1024 * 1024) / 256):
        shuffle_extract(data, key, state)
        random_megabyte.extend(key[:])
    
    test_randomness(random_megabyte)
    #
    
    def _test_avalanche(_input):
        _input = bytearray(_input)
        key = bytearray("\x00" * len(_input))
        shuffle_extract(range(len(_input)), _input, state)
        return bytes(key)
        
    test_avalanche(_test_avalanche)
    
    #last_output = next(generator)
    #for x in range(65535):
    #    next_output = next(generator)
        
def test_stream_cipher2():
    cipher = Stream_Cipher2("\x00" * 256)
    message = "Testing!"
    seed = "\x01"
    ciphertext = cipher.encrypt(message, seed)
    
    print
    print ciphertext
    print
    plaintext = cipher.decrypt(ciphertext, seed)
    assert message == plaintext, (plaintext, message)
    
    print
    print
    message2 = "Testing?"
    ciphertext2 = cipher.encrypt(message2, seed)
    
    print
    print ciphertext2
    print
    plaintext2 = cipher.decrypt(ciphertext2, seed)
    assert message2 == plaintext2, (plaintext2, message2)
    
    Stream_Cipher2.test_metrics("\x00" * 256, "\x00" * 256, avalanche_test=False)
    
if __name__ == "__main__":
   # test_random_number_generator()
    #test_shuffle_extract()    
    #shuffle_extract(bytearray(range(256)), bytearray("\x00" * 256), bytearray(1))
    #with open("pythonrng.bin", "wb") as _file:
    #    _file.write(random_bytes(1024 * 1024))
    #test_stream_cipher2()
    Stream_Cipher.test_metrics("\x00" * 256, "\x00" * 256, performance_test_sizes=(1500, 4096))
    