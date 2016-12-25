from timeit import default_timer as timer

from crypto.utilities import pad_input, xor_subroutine, addition_subroutine, multiplication_subroutine, bytes_to_words, words_to_bytes

WORD_BITS = 16
WORD_BYTES = WORD_BITS / 8
WORD_COUNT = 2 ** WORD_BITS
STATE_SIZE = 64 / WORD_BYTES

with open("publickey.bin", "a+b") as _file:
    print "Reading hash key from file..."
    HASH_KEY = _file.read()        
    if not HASH_KEY or len(HASH_KEY) / STATE_SIZE != WORD_COUNT:        
        from os import urandom
        HASH_KEY = urandom(STATE_SIZE * WORD_COUNT)
        _file.truncate(0)
        _file.write(HASH_KEY)         
    from crypto.utilities import slide
    assert len(HASH_KEY) == STATE_SIZE * WORD_COUNT
    HASH_KEY = [bytes_to_words(bytearray(block), WORD_BYTES) for block in slide(HASH_KEY, STATE_SIZE)]            
    print "...Done"
    
def memory_hard_hash(data, rounds, hash_key=HASH_KEY, modulus=WORD_COUNT):     
    output = [0 for count in range(STATE_SIZE)]    
    hash_input = bytes_to_words(bytearray(pad_input(data, STATE_SIZE * WORD_BYTES)), WORD_BYTES)    
    for round in range(rounds):
        for index, word in enumerate(hash_input):            
            value = hash_key[(word + round + output[index % STATE_SIZE]) % modulus]
            addition_subroutine(output, value, modulus)              
    return bytes(words_to_bytes(output, WORD_BYTES))
    
def test_memory_hard_hash():    
    data = "Test string!"
    print "Beginning test"
    for work_factor in (1, 10, 50, 100, 250, 500, 1000):
        start = timer()
        for test in range(10):            
            memory_hard_hash(data, work_factor)
        end = timer()
        print("Time required with work factor: {} @ {}".format((end - start) / 10, work_factor))
      
def test_hash_metrics():
    from crypto.analysis.metrics import test_hash_function
    test_hash_function(lambda data: memory_hard_hash(data, 1), avalanche_test=False, randomness_test=False)
    
if __name__ == "__main__":
    #test_memory_hard_hash()
    test_hash_metrics()
    