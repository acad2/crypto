""" A standalone module to demo an authenticated feistel network built from a prf """
import itertools

def xor_sum(data1):
    state = 0
    for index, byte in enumerate(data1):
        data1[index] ^= byte
    return state
    
def permute(left_byte, right_byte, key_byte, modifier):        
    """ Psuedorandom function. left_byte, right_byte, and key_byte are all
        16-bit unsigned integers. 
        
        psuedo code:
            
            right_byte += key_byte + modifier
            left_byte += right_byte >> 8
            left_byte ^= rotate_right(right_byte, 3)
            
        The basic idea is to view the left and right bytes as two wheels on a 
        simple combination lock. The right wheel is incremented by an amount,
        and if the amount "wraps around", then the left wheel is incremented
        by an amount as well. For example:
            
            [(0, 0), (0, 1), (0, 2), (0, 3), ... (0, 8), (0, 9), (1, 0), (1, 1), ...]
            
        Except, in this function, the "wrap around" effect is achieved via
        overflow into the high order byte instead of addition modulo 256. 
        Any overflow is added to the byte to the left.
        
        After the overflow is added to the left byte, the right byte is rotated
        by an amount and combined with the left via bitwise exclusive or. This
        helps add nonlinearity to the transformation. 
        
        This function was intended to be applied on a sequence of bytes, from
        the right to the left; At the end, when the 0th index is being supplied
        as the right_byte, the -1 index should be taken to mean the last byte
        of data, on the right. This wraps the effects of the permutation around
        to the other side. Two rounds are typically required to achieve full 
        diffusion. """                
        
    right_byte = (right_byte + key_byte + modifier) & 65535
    left_byte = (left_byte + (right_byte >> 8)) & 65535
    left_byte ^= ((right_byte >> 3) | (right_byte << (16 - 3))) & 65535
    return left_byte, right_byte
    
def permute_subroutine(data, key, index, modifier):    
    """ Helper function """
    data[index - 1], data[index] = permute(data[index - 1], data[index], key[index], modifier)
    
def permutation(data, key, modifier):
    """ Permutes all of the bytes in data in succession, from right to left,
        with wrap around, using the supplied key and modifier. 
        
        For more information, please see the documentation for the permute 
        function. """
    for index in reversed(range(len(data))):
        permute_subroutine(data, key, index, modifier)
            
def crypt_data(data, key, tag, constant_selector, direction, rounds=3, constants=tuple(range(256))):        
    """ Feistel network based which uses permute as the round function.
        Functions as a basic feistel network, with some extra details:
            
            - Uses fused loops when loading buffers/applying the prf
            - 2 Key bytes operate on each data byte
            - The prf contributes to the creation of an authentication tag            
            - Internal round keys are different for any given message 
            - Tweakable constants parameter: one 16 bit word per round
                
        The key schedule is online and requires no up front preprocessing.
        This is an advantage to embedded devices, but a drawback to general purpose CPUs.
        
        Encryption produces an authentication tag, regardless of the mode of
        operation used.

        Recommended keysize: >= 256 bits. This stems from the size requirements
        of the authentication tag, which in general should be at least 128 bits
        to avoid the possibility of tag collisions. 
        
        An N bit key requires an N bit data input. So a 256 bit key operates
        upon data blocks of 256 bits in size. Half of the data generated
        each round is for plaintext/ciphertext data, while the other half
        is key material for the tag. 
        
        Number of rounds is configurable. A bare minimum of 3 are required to 
        at least obtain proper diffusion. 
        
        Each encryption uses a tweakable set of round constants. There should
        be one 16-bit constant per round. 
        
        The constant_selector variable is set to 0 for encryption, and to
        rounds - 1 for decryption.
        
        Likewise, the direction variable is set to 1 for encryption, and to
        -1 for decryption. """
    size = len(data)
    half_size = size / 2
    assert len(key) == half_size
    last_byte_of_right = half_size - 1
    current_index = constant_selector
    right = [0 for index in range(half_size)] # buffer of 16-bit wide unsigned integers  
    master_key = list(key)
    key = master_key[:]    
    
    for round in range(rounds): 
        
        key = master_key[:]        
        round_constant = constants[current_index] + xor_sum(data[half_size:])

        # This is more or less what the cipher does. (Not exactly because of wrap around) 
        # It only looks more complicated because the implementation uses fused loops
        # and has to actually load the bytes into the array first.
        
        #permutation(right, key, round_constant)
        #permutation(key, right, round_constant)
        #permutation(key, key, round_constant)
        #permutation(right, key, round_constant)
        
        # load bytes into the "right" buffer while permuting them and the key           
        right[last_byte_of_right] = data[size - 1]        
        right[last_byte_of_right - 1] = data[size - 2]
        
        permute_subroutine(right, key, last_byte_of_right, round_constant)
        
        for index in reversed(range(half_size - 1)):                         
            # load next byte into buffer
            right[index - 1] = data[half_size + index] 

            permute_subroutine(right, key, index, round_constant)                                                                    
            permute_subroutine(key, right, index, round_constant)
                
        for index in reversed(range(half_size)): # permute again; ensures complete diffusion
            permute_subroutine(key, key, index, round_constant)
            permute_subroutine(right, key, index, round_constant)                     
            
        # Using the right as key material, xor one byte at a time into data/tag, and then swap left/right                        
        for index in reversed(range(half_size)):                                         
            key_byte = right[index] # a 16 bit word
            tag[index] ^= key_byte >> 8 # the left byte is for the tag
            data[index] ^= key_byte & 255 # the right byte is for the data
            data[index], data[half_size + index] = data[half_size + index], data[index] # swap the halves
        
        current_index += direction # selects the next round constant   
        
    for index in range(half_size):
        data[index], data[half_size + index] = data[half_size + index], data[index]   
        
def encrypt_block(data, key, rounds=3, constants=tuple(range(256))):
    data = list(bytearray(data))
    tag = list(bytearray(len(data) / 2))
    key = list(bytearray(key))
    key = [key[index] | (key[index + 1] << 8) for index in range(0, len(key), 2)]
    crypt_data(data, key, tag, 0, 1, rounds, constants)
    return bytes(bytearray(data)), bytes(bytearray(tag))
    
def decrypt_block(data, key, tag, rounds=3, constants=tuple(range(256))):
    data = list(bytearray(data))
    tag = list(bytearray(tag))
    key = list(bytearray(key))    
    key = [key[index] | (key[index + 1] << 8) for index in range(0, len(key), 2)]
    crypt_data(data, key, tag, len(data) - 2, -1, rounds, constants)
    if tag != list(bytearray(len(data) / 2)):
        raise ValueError("Invalid tag: {}; Expected: {}\nPlaintext was: {}".format(tag, list(bytearray(len(data) / 2)), bytearray(data)))
    return bytes(bytearray(data))
    
def crypt_data_test():    
    key = "\x00" * 4
    data = "\x00" * 4
    ciphertext, verifier_tag = encrypt_block(data, key)
    real_ending = ciphertext[-2:]
    all_but_last_bytes = ciphertext[:-2]
    
    import itertools
    ASCII = ''.join(chr(x) for x in range(256))
    print "Testing for duplicate tags when half the data is modified, using 65535 different endings: "
    for ending in (''.join(_bytes) for _bytes in itertools.product(ASCII, ASCII)):                           
        _ciphertext = all_but_last_bytes + ending
        try:
            plaintext = decrypt_block(_ciphertext, key, verifier_tag)
        except ValueError:
            pass            
        else:
            if ending != real_ending:
                print ("Duplicate tag", ending, real_ending)
            
if __name__ == "__main__":
    crypt_data_test()
    