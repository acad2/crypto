DEFAULT_MODULUS = 256

def distribute_test(a, b, modulus=DEFAULT_MODULUS):    
    return (a * (b + a)) % modulus
    
def test_distribute_test():
    b = 5
    outputs = []
    for a in range(256):
        outputs.append(distribute_test(a, b))
    print len(set(outputs)), outputs, sorted(outputs)
    
if __name__ == "__main__":
    test_distribute_test()
    