from os import urandom

ASCII = bytes(bytearray(range(256)))

def _shuffle(data, key): 
    n = len(data)
    for i in reversed(range(1, n)):
        j = key[i] & (i - 1)
        data[i], data[j] = data[j], data[i]
    
def _generate_key(size=256, seed=None):
    if seed is None:
        key = bytearray(range(size))            
    else:
        key = bytearray(seed)
        size = len(seed)
    random_data = bytearray(urandom(size))
    _shuffle(key, random_data)    
    return key
    
def convert(old_value, old_base, new_base):
    old_base_size = len(old_base)    
    old_base_mapping = dict((symbol, index) for index, symbol in enumerate(old_base))
            
    for leading_zero_count, symbol in enumerate(old_value): # counts the number of leading zeros
        if old_base_mapping[symbol]:
            break
        
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
  
def arbitrary_base_subtraction2(value1, value2, base):
    borrow = 0;
    for i in range(len(value1)):    
        temp = ord(value1[i]) - ord(value2[i]) - borrow;
        if (temp < 0):
            temp += len(base);
            borrow = 1;
        else:
            borrow = 0;
        
        value1[i] = temp;
    
    return borrow;        
  
def test_subtraction2():
    value1 = list("9876543210")
    value2 = list("0123456789")
    
    value2_copy = value1[:]
    value2_copy = value2[:]
    
    other_base = bytes(_generate_key(seed=range(256)))
        
    value1_other_base = list(convert(bytes(value1), ASCII, other_base))
    value2_other_base = convert(bytes(value2), ASCII, other_base)
    
    value1_other_base_copy = value1_other_base[:]
    value2_other_base_copy = value2_other_base[:]
    
    arbitrary_base_subtraction(value1_other_base, value2_other_base, other_base)        
    print "First value: ", ''.join(value1_other_base), len(value1_other_base)
    print "Converted  : ", convert(bytes(bytearray(value1_other_base)), other_base, ASCII)
    
    arbitrary_base_subtraction2(value1_other_base_copy, value2_other_base_copy, other_base)
    print "Second value:", bytes(bytearray(value1_other_base_copy)), len(value1_other_base_copy)
    print "Converted   :", convert(bytes(bytearray(value1_other_base_copy)), ASCII, other_base)
    
    
def test_arbitrary_base_addition():
    value1 = list("0123456789")
    value2 = list("9876543210")
    base = bytes(_generate_key(seed=range(10)))# list("3017845962")    
    
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
    
    base = bytes(_generate_key(seed=range(10)))# list("3017845962")    
    
    value1_in_base = convert(value1, "0123456789", base)
    value2_in_base = convert(value2, "0123456789", base)
        
    value1_in_public_base = list(convert(value1_in_base, base, ASCII))
    value2_in_public_base = list(convert(value2_in_base, base, ASCII))
    print "\nSubtracting encoded numbers: "
    print ''.join(value1)#_in_public_base)
    print ''.join(value2)#_in_public_base) + " -"
    print "_" * len(value1)        
    
    arbitrary_base_subtraction(value1_in_public_base, value2_in_public_base, ASCII) 
    print ''.join(bytes(value1_in_public_base)), '        ({})'.format(list(bytearray(value1_in_public_base)))
    print convert(convert(value1_in_public_base, ASCII, base), base, "0123456789")
    print int(''.join(str(item) for item in value1_copy)) - int(''.join(str(item) for item in value2_copy))

    
    
def addition_test():
    plaintext1 = bytearray(16)
    plaintext1[-1] = 1

    secret_key = bytearray(os.urandom)
    private_base = generate_key(256)
    public_base = generate_key(256)
    
    arbitrary_base_addition(plaintext, secret_key, ASCII)
    ciphertext1 = convert(plaintext, private_base, public_base)
    
    plaintext2 = bytearray(16)
    plaintext2[-1] = 1
    
    secret_key2 = bytearray(os.urandom)
    arbitrary_base_addition(plaintext2, secret_key2, ASCII)
    arbitrary_base_addition(secret_key, secret_key2, ASCII)
    
    ciphertext2 = convert(plaintext2, private_base, public_base)
    
    arbitrary_base_addition(ciphertext, ciphertext2, public_base)
    
    correct_string = convert(ciphertext, public_base, private_base)
    arbitrary_base_subtraction(correct_string, secret_key, ASCII)
    
    print("Correct string: {}".format(correct_string))
    
    maybe_string = convert(ciphertext, public_base, ASCII)
    print("Maybe string  : {}".format(maybe_string))
    
    
if __name__ == "__main__":
    #test_arbitrary_base_addition()
    #test_arbitrary_base_subtraction()
    test_subtraction2()
    