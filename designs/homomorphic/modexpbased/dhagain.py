# k + m is secure if len(k) >= len(m) and entropy(k) >= entropy(m)
# i.e. k = 1011
#       - adversary knows key = xxxx
#      m = 1001
#       - adversary knows m = xxx1 (1 bit of information)
#      xxxx
#      xxx1 +
#      ---- =
#      xxxA   # x = unknown to adversary; A = known to adversary
#       - adversary still only knows the same 1 bit
#       - it does not help to obtain any other bits

# kr + m is 




# m ^ e mod n
# m is message
# exponent is encryption key
# modulus selects the block size
# ciphertexts support multiplication
# encryption is commutative

# modular exponentiation is a secret-key, commutative block cipher that is "tweakable" via the block size parameter
# the "tweak" or block size selection is the prime modulus
# the exponent is the encryption key
# the base is the message
# ciphertexts are computed as (message ** encryption_exponent) mod prime_modulus
# the decryption key can be computed as modular_inverse(encryption_exponent, prime_modulus - 1)

# DH key exchange represents application of the commutative cipher on equivalent plaintext messages.
# (g ** x) ** y mod p == (g ** y) ** x mod p
# Alice encrypts g using key x
# Bob encrypts g using key y
# Alice encrypts (g ** y) using x to obtain (g ** y) ** x mod p == s
# Bob encrypts (g ** x) using y to obtain (g ** x) ** y mod p == s

k1 = 137
k2 = 220
p = 257

r1 = 112
r2 = 56
public_key1 = pow(r1, k1, p)
public_key2 = pow(r2, k2, p)

exchange1 = pow(public_key1 * public_key2, k1, p)
exchange2 = pow(public_key1 * public_key2, k2, p)

secret1 = pow(exchange2, k1, p)
secret2 = pow(exchange1, k2, p)
assert secret1 == secret2



