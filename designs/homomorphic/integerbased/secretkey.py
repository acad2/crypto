from os import urandom

from encoding import encode, decode
from constants import DEFAULT_MODULUS
from utilities import multiplication_subroutine, modular_inverse, slide, addition_subroutine, subtraction_subroutine, modular_subtraction
      
def generate_key(_size=1):
    """ Generates a 256-bit private key. 
        The _size argument has no influence on the current implementation and exists to support an interface. """
    return bytearray(urandom(32))
    
def encrypt(input_bytes, key, rounds=5, modulus=DEFAULT_MODULUS):
    """ usage: encrypt(input_bytes, key, 
                       rounds=5, modulus=DEFAULT_MODULUS) => ciphertext
        
        Given input_bytes and a key, returns a bytearray of ciphertext.
        input_bytes and key should be bytearrays.
        Ciphertexts are partially homomorphic with respect to addition. 
            - Can perform an unlimited number of additions
           
        Encrypts 1 byte at a time. Each (2 ** rounds)-bit ciphertext encodes one 8-bit byte.        
        design: iterated randomized encoding (secret sharing)
                    - represent m as r, (m - r) where r is a uniformly random value
                    - doubles message size
                    - apply iteratively until message size == desired key strength
                        - 256 bits of key material requires 256 bits of data to operate upon
                            - Not necessarily true, but keeps it nice and simple
                        - apply 5 rounds to a byte to produce a 8->16->32->64->128->256 bit ciphertext                                                
                multiplication key addition layer
                    - multiplication instead of addition facilitates performing an arbitrary # of additions
                        - an addition key layer would have to count the # of operations performed
                    - key values must have a multiplicative inverse, which depends upon the modulus used
                        - a modulus of 256 works nicely for 8-bit bytes, but only half the elements have inverses
                            - only using odd key bytes sidesteps the problem, at the expense of -1 bit of security per key byte 
                        - could use finite field arithmetic ? """
    # encryption process:
    # encoding step
    #r1 (m1 - r1)
    #r2 r3 (r1 - r2) ((m1 - r1) - r3)
    #r4 r5 r6 r7 (r2 - r4) (r3 - r5) (r1 - r2 - r6) (m1 - r1 - r3 - r7)
    #r8 r9 r10 r11 r12 r13 r14 r15 (r4 - r8) (r5 - r9) (r6 - 10) (r7 - r11) (r2 - r4 - r12) (r3 - r5 - r13) (r1 - r2 - r6 - r14) (m1 - r1 - r3 - r7 - r15)
    # key addition step       
    #r8k1 r9k2 r10k3 r11k4 r12k5 r13k6 r14k7 r15k8 (r4k9 - r8k9) (r5k10 - r9k10) (r6k11 - r10k11) (r7k12 - r11k12) (r2k12 - r4k12 - r12k12) (r3k13 - r5k13 - r13k13) (r1k14 - r2k14 - r6k14 - r14k14) (m1k15 - r1k15 - r3k15 - r7k15 - r15k15)                                        
    output = []
    for byte in input_bytes:
        data = [byte]        
        for round in range(rounds):
            data[:] = encode(data, modulus)               
             
        multiplication_subroutine(data, [item | 1 for item in key], modulus)
        assert len(data) == 2 ** rounds, (len(data), 2 ** rounds)
        output.extend(data[:])          
    return output
    
def decrypt(ciphertexts, key, rounds=5, modulus=DEFAULT_MODULUS):  
    """ usage: decrypt(ciphertexts, key, 
                       rounds=5, modulus=DEFAULT_MODULUS) => plaintext
                       
        Given ciphertexts and key, return plaintexts. """        
    output = [] 
    for ciphertext in slide(ciphertexts, 2 ** rounds):        
        multiplication_subroutine(ciphertext, [modular_inverse(item | 1, modulus) for item in key], modulus)            
        for round in range(rounds):    
            ciphertext[:] = decode(ciphertext, modulus)          
        output.append(ciphertext[0])   
    return output
        
def test_encrypt_decrypt():
    from utilities import addition_subroutine
    key = generate_key()
    ciphertext1 = encrypt([1], key)
    ciphertext2 = encrypt([2], key)        
    addition_subroutine(ciphertext1, ciphertext2, DEFAULT_MODULUS)
    addition_subroutine(ciphertext1, ciphertext2, DEFAULT_MODULUS)
    answer = decrypt(ciphertext1, key)
    assert answer == [5], answer    
    
    data = [1 << count for count in range(8)]
    data2 = bytearray(urandom(8))
    correct_answer = [(data[index] + data2[index]) % DEFAULT_MODULUS for index in range(8)]
    ciphertext1 = encrypt(data, key)
    ciphertext2 = encrypt(data2, key)
    
    addition_subroutine(ciphertext1, ciphertext2, DEFAULT_MODULUS)
    answer = decrypt(ciphertext1, key)
    assert answer == correct_answer, (answer, correct_answer)
     
if __name__ == "__main__":
    test_encrypt_decrypt()
   