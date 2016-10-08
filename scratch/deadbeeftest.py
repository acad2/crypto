seed = 0
state = 0xdeadbeef

def rand():
    global seed
    global state
    seed = (seed << 7) ^ ((seed >> 25) + state)
    state = (state << 7) ^ ((state >> 25) + 0xdeadbeef)	
    return seed
    
def srand(x):
	seed = x
	state = 0xdeadbeef
    
def test_metrics():
    from crypto.analysis.metrics import test_randomness
    from crypto.utilities import integer_to_bytes
    output = ''
    srand(1)
    while len(output) < (1024 * 1024 / 4):        
        output += integer_to_bytes(rand(), 4)        
    test_randomness(output)
    
if __name__ == "__main__":
    test_metrics()
    