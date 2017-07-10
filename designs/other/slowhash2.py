import hashlib
from collections import deque

def tunable_hash(data, key, work_factor, algorithm="sha224"):
    return hashlib.pbkdf2_hmac(algorithm, data, key, work_factor)
    
def slow_hash(data, state_size=1024 * 1024, tweak="seed" * 4, keysize=16,
              workfactor1=1, hash_function=tunable_hash):  
    tweak_size = len(tweak)
    state = bytearray(state_size)
    state[:tweak_size] = tweak
    for data_block in slide(data, keysize):
        _state = csprng(seed=state[:tweaksize], key=data_block, count=state_size)
        xor_subroutine(state, _state)
    
    state = bytes(state)
    state2 = b''
    
    for state_block in slide(state, workfactor1):
        output = tunable_hash(state2 + state_block)
        state2 = output + state2
        