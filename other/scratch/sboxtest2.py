import pprint

sbox = {}
for _input in range(256):
    for test_output in range(256):
        if (_input * test_output) % 256 == 1:
            try:
                sbox[_input].append(test_output)
            except KeyError:
                sbox[_input] = [test_output]

in_binary = {}
for key in sbox.keys():    
    binary_key = format(key, 'b').zfill(8)
    in_binary[binary_key] = []
    for value in sbox[key]:
        in_binary[binary_key].append(format(value, 'b').zfill(8))
        
#in_binary = dict((format(key, 'b').zfill(8), format(value, 'b').zfill(8)) for key, value in sbox.items())
pprint.pprint(in_binary)

#sbox = []
for byte in sbox
#    sbox.append(((byte * 31) % 257) ^ 99)
#from crypto.analysis.cryptanalysis import summarize_sbox
#summarize_sbox(sbox)