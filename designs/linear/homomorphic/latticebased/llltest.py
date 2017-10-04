# ax + by + cz
# x + ai(by + cz)    
from crypto.utilities import random_integer, modular_inverse

from liblll import lll_reduction as lll

def transpose(matrix):
    output = [[] for count in range(len(matrix))]
    for row in reversed(matrix):
        for index, element in enumerate(row):
            output[index].append(element)
    matrix[:] = output

def algorithm(value, basis, modulus):  
    #inverse = modular_inverse(basis, modulus)
    #value = (value * inverse) % modulus
    #basis = inverse
    
    #matrix = [[1, 0, modulus],
    #          [0, 1, basis],
    #          [0, 0, value]]    
    #transpose(matrix)
    zeros = [0] * len(basis)
    ones = [[0] * len(basis)] * len(basis)
    for index in range(len(basis)):
        ones[index][index] = 1
    
    matrix = [[0] + zeros + [1] +
              [[0] + ones[index] + [1] for index in range(len(basis))] +
              [value] + basis + [modulus]]
    return lll(matrix)
    
def test_algorithm():    
    points = [random_integer(1) for count in range(4)]
    modulus = 257#random_integer(7)
    
    basis = [random_integer(1) for count in range(4)]
            
    value = sum(point * points[index] for index, point in enumerate(basis)) % modulus    

    e = 0
    print algorithm(value + e, basis, modulus)
    print points
    
if __name__ == "__main__":
    test_algorithm()
