import operator
import getpass
import hmac
import itertools
import random
import hashlib
import functools

from pride.crypto.utilities import save_data, load_data, slide

RANGE_256 = tuple([chr(x) for x in range(256)])
PRINTABLE_ASCII = tuple(chr(x) for x in xrange(32, 127))

class InvalidSignature(BaseException): pass

def function(key, data): pass

def HMAC(key, data, algorithm="sha256"):
    return hmac.new(key, data, getattr(hashlib, algorithm)).digest()
    
def hmac_factory(algorithm):
    return functools.partial(HMAC, algorithm=algorithm)
    
HMAC_SHA256 = hmac_factory("sha256")    
HMAC_SHA512 = hmac_factory("sha512")
            
def generate_mac(key, data, algorithm="SHA256"):
    return hmac.new(key, data, getattr(hashlib, algorithm.lower())).digest()

def verify_mac(key, data, mac, algorithm="SHA256"):
    return hmac.compare_digest(hmac.new(key, data, 
                                        getattr(hashlib, algorithm.lower())).digest(),
                               mac)
                                   
def _xor(input_one, input_two):
    return ''.join(chr(ord(character) ^ ord(input_two[index])) for 
                   index, character in enumerate(input_one))            
            
def generate_challenge(key, mac_key, challenge_size=32, bytes_per_hash=1, 
                       hash_function="sha256", unencrypted_data='',
                       answer=bytes()):
    """ Create a challenge that only the holder of key should be able to solve.
        
        mac_key is required to assure integrity and authenticity of the 
        challenge to the client. 
        
        challenge_size is the total amount of data the client must crack.
        A random challenge of challenge_size is generated, and separated into
        challenge_size / bytes_per_hash subchallenges. The time taken to crack 
        a single subchallenge is O(2**n) (? not sure!), where n is the number 
        of bytes_per_hash. 
        
        hash_function is a string name of an algorithm available in the hashlib module
        
        unencrypted_data is an optional string of data to be packaged with the challenge.
        The data is not kept confidential, but possesses integrity and authenticity
        because of the message authentication code over the entire package.
        
        answer is an optional string, that when supplied, is used instead of a
        random challenge. If supplied, the challenge_size argument has no effect. """        
    answer = answer or random._urandom(challenge_size)
    challenge = encrypt(answer, key, hmac_factory(hash_function), input_block_size=bytes_per_hash)
    package = save_data(challenge, bytes_per_hash, unencrypted_data)
    return (save_data(generate_mac(mac_key, package, hash_function), hash_function, package), 
            answer)
    
def solve_challenge(packed_challenge, key, mac_key):
    """ Solve a challenge that was produced by generate_challenge with the
        given key and mac_key. 
        
        Raises InvalidSignature in the event of a message authentication 
        code mismatch. """
    mac, hash_function, package = load_data(packed_challenge)
    if verify_mac(mac_key, package, mac, hash_function):
        challenge, bytes_per_hash, unencrypted_data = load_data(package)
        
        return (decrypt(challenge, key, hmac_factory(hash_function),
                        getattr(hashlib, hash_function)().digestsize, 
                        output_block_size=bytes_per_hash), 
                unencrypted_data)
    else:
        raise InvalidSignature("Message authentication code mismatch")
        
def generate_padding(key, byte_length, function):
    """ Return padding of byte_length, generated from function and key """    
    key_padding = ''
    key_size = len(key)
    while key_size + len(key_padding) < byte_length:
        key_padding += function(key, key_padding)
    return key_padding[:byte_length]
    
def brute_force(output, function, test_bytes, key, pre_key='', post_key='', joiner=''):
    """ Attempt to find the input to function that produced output.
        
        test_bytes is an iterable of iterables; Each iterable contains the
        characters to be tested at the correlated index; characters may
        be byte strings of arbitrary length.
        
        pre_key and post_key are what information, if any, is already known 
        of the input that produced output. 
        
        Test guesses are formed by taking the next successive cartesian product
        from test_bytes. 
        
        Test function input is a concatenation of (pre_key | guess | post_key).
        
        Returns bytes of the permutation that produced output; Only the cracked
        bytes are returned, not the concatenation of the keys with the guess.
        
        Raises ValueError if no combination of input products results in the correct
        output; This can be caused by incorrect pre_key/post_key information, or 
        incorrectly configured test_bytes. """        
    for permutation in itertools.product(*test_bytes):
  #      print "Guessing: ", joiner.join(permutation)
        if function(key, pre_key + joiner.join(permutation) + post_key) == output:
            return joiner.join(permutation)
    else:           
        raise ValueError("Unable to recover input for given output with supplied arguments")      

def identity_mode(plaintext_block, ciphertext_block, key, function):
    """ A do-nothing mode of operation/key rotation function.
        Returns inputs unmodified. 
        
        Net effect(s): None """
    return plaintext_block, ciphertext_block, key, function
    
def xor_with_key(plaintext_block, ciphertext_block, key, function):
    """ Xors key with ciphertext_block. If the key is not long enough 
        to xor with the ciphertext, then it is padded with additional
        bytes generated from the key.
        
        Net effect(s): 
        
            - The round key must known to begin to decrypt the block.
            - Ciphering is more effective in serial then in parallel. """
    ciphertext_size = len(ciphertext_block)
    if ciphertext_size > len(key):
        padded_key = key + generate_padding(key, ciphertext_size, function)
    else:
        padded_key = key
    ciphertext_block = _xor(ciphertext_block, padded_key)
    return plaintext_block, ciphertext_block, key, function
    
def all_or_nothing(plaintext_block, ciphertext_block, key, function):
    """ Update the key with the previous plaintext_block. In order to derive 
        the key for the next round, the previous plaintext must be obtained. 
        
        Net effect(s): 
            
            - In order to efficiently decrypt block N, block N-1 must first be decrypted.
            - Encryption cannot be done in serial
            - Decryption can be done more efficiently in serial then in parallel.
                     
        Note the effects presume that the decryptor wishes to use the informational
        advantage gained by decrypting cumulative plaintexts. A decryptor with the
        key can still attempt to decrypt block N1 without decrypting block N0 first
        by sheer brute force, without the trapdoor information. Doing so would
        require guessing the first plaintext bytes and the second at the same time,
        resulting in increased complexity and therefore time slowdown, potentially
        defeating any benefits of parallelism. """
    return plaintext_block, ciphertext_block, function(key, plaintext_block), function
    
def encrypt(plaintext, key, function, mode_of_operation=xor_with_key, 
            key_rotation=all_or_nothing, input_block_size=1): 
    """ An encryption function with an associated work factor. Returns a
        ciphertext encrypted under key. 
        
        The input_block_size adjusts two factors: First, by a smaller
        amount, as input_block_size increases, generating the challenge tends
        to take less time. Second, as input_block_size increases, solving the
        challenge tends to take significantly more time.
        
        As an example, consider a server that requires proof of work with
        each request submitted by a client. An overloaded server could 
        increment the bytes per hash to crack. As a result, it would spend 
        less time generating each challenge, while clients would take 
        significantly longer to solve each challenge. The net effect is
        an actual reduction in traffic, as clients cannot effectively make
        additional requests until the current challenge is solved.

        Note that output block size is determined implicitly by the function used,
        and is not otherwise configurable.
        
        As a result, when used with hash functions, ciphertext is necessarily
        significantly larger then the input plaintext."""
    if len(plaintext) % input_block_size:
        raise ValueError("Plaintext length not a multiple of input_block_size")
    ciphertext = ''           
    
    for plaintext_block in slide(plaintext, input_block_size):
        ciphertext_block = function(key, plaintext_block) 
        (plaintext_block, ciphertext_block, 
         key, function) = mode_of_operation(plaintext_block, ciphertext_block, key, function)
        
        ciphertext += ciphertext_block
        
        (plaintext_block, ciphertext_block, 
         key, function) = key_rotation(plaintext_block, ciphertext_block, key, function)
    return ciphertext
    
def decrypt(ciphertext, key, function, input_block_size, 
            mode_of_operation=xor_with_key, key_rotation=all_or_nothing, 
            output_block_size=1):
    """ Decrypt the ciphertext hash chain as produced by encrypt. The amount
        of work and therefore time taken to recover the plaintext increases
        dramatically as output_block_size is incremented. The output_block_size
        argument must be set to the same value used by the server or the
        decryption will fail. """
    test_bytes = [RANGE_256 for count in range(output_block_size)]
    plaintext = plaintext_block = ''

    for ciphertext_block in slide(ciphertext, input_block_size):
        (plaintext_block, ciphertext_block, 
         key, function) = mode_of_operation(plaintext_block, ciphertext_block, 
                                            key, function)
                                          
        plaintext_block = brute_force(ciphertext_block, function, test_bytes, key)
        plaintext += plaintext_block
        
        (plaintext_block, ciphertext_block,
         key, function) = key_rotation(plaintext_block, ciphertext_block, key, function)            
    return plaintext   
    
def split_secret(secret, piece_count, function):
    """ Splits secret into piece_count separate challenges, based on cracking a
        given output function from function.
        
        The secret can be recovered by a threshold quantity of pieces, which is
        determined by the size of the secret and the number/weight of pieces. 
        
        Challenge weight is calculated as:
            
            piece_size, last_challenge_size = divmod(len(secret), piece_count - 1)
            
        Note that if the length of secret is not evenly divisible by piece_count,
        then the last challenge will be of weight len(secret) % (piece_count - 1). """
    piece_size, remainder = divmod(len(secret), piece_count - 1)    
    pieces = []
    for index in range(piece_count - 1):
        piece = secret[index * piece_size:(index + 1) * piece_size]
        challenge_iv = random._urandom(16)
        hash_output = function(challenge_iv, piece)
        pieces.append((index, hash_output, challenge_iv))
    last_iv = random._urandom(16)
    #print "Creating last block: ", -remainder
    pieces.append((index + 1, function(last_iv, secret[-remainder:]), last_iv))
    return pieces, function('', secret), piece_size

def recover_secret_fragment(_hash, iv, piece_size, function=HMAC_SHA256):
    """ Recovers a fragment produced by split_secret """
    return brute_force(_hash, function, [RANGE_256 for x in xrange(piece_size)], iv) 

def recover_secret_from_fragments(master_challenge, available_pieces, share_count, 
                                  secret_size, function=HMAC_SHA256):
    """ Recover the secret that was split into share_count shares by split_secret.
        master_challenge is the function output of the secret to be recovered.
        available_pieces is an iterable of (fragment_index, fragment) pairs.
        secret_size is the length of the secret to be recovered.
        function is the function used to create the shares. """
    guesses = [RANGE_256 for count in range(share_count - 1)]
    
    for fragment_index, fragment in sorted(available_pieces, key=operator.itemgetter(0)):
        guesses[fragment_index] = [fragment]
        
    if fragment_index != share_count:
        guesses.extend((RANGE_256 for count in range(secret_size % (share_count - 1))))
        
    return brute_force(master_challenge, function, guesses, '')
    
def create_password_recovery(function, trapdoor_information_size=16, password='',
                             password_prompt="Please enter the password to create a recovery hash: "):
    """ Create a password recovery hash. 
        Returns: function(password + trapdoor_information)
        
        Presuming the user remembers enough of the password hashed this way, 
        they should be able to recover the password given the hash and the
        trapdoor information. """
    trapdoor_information = random._urandom(trapdoor_information_size)
    return (function(trapdoor_information, 
                     password or getpass.getpass(password_prompt)), 
            trapdoor_information)
            
def recover_password(recovery_hash, trapdoor_information, function=HMAC_SHA256,
                     character_set=PRINTABLE_ASCII):
    """ Attempt to recover a password from the hash and information created
        by create_password_recovery. 
        
        function must be the same function used to create the hash
        character_set defaults to printable ascii characters only, but can
        be modified as needed to support arbitrary characters. character_set 
        determines what characters are guessed when brute forcing unknown characters.
        
        Returns the recovered password on success. Recovery time scales with the number
        of correctly remembered characters. Note that if enough characters
        are not remembered accurately, recovery may take a (prohibitively) long time. """
    print "Welcome to the password recovery program"
    print "First, please enter your password, as best as you can remember."
    print "If you cannot remember a character, supply your best guess"
    guess = getpass.getpass("Please enter password: ")
    print "Next, enter your password again, and replace characters you are not certain of with a space"
    _guess = getpass.getpass("Please enter password: ")
    test_characters = []
    for index, character in enumerate(_guess):
        if character == ' ' and guess[index] != ' ':
            characters = [character.lower(), character.upper()]
            _characters = [ord(char) for char in characters]
            test_characters.append([char for char in character_set if ord(char) not in _characters])
        else:
            test_characters.append([character])
    
    return brute_force(recovery_hash, function, test_characters, post_key=trapdoor_information)
                      
def test_password_recovery():
    test_password = "This is a test"
    recovery_hash, iv = create_password_recovery(HMAC_SHA256, password=test_password)
    recovered_password = recover_password(recovery_hash, iv)
    assert recovered_password == test_password
        
def test_split_secret():
    secret = "This is a test. " * 2    
    shares = 31
    pieces, master_secret, piece_size = split_secret(secret, shares, HMAC_SHA256)
    
    recovered_pieces = []
    for index, _hash, iv in pieces[:shares - 1]:
        recovered_pieces.append((index, recover_secret_fragment(_hash, iv, piece_size)))
                           
    _secret = ''.join((item[1] for item in recovered_pieces))
    
    last_share_size = len(secret) % (shares - 1)
    last_index, last_hash, last_iv = pieces[shares - 1]
    _secret += recover_secret_fragment(last_hash, last_iv, len(secret) % (shares - 1))
    assert _secret == secret 
    
    # attempt to recover secret without last block
    recovered_secret = recover_secret_from_fragments(master_secret, recovered_pieces, 
                                                     shares, len(secret))
    assert recovered_secret == secret
    
def test_encrypt_decrypt():
    key = random._urandom(32)
    message = random._urandom(32)    
    ciphertext = encrypt(message, key, HMAC_SHA256)
    plaintext = decrypt(ciphertext, key, HMAC_SHA256, 32)
    assert plaintext == message, plaintext
    
def test_challenge():
    key = random._urandom(32)
    mac_key = random._urandom(32)
    unencrypted_data = "This is some awesome unencrypted data"
    challenge, answer = generate_challenge(key, mac_key,
                                           unencrypted_data=unencrypted_data)
    _answer, _unencrypted_data = solve_challenge(challenge, key, mac_key)
    assert _answer == answer
    assert _unencrypted_data == unencrypted_data
    
def test_time():
    key = random._urandom(15)
    mac_key = random._urandom(32)
    unencrypted_data = "This is some awesome unencrypted data"
    from pride.functions.decorators import Timed
    for bytes_per_hash in (1, 2, 3):
        if bytes_per_hash == 3:
            challenge_size = 33
        else:
            challenge_size = 32
            
        print ("Time to generate challenge with {} bytes per hash: ".format(bytes_per_hash), 
               Timed(generate_challenge, 1)(key, mac_key, unencrypted_data=unencrypted_data,
                                             bytes_per_hash=bytes_per_hash, 
                                             challenge_size=challenge_size))
                                             
        challenge, answer = generate_challenge(key, mac_key, bytes_per_hash=bytes_per_hash,
                                               unencrypted_data=unencrypted_data,
                                               challenge_size=challenge_size)
        print ("Time to solve challenge with {} bytes per hash: ".format(bytes_per_hash),
               Timed(solve_challenge, 1)(challenge, key, mac_key))
        
def test_validity():
    key = random._urandom(32)
    mac_key = random._urandom(32)
    unencrypted_data = "This is some awesome unencrypted data"
    for x in xrange(100):
        challenge, answer = generate_challenge(key, mac_key, unencrypted_data=unencrypted_data,
                                               bytes_per_hash=3)
        _answer, data = solve_challenge(challenge, key, mac_key)
        assert _answer == answer
        
if __name__ == "__main__":
    #test_password_recovery()
    test_split_secret()
    test_encrypt_decrypt()    
    test_challenge()
    test_time()
   # test_validity()
    