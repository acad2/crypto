import functools

from pride.crypto.utilities import cast, slide, xor_subroutine, replacement_subroutine, pad_input
            
def example_mixing_subroutine(_bytes):    
    byte_length = len(_bytes)
    key = (45 + sum(_bytes)) * byte_length * 2    
    for counter, byte in enumerate(_bytes):
        _bytes[counter % byte_length] = counter ^ (pow(251, 
                                                       key ^ byte ^ (_bytes[(counter + 1) % byte_length] * counter), 
                                                       257) % 256)
    return _bytes
    
def variable_length_hash(state, rate, output_size, mixing_subroutine, absorb_mode): 
    if isinstance(rate, int):
        rate = slice(0, rate)
    output = state[rate]    
    while len(output) < output_size:
        #print "\nSqueezing additional bytes: ", [byte for byte in state]
        mixing_subroutine(state)        
        output += state[rate]      
    
    return bytes(output[:output_size])
    
def prng_mode(state, rate, output_size, mixing_subroutine, absorb_mode):    
    while True:
        yield state[rate]
        mixing_subroutine(state)    
    
def encryption_mode(state, rate, output_size, mixing_subroutine, absorb_mode):    
    input_block = yield None        
    while input_block is not None:
        xor_subroutine(state, bytearray(input_block))
        input_block = yield bytes(state[:len(input_block)])
        mixing_subroutine(state)        
    yield bytes(state[rate])
    
def decryption_mode(state, rate, output_size, mode_of_operation, absorb_mode):    
    input_block = yield None       
    while input_block is not None:
        last_block = state[:len(input_block)]
        xor_subroutine(state, bytearray(input_block))
  
        input_block = yield bytes(state[:len(input_block)])
        xor_subroutine(state, last_block)       
        mixing_subroutine(state)    
    authentication_code = yield bytes(state[rate])
    if authentication_code != state[rate]:
        raise ValueError("Invalid tag")
        
def absorb(data, state, rate, mixing_subroutine, replacement_subroutine): 
    for block in slide(bytearray(data), rate.stop - rate.start):
        replacement_subroutine(state, block)
        mixing_subroutine(state)
       
def sponge_function(hash_input, key='', output_size=32, capacity=32, rate=32, 
                    mixing_subroutine=None,
                    mode_of_operation=variable_length_hash,
                    absorb_mode=xor_subroutine): 
    assert mixing_subroutine is not None
    #print "Hashing: ", [byte for byte in hash_input]
    if isinstance(rate, int):
        rate = slice(0, rate)
    if isinstance(capacity, int):
        end_of_rate = rate.stop
        capacity = slice(end_of_rate, end_of_rate + capacity)
    state_size = capacity.stop
    state = bytearray(state_size)
    if key:
        absorb(key, state, rate, mixing_subroutine, absorb_mode)      
    
    rate_in_bytes = rate.stop - rate.start
    hash_input = pad_input(bytearray(hash_input), rate_in_bytes)
        
    #print "\nBeginning absorption", [byte for byte in hash_input]
    for _bytes in slide(hash_input, rate_in_bytes):
        #print "Absorbing: ", [byte for byte in _bytes]
        absorb(_bytes, state, rate, mixing_subroutine, absorb_mode)
    
 #   print "\nBeginning final mix before mode of operation: ", [byte for byte in state]
    mixing_subroutine(state)
#    print "State: ", [byte for byte in state]
    return mode_of_operation(state, rate, output_size, mixing_subroutine, absorb_mode)                
    
def encrypt(data, key, iv, mixing_subroutine, rate=32, **kwargs):
    encryptor = sponge_function(iv, key, mixing_subroutine=mixing_subroutine,
                                mode_of_operation=encryption_mode,
                                **kwargs)
    next(encryptor)
    return ''.join(encryptor.send(block) for block in slide(data, rate))

def decrypt(data, key, iv, mixing_subroutine, rate=32, **kwargs):
    decryptor = sponge_function(iv, key, mixing_subroutine=mixing_subroutine,
                                mode_of_operation=decryption_mode,
                                **kwargs)
    next(decryptor)    
    return ''.join(decryptor.send(block) for block in slide(data, rate))                    
               
def psuedorandom_data(quantity, seed, key, mixing_subroutine, rate=32):
    return sponge_function(seed, key, mixing_subroutine=mixing_subroutine, 
                           output_size=quantity, rate=rate)
    
def sponge_factory(mixing_subroutine,
                   key='', output_size=32, capacity=32, rate=32,                    
                   mode_of_operation=variable_length_hash,
                   absorb_mode=xor_subroutine):
    """ usage: sponge_factory(mixing_subroutine, key='', output_size=32,
                              capacity=32, rate=32, 
                              mode_of_operation=variable_length_hash,
                              absorb_mode=xor_subroutine) => sponge function
                              
        Returns a sponge function that uses the supplied mixing subroutine as
        the permutation that mixes the internal state.
        
        mixing_subroutine should accept one required argument, an bytearray of 
        capacity + rate length, and should return nothing.
        
        key is an optional argument that will be absorbed into the state before
        any data is absorbed
        
        output_size, capacity, and rate should be integers. 
        
        mode_of_operation should be one of: variable_length_hash, prng_mode,
        encryption_mode, or decryption_mode. 
        
            - Note: it is simplest to use the encrypt/decrypt/psuedorandom_data 
                    helper functions for when something other then a hash is desired
                    
        absorb_mode should be either xor_subroutine or replacement_subroutine """        
    return functools.partial(sponge_function, key=key, output_size=output_size, 
                                              capacity=capacity, rate=rate,
                                              mixing_subroutine=mixing_subroutine,
                                              mode_of_operation=mode_of_operation, 
                                              absorb_mode=absorb_mode)                       
            
class Hash_Object(object):
                        
    def __init__(self, mixing_subroutine, hash_input='', 
                 output_size=32, capacity=32, rate=32, state=None):  
        self.mixing_subroutine = mixing_subroutine
        self.rate = rate
        self.capacity = capacity
        self.output_size = output_size        
        self.state = ''
        if state is not None:
            self.state = state
        
        if hash_input:
            if self.state:
                self.update(hash_input)
            else:
                self.state = self.hash(hash_input)
        
    def hash(self, hash_input, key=''):
        return sponge_function(hash_input, key, self.output_size, self.capacity, self.rate,
                               mixing_subroutine=self.mixing_subroutine,)
       
    def update(self, hash_input):
        self.state = xor_compression(self.state + self.hash(hash_input), self.state_size)
        
    def digest(self):
        return self.state

    def copy(self):
        return Hash_Object(self.mixing_subroutine, output_size=self.output_size, 
                           capacity=self.state_size, rate=self.rate, state=self.state)
             
def symmetric_primitive_factory(mixing_subroutine, **kwargs):
    hash_function = sponge_factory(mixing_subroutine=mixing_subroutine, **kwargs)
    encryption_function = lambda data, key, iv, **_kwargs: encrypt(data, key, iv, mixing_subroutine, **_kwargs)
    decryption_function = lambda data, key, iv, **_kwargs: decrypt(data, key, iv, mixing_subroutine, **_kwargs)
    return (hash_function, encryption_function, decryption_function)
    
def test_hash_object():
    hasher = Hash_Object(example_mixing_subroutine, "Test data")
    assert hasher.digest() == sponge_function("Test data", mixing_subroutine=example_mixing_subroutine)
    
def test_hash():
    hash_function = sponge_factory(mixing_subroutine=example_mixing_subroutine)
    print hash_function('')
    for x in xrange(5):
        print hash_function(chr(x))
    
def test_encrypt_decrypt():
    plaintext = "Awesome test message"
    iv = key = "\x00" * 16
    ciphertext = encrypt(plaintext, key, iv, example_mixing_subroutine)
    _plaintext = decrypt(ciphertext, key, iv, example_mixing_subroutine)
    print len(ciphertext), ciphertext
    print len(plaintext), plaintext
    assert plaintext == _plaintext, (plaintext, _plaintext)
    
def test_psuedorandom_data():
    data = psuedorandom_data(257, "\x00" * 16, "\x00" * 16, example_mixing_subroutine)    
    assert len(data) == 257
    print data
    
def test_example_mixer_stats():
    hash_function = sponge_factory(example_mixing_subroutine)
    from pride.crypto.analysis.metrics import test_hash_function
    test_hash_function(hash_function, avalanche_test=False, randomness_test=False)
    
    #import sys
    #backup = sys.stdout
    #with open("example_mixer_stats.txt", 'w') as _file:
    #    sys.stdout = _file
    #    test_hash_function(hash_function)
    #    sys.stdout = backup
        
if __name__ == "__main__":
    #test_hash()
    #test_hash_object()
    #test_encrypt_decrypt()
    #test_psuedorandom_data()
    test_example_mixer_stats()
    