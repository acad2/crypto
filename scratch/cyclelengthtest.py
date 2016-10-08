import operator

from crypto.utilities import find_cycle_length

def find_max_cycle_length_modexp_sbox():
    max_cycles = []
    for g in range(1, 256):
        print "Testing: ", g
        for modulus in range(3, 258):
            sbox = []
            for exponent in range(256):
                sbox.append(pow(g, exponent, modulus))
            if len(set(sbox)) == 256:                
                cycle_length = len(find_cycle_length(lambda number: pow(g, number, modulus), 1))
                max_cycles.append((g, modulus, cycle_length))                    
    return sorted(max_cycles, key=operator.itemgetter(2), reverse=True)
    
def test_find_max_cycle_length_modexp_sbox():
    print find_max_cycle_length_modexp_sbox()
    
# the above gives (63 ** N) mod 257 as the longest cycle length (255)

def test_63_exp_N_mod_257_sbox():
    sbox = [pow(63, number, 257) % 256 for number in range(256)]
    from cryptanalysis import summarize_sbox
    summarize_sbox(sbox)
    
if __name__ == "__main__":
    #test_find_max_cycle_length_modexp_sbox()    
    test_63_exp_N_mod_257_sbox()
    