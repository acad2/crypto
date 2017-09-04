def iterate_mix_columns_find_matrix(iterations):   
    # 1a + 1b + 0c + 0d
    # 0a + 1b + 1c + 1d
    # 0a + 0b + 1c + 1d
    # 1a + 1b + 0c + 1d
        
    # 1a + 2b + 1c + 1d
    # 1a + 2b + 2c + 3d
    # 1a + 1b + 1c + 2d
    # 2a + 3b + 1c + 2d
    
    # 2a + 4b + 3c + 4d  
    output = [[1, 0, 0, 0],
              [0, 1, 0, 0],
              [0, 0, 1, 0],
              [0, 0, 0, 1]]
    a, b, c, d = output
    for count in range(iterations):        
        for index in range(4):
            a[index] += b[index]
            c[index] += d[index]
            b[index] += c[index]
            d[index] += a[index]
    return output    
        
def test_iterate_mix_columns_find_matrix():    
    for round in range(8):
        matrix = iterate_mix_columns_find_matrix(round)
        print "After {} Rounds: ".format(round)
        for row in matrix:
            print row
    print "After 32 Rounds: "
    matrix = iterate_mix_columns_find_matrix(32)
    mask = (2 ** 32) - 1
    for row in matrix:
        print [item & mask for item in row]
    with open("matrixfile.txt", 'w') as _file:
        _file.write(str(matrix))
        _file.flush()
    
    
        #print '\n'.join([format(word & mask, 'b').zfill(32) for word in row])
        
if __name__ == "__main__":
    test_iterate_mix_columns_find_matrix()
    