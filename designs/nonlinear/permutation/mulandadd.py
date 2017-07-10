#k1m + k2
#k3(k1m + k2) + k4
#k1k3m + k2k3 + k4

#k5(k1k3m + k2k3 + k4) + k6
#k1k3k5m + k2k3k5 + k4k5 + k6

#k1m + k2
#k3(k1m + k2) + k4
#k1k3m + k2k3 + k4

# a += (b * c) + d
# b += (c * d) + a

def multiply_and_add(a, b, c, modulus=2 ** 32):
    return ((a * b) + c) % modulus
    
def permutation(a, b, c, d, modulus=2 ** 32):
    a = (a ^ multiply_and_add(b, c, d, modulus) << 1) % modulus
    b = (b ^ multiply_and_add(c, d, a, modulus) << 2) % modulus
    c = (c ^ multiply_and_add(d, a, b, modulus) >> 1) % modulus
    d = (d ^ multiply_and_add(a, b, c, modulus) >> 2) % modulus
    return a, b, c, d
     
def visualize_permutation():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 0, 1))
    
def test_active_bits():
    from crypto.analysis.active_bits import search_minimum_active_bits2
    search_minimum_active_bits2(permutation)
    
if __name__ == "__main__":
    visualize_permutation()
    test_active_bits()
    
    