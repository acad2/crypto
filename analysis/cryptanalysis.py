from math import log

import differential
import linear

STANDARD_DIFFERENTIAL = ((differential.xor, differential.xor), )

def cryptanalyze_sbox_worst_case(sbox, differential_types=STANDARD_DIFFERENTIAL):
    differentials = differential.find_best_differential(sbox, differential_types)
    linearity = linear.calculate_linearity(sbox, log(len(sbox), 2))
    return differentials, linearity
        
def summarize_sbox(sbox, differential_types=STANDARD_DIFFERENTIAL):
    sbox_size = len(sbox)
    differentials, linearity = cryptanalyze_sbox_worst_case(sbox, differential_types)
    print "The most probable differential characteristic(s):" 
    index = 0    
    for difference_input, difference_output, probability in differentials:
        input_difference_type, output_difference_type = differential_types[index]
        print "{} -> {} with probability {}/{} ({} -> {})".format(difference_input, difference_output, probability, sbox_size,
                                                                   input_difference_type, output_difference_type)
        index += 1
    print "Linearity: {} ({})".format(linearity[1], linearity[0])
    
def test_cryptanalyze_sbox_worst_case():
    from crypto.designs.blockcipher.aes_procedures import S_BOX       
    summarize_sbox(S_BOX)
    
def test_random_sbox():
    from crypto.utilities import shuffle
    from os import urandom
    sbox = range(256)
    shuffle(sbox, bytearray(urandom(256)))
    summarize_sbox(sbox)
    summarize_sbox(bytearray(urandom(256)))
    
if __name__ == "__main__":
    test_cryptanalyze_sbox_worst_case()
    #test_random_sbox()
    