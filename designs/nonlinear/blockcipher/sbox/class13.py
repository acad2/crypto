def class13(a, b, c, d):
    # worst case differential probability: 1/4
    # optimal implementation among optimal 4x4 sboxes
    # http://skew2011.mat.dtu.dk/proceedings/Finding%20Optimal%20Bitsliced%20Implementations%20of%204%20to%204-bit%20S-boxes.pdf
    t = a
    
    a &= b
    a ^= c
    
    c &= b
    c ^= d
    
    d &= a
    d ^= t
    
    b ^= c & t
    return a, b, c, d
    
def generate_table():
    table = []
    for a in range(2):
        for b in range(2):
            for c in range(2):
                for d in range(2):
                    a, b, c, d = class13(a, b, c, d)
                    table.append((a << 3) | (b << 2) | (c << 1) | d)
    return table
    
    