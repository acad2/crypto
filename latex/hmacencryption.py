hmac encryption aprils fools day paper
HMAC based Authenticated Encryption
Encrypt(m, k, iv): return HMAC(data=iv + m, key=k)
Decrypt(tag, k, iv): return brute_force(tag, HMAC, iv, k)
   
offers provable secure confidentiality, contingent only upon HMAC having first preimage resistance
authentication and integrity are backed by HMACs security proof
superior encryption speed compared to other schemes based on HMAC - does not require encrypting plaintext blocks
  - only if decryption speed is impossibly slow
  - otherwise, may be slower or competitive in encryption speed
  - decryption speed will be relatively slow
  - might be faster then 3DES + HMAC
superior storage requirements to other schemes based on HMAC - does not require storing any ciphertext blocks
superior code size requirements to other schemes based on HMAC - does not require elaborate cipher algorithms (and possibly modes of operation too)
  - does require brute force algorithm, which takes up some code
flexible key and seed length
tunable performance
future proof - just change to a better hash
make iv misuse resistant mode?
