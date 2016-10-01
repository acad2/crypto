import os
from converttest import generate_key

ASCII = ''.join(chr(x) for x in xrange(256))

def convert(old_value, old_base, new_base):
    old_base_size = len(old_base)    
    old_base_mapping = dict((symbol, index) for index, symbol in enumerate(old_base))
            
    for leading_zero_count, symbol in enumerate(old_value):
        if old_base_mapping[symbol]:
            break
    #zero_padding = new_base[0] * leading_zero_count
    
    decimal_value = sum((old_base_mapping[value_representation] * (old_base_size ** power) for
                         power, value_representation in enumerate(reversed(old_value))))
    
    # this is the above in a potentially more readable format:
    # decimal_value = 0    
    # for power, value_representation in enumerate(reversed(old_value)):
    #     decimal_value += old_base_mapping[value_representation]*(old_base_size**power)
    new_value = ''                        
    if decimal_value:
        new_base_size = len(new_base)           
        while decimal_value > 0: # divmod = divide and modulo in one action
            decimal_value, digit = divmod(decimal_value, new_base_size)
            new_value += new_base[digit]
    return ''.join(reversed(new_value)).rjust(max(leading_zero_count, len(old_value)), new_base[0])
    
def arbitrary_base_addition(value1, value2, base):
    assert len(value1) == len(value2)
    size = len(value1) - 1
    base_size = len(base)     
    for offset in xrange(size + 1):                    
        current_index = size - offset              
        other_value = base.index(value2[current_index])
        first_value = base.index(value1[current_index])
                
        new_value = first_value + other_value        
        carry, new_value = divmod(new_value, base_size)
        #print "Added: ", first_value, other_value, first_value + other_value, carry, ord(base[new_value])
        value1[current_index] = base[new_value]
        
        if carry:            
            left_value = base.index(value1[current_index - 1]) # careful about - indexing seeking from the back
            value1[current_index - 1] = base[left_value + carry]                 
                
def arbitrary_base_subtraction(value1, value2, base):
    assert len(value1) == len(value2), (len(value1), len(value2))
    size = len(value1) - 1
    base_size = len(base)
    for offset in xrange(size + 1):
        current_index = size - offset
        first_value = base.index(value1[current_index])
        second_value = base.index(value2[current_index])
        
        new_value = first_value - second_value
        if second_value > first_value:
            carry_index = current_index - 1
            while carry_index:
                if value1[carry_index] != base[0]:                    
                    value1[carry_index] = base[base.index(value1[carry_index]) - 1]
                    break
                else:
                    carry_index -= 1              
            value1[current_index] = base[base_size + new_value]
        else:                        
            value1[current_index] = base[new_value]
        
def test_key_exchange_idea():
    public_key1 = bytes(generate_key(256))    
    
    private_key1 = bytes(generate_key(256))
    private_key2 = bytes(generate_key(256))
    assert private_key1 != private_key2
    
    message = ("\x00" * 7) + "\x01"  
    print "Plaintext message: ", [ord(byte) for byte in message]
    print
   # message = convert(message, ASCII, private_key1)
    message = convert(message, private_key1, public_key1)
    
    message2 = ("\xff" * 7) + "\x02"#os.urandom(32)    
    print "Plaintext message 2: ", [ord(byte) for byte in message2]
    print
    #message2 = convert(message2, ASCII, private_key2)
    message2 = convert(message2, private_key2, public_key1)
    
    message3 = list(message)    
    arbitrary_base_addition(message3, message2, public_key1)  
    print "Encoded Message: ", [ord(byte) for byte in message]
    print
    print "Encoded Message2: ", [ord(byte) for byte in message2]
    print
    print "Encoded Message1 + Encoded Message2: ", [ord(char) for char in message3]
    print 
    print "Real value of message3: ", [ord(char) for char in convert(message3, public_key1, private_key1)]
    print
    print "Incorrect value of message3: ", [ord(char) for char in convert(message3, public_key1, ASCII)]

    arbitrary_base_subtraction(message3, message, public_key1)
    print
    print "Message3 - Message = Message2:", [ord(char) for char in convert(message3, public_key1, private_key1)]
    print
    assert message3 == list(message2), "Correct Message2: " + str([ord(char) for char in convert(message2, public_key1, private_key1)])    
        
def test_arbitrary_base_addition():
    value1 = list("0123456789")
    value2 = list("9876543210")
    base = bytes(generate_key(seed=range(10)))# list("3017845962")    
    
    value1_in_base = convert(value1, "0123456789", base)
    value2_in_base = convert(value2, "0123456789", base)
        
    value1_in_public_base = list(convert(value1_in_base, base, ASCII))
    value2_in_public_base = list(convert(value2_in_base, base, ASCII))
    print "Adding encoded numbers: "
    print ''.join(value1_in_public_base)
    print ''.join(value2_in_public_base) + " +"
    print "_" * len(value1)
    arbitrary_base_addition(value1_in_public_base, value2_in_public_base, ASCII) 
    print ''.join(value1_in_public_base) + '        in base: ({})'.format(list(bytearray(value1_in_public_base)))
    print convert(convert(value1_in_public_base, ASCII, base), base, "0123456789") + "        in base: ASCII/range(256)"
                     
def test_arbitrary_base_subtraction():
    value1 = list("9876543210")
    value2 = list("0123456789")
    from random import shuffle
    shuffle(value1)
    shuffle(value2)
    value1_copy, value2_copy = value1[:], value2[:]
    
    base = bytes(generate_key(seed=range(10)))# list("3017845962")    
    
    value1_in_base = convert(value1, "0123456789", base)
    value2_in_base = convert(value2, "0123456789", base)
        
    value1_in_public_base = list(convert(value1_in_base, base, ASCII))
    value2_in_public_base = list(convert(value2_in_base, base, ASCII))
    print "\nSubtracting encoded numbers: "
    print ''.join(value1)#_in_public_base)
    print ''.join(value2)#_in_public_base) + " -"
    print "_" * len(value1)
    arbitrary_base_subtraction(value1_in_public_base, value2_in_public_base, ASCII) 
    print ''.join(value1_in_public_base), '        ({})'.format(list(bytearray(value1_in_public_base)))
    print convert(convert(value1_in_public_base, ASCII, base), base, "0123456789")
    print int(''.join(str(item) for item in value1_copy)) - int(''.join(str(item) for item in value2_copy))
    
def test_idea():
    common_base = ASCII
    alices_key = bytes(generate_key(256))
    eves_key = bytes(generate_key(256))
    random_value = bytes(bytearray(15) + bytearray("\x01"))#os.urandom(16)
    print "Alices value: ", random_value
    random_value_encoded = convert(random_value, alices_key, common_base)
    print
    print "Alices ciphertext: ", random_value_encoded
    
    
    random_value2 = bytes(bytearray(15) + bytearray("\x02"))#os.urandom(16)
    print "Bobs value: ", random_value2
    bobs_key = bytes(generate_key(256))
    random_value2_encoded = convert(random_value2, bobs_key, common_base)
    print
    print "Bobs ciphertext: ", random_value2_encoded
    
    ciphertext = list(random_value_encoded)
    ciphertext2 = list(random_value2_encoded)
    arbitrary_base_addition(ciphertext, ciphertext2, common_base)
    
    combined_message = list(convert(ciphertext, common_base, alices_key))
    
    arbitrary_base_subtraction(combined_message, ciphertext, alices_key)
    
    ciphertext2_in_alices_base = combined_message[:]
    ciphertext2_in_common_base = convert(ciphertext2_in_alices_base, alices_key, common_base)
    
    print "Alice got: ", [byte for byte in bytearray(ciphertext2_in_common_base)]
    
if __name__ == "__main__":
    test_arbitrary_base_addition()
    test_arbitrary_base_subtraction()
    #test_key_exchange_idea()    
    #test_idea()
    