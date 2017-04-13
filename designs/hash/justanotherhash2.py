from crypto.utilities import integer_to_bytes, pad_input

def compression_function(_bytes, p=range(1, 256)):
    state = 0
    output = bytearray(32)
    for round in range(1):
        for index, byte in enumerate(bytearray(_bytes)):
            state += p[state % 255] * (byte + index)
            state *= p[(byte) % 255]
            output[index % 32] = (output[index % 32] + state + byte) % 256
    return output

def hash_function(message):
    message = pad_input(message, 32)
    return compression_function(message)
        