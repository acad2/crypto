from crypto.designs.blockcipher.aes_procedures import S_BOX
from differential import build_difference_distribution_table
from cryptanalysis import cryptanalyze_sbox_worst_case
from crypto.designs.blockcipher.blockcipher2 import shuffle_bytes
from crypto.utilities import slide

S_BOX2 = []
for block in slide(S_BOX, 16):
    shuffle_bytes(block)
    S_BOX2.extend(block)

S_BOX3 = [pow(63, entry, 257) % 256 for entry in S_BOX]
S_BOX4 = [pow(63, entry, 257) % 256 for entry in S_BOX2]
S_BOX5 = [(entry ^ 128) & 128 for entry in S_BOX]
S_BOX6 = [S_BOX[entry] for entry in S_BOX5]
S_BOX7 = [(entry + 1) for entry in S_BOX5]

def test_sbox_differentials():    
    print cryptanalyze_sbox_worst_case(S_BOX)
    #print cryptanalyze_sbox_worst_case(S_BOX2)
    #print cryptanalyze_sbox_worst_case(S_BOX3)
    #print cryptanalyze_sbox_worst_case(S_BOX4)
    print cryptanalyze_sbox_worst_case(S_BOX5)
    print cryptanalyze_sbox_worst_case(S_BOX6)
    print cryptanalyze_sbox_worst_case(S_BOX7)
    
#    for number in range(256):
#        print cryptanalyze_sbox_worst_case([(entry ^ number) & number for entry in S_BOX])
   
    print cryptanalyze_sbox_worst_case([(entry ^ 251) & 251 for entry in S_BOX])
    linearity_14_differential_6_sbox = [(entry ^ 251) & 251 for entry in S_BOX]
    
    #for number in range(256):
    #    print "{}: {}".format(number, cryptanalyze_sbox_worst_case([((entry + number) * number) % 256 for entry in S_BOX]))
     # yields nothing interesting   
    
    print cryptanalyze_sbox_worst_case([S_BOX[linearity_14_differential_6_sbox[x]] for x in range(256)])
    
if __name__ == "__main__":
    test_sbox_differentials()
    