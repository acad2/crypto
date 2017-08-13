# coding=utf-8
import random

ss = 256
ks = 264
qs = 256
ns = 256
rs = 520
ps = 1040
ws = 1296

W = 2 ** ws
T = pow(3, 2 ** 11, W)
L = 2 ** ss
Lmask = L - 1
print("TinyPQ: λ=%u+%u, µ=%u, ρ=%u, η=%u, γ=%u\n" % (ss, ks-ss, ns, rs, ps, ws))

# Keygen
CompressedPrivateKey = random.getrandbits(qs)
PrivateKey = (W // CompressedPrivateKey) + 1
CompressedPublicKey = (T % PrivateKey) >> rs
PublicKey = T - (CompressedPublicKey << rs)
print("Private:\n" + str(CompressedPrivateKey))
print("Public:\n" + str(CompressedPublicKey) + "\n")

# Encrypt
Product		= PublicKey * random.getrandbits(ns)
Key			= (Product >> (rs+ns+ks-ss)) & Lmask
Ciphertext	= (Product >> ps) & Lmask
print("Ciphertext: \n" + str(Ciphertext))
print("Plaintext: \n" + str(Key))

# Decrypt
Plaintext = Ciphertext + 1
Plaintext <<= ps
Plaintext %= PrivateKey
Plaintext >>= (rs+ns+ks-ss)
Plaintext = L - Plaintext - 1
print(str(Plaintext) + "\n")