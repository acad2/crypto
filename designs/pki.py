TEMPORARY_STORAGE = dict()

def manually_enter_public_key(identifier, message="Enter the public key for '{}': "):
    return raw_input(message)
        
def retrieve_public_key(identifier, storage=TEMPORARY_STORAGE):
    try:
        public_key = storage[identifier]
    except KeyError:
        storage[identifier] = manually_enter_public_key(identifier)
    return public_key    
        
def validate_public_key(identifier, public_key, hash_function=hash_function):
    if hash_function(public_key) == identifier:
        return public_key
    else:
        raise ValueError("Invalid value for public key")
    
    
    