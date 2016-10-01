import itertools
import hashlib
from os import urandom

from pride.crypto.utilities import slide, save_data, load_data
        
def _tunable_hash(data, key, work_factor, algorithm="sha224"):
    return hashlib.pbkdf2_hmac(algorithm, data, key, work_factor)
    
def _encrypt(data, key, iv, work_factor, hash_function):
    """ usage: encrypt(data, key, iv, work_factor, 
                       hash_function) => ciphertext
                       
        Encrypt data in a way that decryption takes significantly more computational
        expense then encryption, based on work_factor. 
            - Incrementing work factor increases decryption cost exponentially
        
        Ciphertext will be (len(data) / work_factor) * digest_size bytes in size. """
    ciphertext = b''
    cumulative_input = b''
    
    for data_bytes in slide(data, work_factor):        
        output = hash_function(cumulative_input + key + iv + data_bytes)
        ciphertext += output
        cumulative_input += data_bytes
    
    return ciphertext
    
def _decrypt(ciphertext, key, iv, work_factor, hash_function):
    """ usage: decrypt(ciphertext, key, iv, work_factor,
                       hash_function) => plaintext
                       
        Slow decryption function for corresponding fast(er) encryption function.
            - Incrementing work factor increases decryption cost exponentially"""
    plaintext = b''    
    
    test_bytes = [bytes(bytearray(range(256))) for factor in range(work_factor)]    
    block_size = len(hash_function(''))
    
    for ciphertext_bytes in slide(ciphertext, block_size):        
        data_bytes = brute_force(ciphertext_bytes, hash_function, test_bytes, 
                                 prefix=plaintext + key + iv)                                 
        plaintext += data_bytes[-work_factor:]               
    
    return plaintext
    
def brute_force(output, function, test_bytes, prefix='', postfix='', joiner='',
                string_slice=None):
    """ usage: brute_force(output, function, test_bytes, 
                           prefix='', postfix='', 
                           joiner='') => input where function(input) == output
                           
        Attempt to find an input for function that produces output.
            - test_bytes should be an iterable of iterables which containing the symbols that 
              are to be tested 
                - i.e. [ASCII, ASCII], ['0123456789', 'abcdef']
                - symbols can be strings of any size
                    - [my_password_dictionary, my_password_dictionary], 
                        - my_password_dictionary can be an iterable of common words
            - prefix and postfix are any constant strings to prepend/append to each attempted input
            - joiner is the symbol to use when joining symbols for a test input
                - use '' (default) for test_bytes like [ASCII, ASCII]
                - use ' ' to test word lists [dictionary, dictionary]
                    - or have the word lists themselves include relevant spacing/punctuation
        Raises ValueError if no input was found that produces output."""  
    string_slice = slice(0, None) if string_slice is None else string_slice
    for permutation in itertools.product(*test_bytes):              
        if function(prefix + joiner.join(permutation) + postfix)[string_slice] == output[string_slice]:            
            return prefix + joiner.join(permutation) + postfix
    else:                   
        raise ValueError("Unable to recover input for given output with supplied arguments") 
        
def create_challenge(key, iv, size=16, work_factor1=1, work_factor2=1, algorithm="sha224"):
    answer = urandom(size)
    _hash_function = lambda hash_input: _tunable_hash(hash_input, key, work_factor2, algorithm)
    challenge = _encrypt(answer, key, iv, work_factor1, _hash_function)
    cryptogram = save_data(challenge, iv, work_factor1, work_factor2, algorithm)
    return answer, cryptogram
    
def solve_challenge(cryptogram, key):
    challenge, iv, work_factor1, work_factor2, algorithm = load_data(cryptogram)
    _hash_function = lambda hash_input: _tunable_hash(hash_input, key, work_factor2, algorithm)
    return _decrypt(challenge, key, iv, work_factor1, _hash_function)
    
def test_create_challenge_solve_challenge():
    key = "\x00" * 16
    iv = urandom(16)
    size = 16
    work_factor1 = 1
    work_factor2 = 1
    
    for algorithm in ("sha224", "sha256", "sha384", "sha512"):
        answer, cryptogram = create_challenge(key, iv, size, work_factor1, work_factor2, algorithm)
        #cryptogram = cryptogram[:20] + ("\x00" * 3) + cryptogram[23:]
        _answer = solve_challenge(cryptogram, key)
        assert _answer == answer, (_answer, answer)
    print "Passed unit test"
    
if __name__ == "__main__":
    test_create_challenge_solve_challenge()
    
    
    
   
   
