import pprint

import _aes

aes = _aes.AES()
round = aes.aes_round_no_key

def test_4bit_sbox():
    from crypto.analysis.cryptanalysis import summarize_sbox  
    ddt = {}
    last_output = round([0 for count in range(16)])
    for word1 in range(1, 256):
        state = [0 for count in range(15)] + [word1]
        output = round(state)
        print output
        for byte in range(16):
            try:
                ddt[word1 ^ (word1 - 1)][byte][(output[byte] ^ last_output[byte])] += 1
            except KeyError:
                ddt[word1 ^ (word1 - 1)][byte] = {output[byte] ^ last_output[byte] : 1}
    pprint.pprint(ddt)
    #for input_difference, output_info in ddt.items():
    #    for output_difference, amount in output_info.items():
            
if __name__ == "__main__":
    test_4bit_sbox()
    