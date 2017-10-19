from liblll import lll_reduction as lll

def invert(x, a, p, n):
    #matrix = [[   0, 1, 0,  a],
    #          [   0, 0, 1, -p],
    #          [2**n, 0, 0, -x]]
              
    matrix = [[2**n, 0, 0],
              [   0, 0, 1],
              [   0, 1, 0],
              [  -x,-p, a]]
    
    #matrix = [[a, -p, -x],
    #          [0,  1,  0],
    #          [0,  0,  1],
    #          [2**n, 0, 0]]
    return lll(matrix)

def test_invert():
    from coverage import generate_keypair, encapsulate_key, E_SIZE
    pub, priv = generate_keypair()
    c, s = encapsulate_key(pub)
    a, p = pub
    output = invert(c, a, p, E_SIZE )
   # output = [[(p + item) % p for item in row] for row in output]
    print [s in row for row in output]
    print s
    print output
    
    with open("challenge.txt", 'w') as _file:
        _file.write("a: {}\n".format(a))
        _file.write("p: {}\n".format(p))
        _file.write("challenge: {}\n".format(c))
        _file.write("answer   : {}\n".format(s))
        
if __name__ == "__main__":
    test_invert()
    
    