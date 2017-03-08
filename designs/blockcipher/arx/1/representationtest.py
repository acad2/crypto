
def test_sbox_representation():
    from encrypt import sbox as sbox_f
    sbox = [int(character, 16) for character in "086d5f7c4e2391ba"]
    
    _sbox = []
    
    for a in range(2):
        for b in range(2):
            for c in range(2):
                for d in range(2):             
                    #print
                    a, b, c, d = sbox_f(a, b, c, d)
                    #print '\n'.join(format(word, 'b').zfill(64) for word in (a, b, c, d))
                    
    print sbox
    print _sbox
    print sbox == _sbox                
    
if __name__ == "__main__":
    test_sbox_representation()
    
