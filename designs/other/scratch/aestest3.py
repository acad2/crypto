import _aes

aes = _aes.AES()
round = aes.aes_round_no_key
state = [byte for byte in range(16)]
state = round(state)
print state