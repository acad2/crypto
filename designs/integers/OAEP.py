def OAEP_encode(message, G, H, k0, k1, n):
    message = null_pad(message, n - k0)
    r = bytearray(urandom(k0))
    X = message
    G_r = G(r)
    xor_subroutine(message, G_r)
    H_X = H(X)
    Y = r
    xor_subroutine(Y, H_X)
    return X, Y
    
def OAEP_decode(X, Y, G, H):
    r = Y
    H_X = H(X)
    xor_subroutine(r, H_X)
    G_r = G(r)
    padded_message = X
    xor_subroutine(padded_message, G_r)
    return padded_message