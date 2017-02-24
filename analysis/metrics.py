import itertools
import random
import sys
import os
from math import log
from timeit import default_timer as timestamp

def slide(iterable, x=16):
    """ Yields x bytes at a time from iterable """
    slice_count, remainder = divmod(len(iterable), x)
    for position in range((slice_count + 1 if remainder else slice_count)):
        _position = position * x
        yield iterable[_position:_position + x]  

ASCII = ''.join(chr(x) for x in range(256))
TEST_OPTIONS = {"avalanche_test" : True, "randomness_test" : True, "bias_test" : True,
                "period_test" : True, "performance_test" : True, "randomize_key" : False}                 
    
PERFORMANCE_TEST = {"randomness_test" : False, "avalanche_test" : False, 
                    "period_test" : False, "bias_test" : False}
                    
def binary_form(_bytes):
    return ''.join(format(byte, 'b').zfill(8) for byte in bytearray(_bytes))
    
def _hash_prng(hash_function, digest_size, output_size):        
    output = b''
    hash_input = "\x01" * digest_size    
    chunks, extra = divmod(output_size, digest_size)
    chunks += 1 if extra else 0      
    for chunk in range(chunks):      
        sys.stdout.write("\rGenerating random data: {:3.4f}%".format(100 * (float(chunk) / chunks)))
        sys.stdout.flush()
        #print "Hashing: ", [byte for byte in bytearray(hash_input)]
        #print "Hashed : ", hash_function(hash_input)
        output += hash_function(hash_input)    
        hash_input = output[-digest_size:]
    print
    return output
        
def hamming_distance(str1, str2):    
    return sum(itertools.imap(str.__ne__, binary_form(str1), binary_form(str2)))
  
def print_hamming_info(output1, output2):    
    output1_binary = binary_form(output1)
    output2_binary = binary_form(output2)
    _distance = hamming_distance(binary_form(output1), binary_form(output2))
    bit_count = len(output1_binary)
    print "bit string length: ", bit_count
    print "Hamming weights: ", output1_binary.count('1'), output2_binary.count('1')
    print "Hamming distance and ratio (.5 is ideal): ", _distance, _distance / float(bit_count)
    
def test_bias_of_data(random_data):    
    print "Testing for byte bias..."
    outputs = [[] for count in range(256)]
    for chunk in slide(random_data, 256):
        for index, byte in enumerate(chunk):
            outputs[index].append(byte)
    print "Symbols out of 256 that appeared at position: ", len(outputs), [len(set(_list)) for _list in outputs]       
    
def test_avalanche_hash(hash_function, blocksize=16):        
    print "Testing diffusion/avalanche... "
    beginning = "\x01" * (blocksize - 2)
    _bytes = ''.join(chr(byte) for byte in range(256))
    
    ratio = []
    for byte in _bytes:  
        last_output = hash_function(beginning + byte + _bytes[0])
        sys.stdout.write("\r{:3.4f}%".format((ord(byte) / 256.0) * 100))
        sys.stdout.flush()
        for byte2 in _bytes[1:]:
            next_input = beginning + byte + byte2                  
            next_output = hash_function(next_input)    
            #print next_input, next_output
            distance = hamming_distance(last_output, next_output)
            ratio.append(distance)
            last_output = next_output
    print
    minimum = min(ratio)
    maximum = max(ratio)
    average = sum(ratio) / len(ratio)   
    bit_count = float(len(binary_form(last_output)))
    print "Minimum Hamming distance ratio: ", minimum / bit_count
    print "Average Hamming distance ratio: ", average / bit_count
    print "Maximum Hamming distance ratio: ", maximum / bit_count    
    
def test_avalanche_of_seed(encrypt_method, key, seedsize, seedname="seed", 
                           seed_generation_function=lambda padding, byte: padding + byte):
    padding = "\x00" * (seedsize - 1)
    print "Testing diffusion of {}: using variable data as {} for rng".format(seedname, seedname)    
    random_bytes1 = encrypt_method("\x01" * (1024 * 1024), key, seed_generation_function(padding, "\x00"))
    random_bytes2 = encrypt_method("\x01" * (1024 * 1024), key, seed_generation_function(padding, "\x01"))
    ratio = []
    block_size = seedsize
    for block_number, block_one in enumerate(slide(random_bytes1, block_size)):
        index = slice(block_number * block_size, (block_number + 1) * block_size)
        ratio.append(hamming_distance(block_one, random_bytes2[index]))
    
    minimum = min(ratio)
    average = sum(ratio) / float(len(ratio))
    maximum = max(ratio)
    bit_count = float(block_size * 8)
    print "Minimum Hamming distance ratio: ", minimum / bit_count
    print "Average Hamming distance ratio: ", average / bit_count
    print "Maximum Hamming distance ratio: ", maximum / bit_count 
    
def test_avalanche_of_key(encrypt_method, iv, keysize, 
                          key_generation_function=None):
    print "Testing diffusion of key: using variable data as key for rng"
    padding = "\x00" * (keysize - 1)    
    if key_generation_function is None:
        key_generation_function = lambda byte: padding + byte    
    random_bytes1 = encrypt_method("\x01" * (1024 * 1024), key_generation_function("\x00"), iv)             
    random_bytes2 = encrypt_method("\x01" * (1024 * 1024), key_generation_function("\x01"), iv)        
            
    ratio = []
    block_size = 16
    for block_number, block_one in enumerate(slide(random_bytes1, block_size)):
        index = slice(block_number * block_size, (block_number + 1) * block_size)
        ratio.append(hamming_distance(block_one, random_bytes2[index]))
        
    minimum = min(ratio)
    average = sum(ratio) / float(len(ratio))
    maximum = max(ratio)
    bit_count = float(block_size * 8)
    print "Minimum Hamming distance ratio: ", minimum / bit_count
    print "Average Hamming distance ratio: ", average / bit_count
    print "Maximum Hamming distance ratio: ", maximum / bit_count 
   
def test_randomness(random_bytes):    
    size = len(random_bytes)
    print "Testing randomness of {} bytes... ".format(size)   
    current_directory = os.getcwd()
    filename = os.path.join(current_directory, "Test_Data.bin")
    with open(filename, 'wb') as _file:
        _file.write(random_bytes)
        _file.flush()    
    print "Running ent..."
    os.system(os.path.join(os.path.split(__file__)[0], "ent.exe ") + filename)
    os.remove(filename)
    
def test_period(hash_function, blocksize=16, test_size=2):
    output = '\x01' * blocksize
    outputs = ['']    
    cycle_lengths = []
    print "Testing period with output truncated to {} byte: ".format(test_size)
    last_marker = 0
    for cycle_length in itertools.count():                
        output = hash_function(output)           
        if output[:test_size] in outputs:            
            #print "cycled after {} with {} byte output: ".format(cycle_length - last_marker, test_size)
            cycle_lengths.append(cycle_length - last_marker)
            last_marker = cycle_length     
            if len(cycle_lengths) == 100:
                break
        outputs.append(output[:test_size])
    minimum = min(cycle_lengths)
    maximum = max(cycle_lengths)
    average = sum(cycle_lengths) / float(len(cycle_lengths))
    print "Minimum/Average/Maximum cycle lengths: ", (minimum, average, maximum)
    
def test_bias(hash_function, byte_range=slice(0, 32)):
    biases = [[] for x in xrange(byte_range.stop)]    
    padding = "\x01" *(byte_range.stop - byte_range.start - 2)
    outputs2 = []   
    print "Testing for byte bias..."
    for byte1 in range(256):
        for byte2 in range(len(hash_function(padding + "\x00\x00"))):            
            output = hash_function(padding + chr(byte1) + chr(byte2))
            for index, byte in enumerate(output[byte_range]):
                biases[index].append(ord(byte))            
            outputs2.extend(output[byte_range])        
    print "output size: {}; symbols that appear at index: {}".format(len(output), [len(set(_list)) for _list in biases])
    print "Symbols out of 256 that appeared anywhere: {}".format(len(set(outputs2)))
       
def test_collisions(hash_function, output_size=3):      
    outputs = {}        
    print "Testing for collisions with output of {} bytes... ".format(output_size)
    for count, possibility in enumerate(itertools.product(*(ASCII for count in range(output_size)))):
        hash_input = ''.join(possibility)        
        hash_output = hash_function(hash_input)[:output_size]
        if hash_output in outputs:            
            format_args = (log(count, 2), output_size * 8)
            print "Collision after: 2 ** {}; output size: 2 ** {}".format(*format_args)            
            print "Expected after : 2 ** {}".format(output_size * 4)
            break
        else:
            outputs[hash_output] = hash_input
    else:
        print "No collisions after {} inputs with output size {}".format(count, output_size), len(set(outputs))
    
def test_compression_performance(hash_function, test_message="\x00" * 2 ** 16):    
    print "Time testing compression function; Compressing {} bytes 10 times... ".format(len(test_message)) 
    values = []
    for round in range(10):
        sys.stdout.write("Round: {}\r".format(round))
        start = timestamp()
        hash_function(test_message)
        end = timestamp()
        values.append(end - start)
    print("Time required to compress {} bytes: {}".format(len(test_message) * 10, sum(values) / 10))
    
def test_prng_performance_hash(hash_function):    
    print "Testing time to generate 1024 * 1024 bytes... "
    start = timestamp()
    output = _hash_prng(hash_function, len(hash_function('\x00')), 1024 * 1024)
    end = timestamp()
    print("Time required to generate {} bytes: {}".format(1024 * 1024, end - start))
        
def test_prng_performance_permutation(permutation, state_size):
    print "Testing time to generate 1024 * 1024 bytes... "
    start = timestamp()
    output = _hash_prng(permutation, state_size, 1024 * 1024)
    end = timestamp()
    print("Time required to generate {} bytes: {}".format(1024 * 1024, end - start))
    
def test_cipher_performance(performance_test_sizes, encrypt_method, key, seed): 
    data_amount = 1024 * 128
    amount_string = "({} B {} KB {} MB)"
    test_message = "Testing time to generate " + amount_string + " in {} byte chunks:"
    rate_message = amount_string + "/s: {}"
    for increment_size in performance_test_sizes:
        print test_message.format(data_amount, data_amount / 1024.0, data_amount / (1024 * 1024.0), increment_size)
        size = (data_amount) / increment_size
        times = []
        
        for round in range(10):
            sys.stdout.write("{}{}%\r".format("=" * (7 * round), 10 * round))
            sys.stdout.flush()
            start = timestamp()  
            for chunk in range(size):                
                encrypt_method("\x00" * increment_size, key, seed)                                    
            end = timestamp()
            times.append(end - start)
        sys.stdout.write("{}100%\r".format("=" * 76))
        print rate_message.format(data_amount, data_amount / 1024.0, data_amount / (1024 * 1024.0), 1 / (sum(times) / float(len(times))))
                        
def test_collisions_of_null_block(hash_function):
    if hash_function("\x00") == hash_function("\x00\x00"):
        print "[*]The supplied hash produces collisions for null input strings of varying length"
                         
def test_for_involution(encrypt_function, blocksize, key, iv):
    data = "\x01" * blocksize
    ciphertext = encrypt_function(data, key, iv, "ecb")[:blocksize] # slice off padding block         
    if encrypt_function(ciphertext, key, iv, "ecb")[:blocksize] == data:
        print "[*]The supplied function is an involution F(F(x)) == x"
                            
def test_permutation(permutation, state_size, avalanche_test=True, randomness_test=True, bias_test=True,
                     period_test=True, performance_test=True):
    if avalanche_test:
        test_avalanche_hash(permutation, state_size)
    if randomness_test:
        test_randomness(_hash_prng(permutation, state_size, 1024 * 1024))
    if bias_test:
        test_bias(permutation, slice(0, state_size))
    if period_test:
        test_period(permutation, blocksize=state_size)
    if performance_test:
        test_prng_performance_permutation(permutation, state_size)            
        
def test_hash_function(hash_function, avalanche_test=True, randomness_test=True, bias_test=True,
                       period_test=True, performance_test=True, randomize_key=False, collision_test=True,
                       compression_test=True):
    """ Test statistical metrics of the given hash function. hash_function 
        should be a function that accepts one string of bytes as input and returns
        one string of bytes as output. """
    output_size = len(hash_function("\x00"))
    test_collisions_of_null_block(hash_function)
    test_for_involution(lambda data, key, iv, mode: hash_function(data), output_size, 0, 0)
    if avalanche_test:
        test_avalanche_hash(hash_function, output_size)
    if randomness_test:        
        test_randomness(_hash_prng(hash_function, output_size, 1024 * 1024))        
    if period_test:
        test_period(hash_function, blocksize=len(hash_function('')))    
    if bias_test:
        test_bias(hash_function)
    if collision_test:
        test_collisions(hash_function)
    if compression_test:
        test_compression_performance(hash_function)
    if performance_test:
        test_prng_performance_hash(hash_function)
    
def test_block_cipher(encrypt_method, key, iv, avalanche_test=True, randomness_test=True, bias_test=True,
                      period_test=True, performance_test=True, randomize_key=False, 
                      blocksize=None, performance_test_sizes=(32, 256, 1500, 4096, 65536, 1024 * 128)):
    """ Test statistical metrics of the supplied cipher. cipher should be a 
        crypto.Cipher object or an object that supports an encrypt method
        that accepts plaintext bytes and key bytes and returns ciphertext bytes""" 
    keysize = len(key)
    blocksize = blocksize if blocksize is not None else keysize    
    test_for_involution(encrypt_method, blocksize, key, iv)
    
    if avalanche_test:
        test_avalanche_of_key(encrypt_method, iv, keysize)
        test_avalanche_of_seed(encrypt_method, key, len(iv), "iv")
               
    random_bytes = None
    if randomness_test:
        print "Generating 1MB of random test data... "
        random_bytes = encrypt_method("\x01" * 1024 * 1024 * 1, key, iv)             
        test_randomness(random_bytes)
    
    if bias_test:
        if random_bytes is None:
            random_bytes = encrypt_method("\x01" * 1024 * 1024 * 1, key, iv)                
        test_bias_of_data(random_bytes)
     
    if period_test:        
        test_function = lambda data: encrypt_method(iv, key, data)
        test_period(test_function, blocksize)
        
    if performance_test:
        test_cipher_performance(performance_test_sizes, encrypt_method, key, iv)                        
    
def test_stream_cipher(encrypt_method, key, seed, avalanche_test=True, randomness_test=True, bias_test=True,
                       period_test=True, performance_test=True, randomize_key=False, rate=224,
                       performance_test_sizes=(32, 256, 1500, 4096, 65536, 1024 * 128),
                       key_generation_function=None, seed_generation_function=None):  
    keysize = len(key)
    if avalanche_test:
        if seed_generation_function:
            test_avalanche_of_seed(encrypt_method, key, len(seed), seed_generation_function=seed_generation_function)   
        else:
            test_avalanche_of_seed(encrypt_method, key, len(seed))        
        if key_generation_function:
            test_avalanche_of_key(encrypt_method, seed, keysize, key_generation_function)                  
        else:
            test_avalanche_of_key(encrypt_method, seed, keysize)
            
    random_bytes = None
    if randomness_test:
        print "Generating random data for testing..."
        random_bytes = encrypt_method("\x00" * 1024 * 1024 * 1, key, seed)        
        test_randomness(random_bytes)
    
    if bias_test:
        if random_bytes is None:
            print "Generating random data for bias test..."
            random_bytes = encrypt_method("\x00" * 1024 * 1024 * 1, key, seed)                
        test_bias_of_data(random_bytes)
        
    if period_test:
        if seed_generation_function:
            def test_function(data):
                padding = "\x00" * (len(seed) - len(data))            
                return encrypt_method("\x00" * 16, key, seed_generation_function(padding, data))
        else:
            def test_function(data):
                padding = "\x00" * (len(seed) - len(data))            
                return encrypt_method("\x00" * 16, key, padding + data)       
        test_period(test_function)
        
    if performance_test:
        test_cipher_performance(performance_test_sizes, encrypt_method, key, seed)
    
def test_aes_metrics(test_options):     
    import crypto
    from pride.functions.security import encrypt as aes_encrypt
    from pride.functions.security import random_bytes
    from crypto.utilities import replacement_subroutine
        
    class Aes_Cipher(crypto.Cipher):
        
        key = random_bytes(16)
        
        def __init__(self, *args):
            super(Aes_Cipher, self).__init__(*args)
            self.blocksize = 16
            
        def encrypt_block(self, plaintext, key):
            ciphertext = aes_encrypt(bytes(plaintext), bytes(key), bytes(key), mode="ECB", return_mode="values")[1]  
            replacement_subroutine(plaintext, bytearray(ciphertext))
            
    test_block_cipher(Aes_Cipher.encrypt, "\x00" * 16, **test_options) 
    
def test_sha_metrics():
    from hashlib import sha256  
    print "Testing metrics of sha256..."
    test_hash_function(lambda data: sha256(data).digest())
    
def test_random_metrics():
    from crypto.utilities import random_oracle_hash_function
    print "Testing metrics of a random oracle hash function... "
    test_hash_function(random_oracle_hash_function)
    
if __name__ == "__main__":
    options = dict((key, not value) for key, value in TEST_OPTIONS.items())
    options["period_test"] = True
    options["randomize_key"] = False
    #test_aes_metrics(options)
    test_sha_metrics()    
    test_random_metrics()
