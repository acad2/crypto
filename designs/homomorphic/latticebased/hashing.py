import hashlib
import hmac as _hmac

def hash_function(data, algorithm="sha256"):
    return getattr(hashlib, algorithm.lower())(data).digest()
    
def hmac(data, key, algorithm="sha256"):
    return _hmac.HMAC(key, data, getattr(hashlib, algorithm.lower())).digest()
    