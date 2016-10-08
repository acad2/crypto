from crypto.utilities import slide
from cryptanalysis import summarize_sbox
  
kalyna_sbox = [int(_bytes, 16) for _bytes in """A8 43 5F 06 6B 75 6C 59 71 DF 87 95 17 F0 D8 09
                                                6D F3 1D CB C9 4D 2C AF 79 E0 97 FD 6F 4B 45 39
                                                3E DD A3 4F B4 B6 9A 0E 1F BF 15 E1 49 D2 93 C6
                                                92 72 9E 61 D1 63 FA EE F4 19 D5 AD 58 A4 BB A1
                                                DC F2 83 37 42 E4 7A 32 9C CC AB 4A 8F 6E 04 27
                                                2E E7 E2 5A 96 16 23 2B C2 65 66 0F BC A9 47 41
                                                34 48 FC B7 6A 88 A5 53 86 F9 5B DB 38 7B C3 1E
                                                22 33 24 28 36 C7 B2 3B 8E 77 BA F5 14 9F 08 55
                                                9B 4C FE 60 5C DA 18 46 CD 7D 21 B0 3F 1B 89 FF
                                                EB 84 69 3A 9D D7 D3 70 67 40 B5 DE 5D 30 91 B1
                                                78 11 01 E5 00 68 98 A0 C5 02 A6 74 2D 0B A2 76
                                                B3 BE CE BD AE E9 8A 31 1C EC F1 99 94 AA F6 26
                                                2F EF E8 8C 35 03 D4 7F FB 05 C1 5E 90 20 3D 82
                                                F7 EA 0A 0D 7E F8 50 1A C4 07 57 B8 3C 62 E3 C8
                                                AC 52 64 10 D0 D9 13 0C 12 29 51 B9 CF D6 73 8D
                                                81 54 C0 ED 4E 44 A7 2A 85 25 E6 CA 7C 8B 56 80""".split()]
#print len(kalyna_sbox), len(set(kalyna_sbox))
#summarize_sbox(kalyna_sbox)

print kalyna_sbox[45],  255 - 45,   255 - kalyna_sbox[45]
print kalyna_sbox[152], 255 - 152, 255 - kalyna_sbox[152]

# sbox1[45] = 210; 255 - 45 = 210, 255 - 210 = 45,
# F(x) = 255 - x
