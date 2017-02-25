# encrypted instruction processor, capable of evaluating equations of the form: abc + d + e + f + g ... (over bits) given an additively homomorphic cipher (over integers)
# cannot evaluate distribution, i.e. a(b + c)

import publickeyencryption as publickey
from constants import DEFAULT_MODULUS
from utilities import addition_subroutine, shift_left_subroutine, multiplication_subroutine, modular_inverse

with open("_unit_test_keypair", "a+b") as _file:
    serialized_keys = _file.read()
    if not serialized_keys:
        _UNIT_TEST_PUBLIC_KEY, _UNIT_TEST_PRIVATE_KEY = publickey.generate_keypair()
        _file.write(publickey.save_public_key(_UNIT_TEST_PUBLIC_KEY) +
                    publickey.save_private_key(_UNIT_TEST_PRIVATE_KEY))
    else:    
        _UNIT_TEST_PUBLIC_KEY = publickey.load_public_key(serialized_keys[:64 * DEFAULT_MODULUS])
        _UNIT_TEST_PRIVATE_KEY = publickey.load_private_key(serialized_keys[64 * DEFAULT_MODULUS:])
    assert _UNIT_TEST_PUBLIC_KEY
    assert _UNIT_TEST_PRIVATE_KEY, (len(_UNIT_TEST_PUBLIC_KEY), len(serialized_keys), 64 * DEFAULT_MODULUS)
    
COPY_FLAG = []   
    
class Bit(object):
        
    def __init__(self, value, public_key, depth=0, modulus=DEFAULT_MODULUS):
        self._decrypt_shift = 0        
        self.depth = depth                
        if value != COPY_FLAG:
            self.value = publickey.encrypt([value], public_key)
        self.modulus = modulus
        
    def decrypt(self, private_key):
        depth = self.depth                    
        return (publickey.decrypt(self.value, private_key)[0] & (1 << depth)) >> (self._decrypt_shift + depth)
      
    @classmethod
    def copy(cls, bit_object, public_key):
        new_bit = cls(COPY_FLAG, public_key)
        new_bit.value = bit_object.value[:]        
        new_bit._decrypt_shift = bit_object._decrypt_shift
        new_bit.depth = bit_object.depth
        return new_bit
        
    @classmethod
    def unit_test(cls):
        for bit_value in (0, 1):
            bit = cls(bit_value, _UNIT_TEST_PUBLIC_KEY)
            _bit_value = bit.decrypt(_UNIT_TEST_PRIVATE_KEY)
            assert _bit_value == bit_value, (_bit_value, bit_value)            
        print("{}: unit test pass".format(cls.__name__))
        
    def increase_depth(self, increment):        
        shift_left_subroutine(self.value, increment, self.modulus)
        self.depth += increment
        
        
class Instruction_Processor(object):

    def __init__(self, public_key):
        super(Instruction_Processor, self).__init__()
        self.public_key = public_key        
        
    def run(self, operations):
        assert operations[-1][0] == "_return"
        return_values = operations.pop(-1)[1:]
        for instruction in operations:
            getattr(self, instruction[0])(*instruction[1:])
        return self._return(*return_values)
        
    def _and(self, ciphertext1, ciphertext2, modulus=DEFAULT_MODULUS):
        # sets bit1 to (bit1 & bit2)
        temp = Bit.copy(ciphertext2, self.public_key)
                    
        self.adjust_level(ciphertext1, temp)                           
        addition_subroutine(ciphertext1.value, temp.value, modulus)
        ciphertext1.depth += 1        
        
    def xor(self, ciphertext1, ciphertext2, modulus=DEFAULT_MODULUS):
        temp = Bit.copy(ciphertext2, self.public_key)
                
        self.adjust_level(ciphertext1, temp)                
        addition_subroutine(ciphertext1.value, temp.value, modulus)        
        
    def compare(self, ciphertext1, ciphertext2, modulus=DEFAULT_MODULUS):
        # sets bit1 to (bit1 ^ bit2) ^ 1
        temp = Bit.copy(ciphertext2, self.public_key)
        self.adjust_level(ciphertext1, temp)
        self.xor(ciphertext1, temp, modulus)
        self.xor(ciphertext1, Bit(1, self.public_key), modulus)
    
    def distribute(self, ciphertext1, ciphertext2, ciphertext3, modulus=DEFAULT_MODULUS):
        """ Computes a & (b ^ c) """
        if ciphertext2.depth or ciphertext3.depth:
            raise ValueError("Cannot distribute unless term depth == 0;\nciphertext2.depth: {}; ciphertext3.depth: {};".format(ciphertext1.depth, ciphertext2.depth))
            
        temp = Bit.copy(ciphertext2, self.public_key)
        temp2 = Bit.copy(ciphertext3, self.public_key)
        temp.increase_depth(1)
        addition_subroutine(temp.value, temp2.value, modulus)
        print publickey.decrypt(temp.value, _UNIT_TEST_PRIVATE_KEY)
        multiplication_subroutine(temp.value, [3 for count in range(len(ciphertext1.value))], modulus)        
        print publickey.decrypt(temp.value, _UNIT_TEST_PRIVATE_KEY)        
        self._and(ciphertext1, temp, modulus)                
        
    def choice(self, a, b, c, modulus=DEFAULT_MODULUS):
        temp = Bit.copy(b, self.public_key)
        
        self.distribute(a, temp, c, modulus) # computes a * (b + c)
        self.xor(temp, c, modulus) # computes c + (a * (b + c))                       
        a.value[:] = temp.value[:]
        a.depth = temp.depth
        
    def _return(self, *values):
        return values        
                
    def adjust_level(self, ciphertext1, ciphertext2, modulus=DEFAULT_MODULUS):
        """ Ensures that ciphertext1 and ciphertext2 are at an equivalent level of operations performed so far.
            This will either decrease or not modify the number of remaining multiplication operations on the input ciphertexts. """              
        depth1, depth2 = ciphertext1.depth, ciphertext2.depth      
        if depth2 < depth1:
            difference = depth1 - depth2    
            ciphertext2.increase_depth(difference)            
            #ciphertext2.depth = depth1            
        elif depth2 > depth1:        
            difference = depth2 - depth1                        
            ciphertext1.increase_depth(difference)            
            #ciphertext1.depth = depth2                     
                
    @classmethod
    def unit_test(cls):
        processor = cls(_UNIT_TEST_PUBLIC_KEY)        
        for _bita in range(2):
            for _bitb in range(2):
                for _bitc in range(2):
                    print "\nNext bits", _bita, _bitb, _bitc
                    bita = Bit(_bita, processor.public_key) 
                    bitb = Bit(_bitb, processor.public_key) 
                    bitc = Bit(_bitc, processor.public_key)
                    
                    instructions = [#("add", one_ciphertext, two_ciphertext),
                                    ("choice", bita, bitb, bitc),                                       
                                    #("_and", bita, bitb),
                                    #("_and", bita, bitc),
                                    #("xor", bita, bitc),
                                    #("compare", bitb, bitc),
                                    ("_return", bita, bitb),]
                                    
                    results = processor.run(instructions)
                    _answer = results[0].decrypt(_UNIT_TEST_PRIVATE_KEY)
                    
                    #answer = _bita ^ _bitb
                    #_answer = results[0].decrypt(_UNIT_TEST_PRIVATE_KEY)
                    #assert _answer == answer, (_answer, answer)
                    
                    #answer = _bita & _bitb
                    #_answer = results[0].decrypt(_UNIT_TEST_PRIVATE_KEY)
                    #assert _answer == answer, (_answer, answer)
                             
                    #answer = ((_bita & _bitb) & _bitc) ^ _bitc
                    #assert _answer == answer, (_answer, answer)
                    
                    #__answer = results[1].decrypt(_UNIT_TEST_PRIVATE_KEY)
                    #answer = (_bitb ^ _bitc) ^ 1
                    #assert answer == __answer, (answer, __answer)
                                        
                    _choice_result = (_bitc ^ (_bita & (_bitb ^ _bitc)))                    
                    assert _answer == _choice_result, (_answer, _choice_result)
        print("{}: unit test pass".format(cls.__name__))                
            
def run_unit_tests():    
    Bit.unit_test()
    Instruction_Processor.unit_test()
    
if __name__ == "__main__":
    run_unit_tests()
    