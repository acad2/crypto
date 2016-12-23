from crypto.utilities import modular_subtraction, modular_inverse

def arithmetic_choice(a, b, c, modulus=256):
    return c + (a * (b + c)) % modulus
    
def invert_arithmetic_choice(d, b, c, modulus=256):
    return modular_subtraction(d, c, modulus) * (modular_inverse(a, modulus) * modular_subtraction(b, c, modulus)) % modulus, modulus)
    
def choice_swap(a, b, c):
    t = a
    a = arithmetic_choice(c, a, b)
    b = arithmetic_choice(c, b, t)
    return a, b
    
def invert_choice_swap(a, b, c):
    t = b
    b = invert_arithmetic_choice(c, b, a)
    a = invert_arithmetic_choice(c, a, t)
    return a, b
        
def test_arithmetic_choice():
    a, b, c = 1, 2, 3
    
    _a = arithmetic_choice(c, a, b)
    _b = arithmetic_choice(c, b, a)
    __a = invert_arithmetic_choice(c, _b, _a)
    __b = invert_arithmetic_choice(c, _a, _b)    
    print (a, b), (_a, _b), (__a, __b)
    
if __name__ == "__main__":
    test_arithmetic_choice()
    