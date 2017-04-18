from os import urandom
import hashlib
import hmac

from persistence import save_data, load_data

def hash_password(password, iterations, algorithm="pbkdf2hmac", sub_algorithm="sha256",
                                        salt=None, salt_size=16, output_size=32):    
    salt = urandom(salt_size)
    header = save_data(algorithm, sub_algorithm, iterations, salt_size, output_size, salt)
    if algorithm == "pbkdf2hmac":
        return save_data(header, hashlib.pbkdf2_hmac(sub_algorithm, header + password, salt, iterations, output_size))
    else:
        raise ValueError("Unsupported algorithm: '{}'".format(algorithm))

def verify_hashed_password(password, header_salt_hash):
    header, correct_output = load_data(header_salt_hash)
    algorithm, sub_algorithm, iterations, salt_size, output_size, salt = load_data(header)
    if algorithm == "pbkdf2hmac":
        output = hashlib.pbkdf2_hmac(sub_algorithm, header + password, salt, iterations, output_size)
    else:
        raise ValueError("Unsupported algorithm: '{}'".format(algorithm))
    return constant_time_comparison(output, correct_output)    
    
def constant_time_comparison(data1, data2):
    return hmac.compare_digest(data1, data2)        
                   
def key_derivation_function(derivation_material, salt=None, output_size=32, 
                            algorithm="pbkdf2_hmac", sub_algorithm="sha256",
                            work_factor=100000):
    salt = salt if salt is not None else urandom(32)
    header = save_data(algorithm, sub_algorithm, work_factor, len(salt), output_size)
    return hashlib.pbkdf2_hmac(sub_algorithm, header + derivation_material, salt, work_factor, output_size)
    
def test_hash_password():
    password = "password"
    iterations = 100000
    _hash = hash_password(password, iterations)
    assert verify_hashed_password(password, _hash)   
    invalid_password = "passwore"
    assert not verify_hashed_password(invalid_password, _hash)    
    
    key = key_derivation_function(password)
    print "Passed hash_password/verify_password unit test"
    
    
if __name__ == "__main__":
    test_hash_password()
    