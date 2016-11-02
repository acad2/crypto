import pprint

from crypto.utilities import bytes_to_longs
from crypto.designs.blockcipher import _aes

aes = _aes.AES()
round = aes.aes_round_no_key

def test_4bit_sbox(_zeros=[0 for count in range(15)]):
    from crypto.analysis.cryptanalysis import summarize_sbox  
    ddt = dict((bit, {}) for bit in range(32))
    
    for word1 in range(256):
        print("{}%...".format((word1 / 256.0) * 100))
        for difference in range(1, 256):            
            state1 = _zeros + [word1]
            state2 = _zeros + [word1 ^ difference]
            output1 = bytes_to_longs(round(round(state1)))
            output2 = bytes_to_longs(round(round(state2)))
            state1, state2 = bytes_to_longs(state1), bytes_to_longs(state2)
            input_difference = [state1[index] ^ state2[index] for index in range(4)]
            difference = [output1[index] ^ output2[index] for index in range(4)]
            mask = 1                        
            for bit in range(32):               
                _input_difference = (input_difference[0] & mask) | ((input_difference[1] & mask) << 1) | ((input_difference[2] & mask) << 2) | ((input_difference[3] & mask) << 3)
                _output_difference = (difference[0] & mask) | ((difference[1] & mask) << 1) | ((difference[2] & mask) << 2) | ((difference[3] & mask) << 3)
                try:
                    ddt[bit][(_input_difference, _output_difference)] += 1
                except KeyError:
                    ddt[bit][(_input_difference, _output_difference)] = 1
                mask <<= 1                                          

    pprint.pprint(ddt)
    #for input_difference, output_info in ddt.items():
    #    for output_difference, amount in output_info.items():
        
if __name__ == "__main__":
    test_4bit_sbox()
    