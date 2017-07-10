from hmac import HMAC as h
from itertools import product
import hashlib as l

def n(f, i, t): return (''.join(_input) for _input in g(*i) if f(''.join(_input)) == t)    
def g(*i): return product(*i)
def i(p, k, a="sha256"): return h(k, p, getattr(l, a.lower())).digest()    
def s(p, x): return (p[(y * x):(y * x) + x] for y in range((len(p) / x) + 1 if len(p) % x else len(p)))
def e(p, k, iv, x=1, f=i): return [len(p)] + [f(iv +  _d, k) for _c, _d in enumerate(s(p + ("\x00" * (len(p) % x)), x))] # (f(iv + p[:_c], k) if _c else '') +
def d(c, k, iv, x=1, f=i, i=[bytes(bytearray(range(256)))] * 4): return ''.join(next(n(lambda _p: f(iv +  _p, k), i[:x], _p)) for _c, _p in enumerate(c[1:]))[:c[0]]        
#(c[_c + 1] if _c else '') +
def test_encrypt():        
    message = "Testing! :D"
    key = "this is great"
    iv = "let's have some funnnn"
    
    ciphertext2 = e(message, key, iv, 1)        
    plaintext2 = d(ciphertext2, key, iv, 1)
    assert plaintext2 == message
    
if __name__ == "__main__":
    test_encrypt()
        