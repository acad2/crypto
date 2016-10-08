def invert(x, mask=0xFFFFFFFFFFFFFFFF):
    return ~x & mask
    
def chi_step(x, y, z):
    return x ^ (invert(y) & z)
    
def permutation(x, y, z):
    x = chi_step(x, y, z)
    y = chi_step(x, y, z)
    z = chi_step(x, y, z)
    return x, y, z
    
def visualize_chi_step():
    from crypto.analysis.visualization import test_4x32_function
    test_4x32_function(permutation, (0, 0, 1))
    
if __name__ == "__main__":
    visualize_chi_step()
    