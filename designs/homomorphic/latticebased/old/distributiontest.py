from crypto.utilities import random_integer

def test_output_distribution():
    p = 255
    outputs = []
    for q_count in range(256):
        for e_count in range(256):
            outputs.append((p * random_integer(1)) + random_integer(1))
    _outputs = set(outputs)
    print len(_outputs), _outputs
    
if __name__ == "__main__":
    test_output_distribution()
    