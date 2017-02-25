"""Any cipher that is partially homomorphic with respect to integer addition can be used to homomorphically evaluate XOR/AND operations.
This is because integer addition is computed via XOR and AND gates:

    0 1
    0 1 +
    -----
    1 0

    
    0 0
    0 1 +
    -----
    0 1
    
    
    0 1
    0 0 +
    -----
    0 1
    
    
    0 0
    0 0 +
    -----
    0 0
    
Examining the right column seperately, we have:
        
        
    1
    1 + 
    ---
    0
    
 
    0
    1 +
    ---
    1

    
    1
    0 +
    ---
    1
        
    
    0
    0 +
    ---
    0
    
This combination of inputs and outputs represents the truth table for the XOR function.    
Using the same inputs, the AND function is computed simultaneously, and the result is output in the next significant bit (the left bit in the prior example)
As long as the next most significant bit to the input bit is 0, we can compute AND gates using integer addition without concern for noise.
One issue is that the result of the AND gate moves to the left one bit with each addition. 
This creates a somewhat homomorphic scheme:
    
    - supports at most log(n) - 1 AND operations
        - could use less operations and fit more bits into a given word
    - AND operations must be performed on inputs which "line up", as the AND output shifts left with each operation
        - requires that both ciphertexts have the same number of operations performed on them or...
        - left shift can move a lower leveled bit into a higher position but...
        - cannot use right shift to move a higher leveled bit into a lower position 
"""

from utilities import addition_subroutine

from constants import DEFAULT_MODULUS

def homomorphic_xor(ciphertext1, ciphertext2, modulus=DEFAULT_MODULUS):    
    addition_subroutine(ciphertext1, ciphertext2, modulus)
            
def homomorphic_and(ciphertext1, ciphertext2, operation_count, modulus=DEFAULT_MODULUS):
    addition_subroutine(ciphertext1, ciphertext2, modulus)    
    return operation_count + 1
    
def test_homomorphic_xor_homomorphic_and():
    import secretkey
    from os import urandom
    import random
    key = secretkey.generate_key()
    data = [random.choice((0, 1)) for count in range(8)]
    data2 = [random.choice((0, 1)) for count in range(8)]
    data3 = [random.choice((0, 1)) for count in range(8)]
    and_answer = [(data[index] & data2[index] & data3[index]) & 1 for index in range(8)]
    xor_answer = [(data[index] ^ data2[index] ^ data3[index]) & 1 for index in range(8)]
    and_ciphertext1 = secretkey.encrypt(data, key)
    and_ciphertext2 = secretkey.encrypt(data2, key)
    and_ciphertext3 = secretkey.encrypt(data3, key)
    
    xor_ciphertext1 = secretkey.encrypt(data, key)
    xor_ciphertext2 = secretkey.encrypt(data2, key)
    xor_ciphertext3 = secretkey.encrypt(data3, key)
        
    operation_count = 0
    operation_count = homomorphic_and(and_ciphertext1, and_ciphertext2, operation_count)
     
    for index, byte in enumerate(and_ciphertext3):
        #and_ciphertext3[index] = (byte * (2 * operation_count)) % DEFAULT_MODULUS
        and_ciphertext3[index] <<= operation_count
    #for level_increase in range(operation_count):
    #    addition_subroutine(and_ciphertext3, and_ciphertext3, DEFAULT_MODULUS)
    operation_count = homomorphic_and(and_ciphertext1, and_ciphertext3, operation_count)    
    
    homomorphic_xor(xor_ciphertext1, xor_ciphertext2)
    homomorphic_xor(xor_ciphertext1, xor_ciphertext3)
    and_plaintext = secretkey.decrypt(and_ciphertext1, key)
    xor_plaintext = secretkey.decrypt(xor_ciphertext1, key)
           
    print "XOR results: "    
    print("Result: {}".format([(byte % 256) & 1 for byte in xor_plaintext]))
    print("Answer: {}".format(xor_answer))    

    print("AND results: ")
    print("Result: {}".format([((byte % 256) & (2 ** operation_count)) >> operation_count for byte in and_plaintext]))
    print("Answer: {}".format(and_answer))
    
    
if __name__ == "__main__":
    test_homomorphic_xor_homomorphic_and()
    
    