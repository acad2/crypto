# peer to peer encryption
# encryption:
#   - split data into K secret shares, where K is 16/32 for 128-bit/256-bit security
#   - generate an additional N - K random "dummy" shares that are the same size as the actual shares, where N is the number of peers that will store all of the shares
#   - generate a key for the DHT
#   - Enumerate the bits of the key, and:
#       - If the bit is 0, then securely send the next dummy share to the node indicated by the bit index
#       - If the bit is 1, then securely send the next secret share to the node indicated by the bit index
#
# decryption:
#   - generate the key for the DHT
#   - securely retrieve all of the entries from the N peers, in the same order used during encryption
#   - Enumerate the bits of the key, and:
#       - If the bit is 0, then do nothing
#       - If the bit is 1, then reclaim a share of the secret
#   - Re-obtain the data by re-combining the secret shares

# "generate a key for the DHT"
# - store one master key (256 bits)
# - use the master key and an identifier for the data to derive the DHT key
# - using convergent encryption (hashing the data to produce the encryption key) could be very interesting
#   - could save enormous amounts of space if no duplicate data exists in the network

# - total storage cost to the user who encrypts: 
#   - 1 256-bit master key
#   - 1 n-bit long identifier for the data (i.e. a filename)
#   - storage cost is independent of size of data encrypted (the network soaks up the storage cost)

# - total storage cost to the network:
# - per 1 encryption or decryption operation:
#   - (N * (k + n)) bits (N = number of peers; k = length of data/shares; n=length of file identification string)

# - total communications bandwidth:
# - per 1 encryption or decryption operation:
#   - (N * (k + n)) bits (N = number of peers; k = length of data/shares; n=length of file identification string)

# - what if peers collude?
# - even if all peers collude, they have a combinatorial problem to solve:
#   - they have to guess the right combination of shares to decrypt the data
#   - without the DHT key, they will have to guess which k out of N shares constitute the data
#   - formula for difficulty of k-out-of-n combination: n!/(k!(n - k)!)
#       - n=256, k=90 ~= 2 ** 235
#       - n=128, k=40 ~= 2 ** 110

# - "securely" send/retrieve
# - using public key encryption to send blocks to intended peers confidentially does not appear to be required
#   - if someone has all of the blocks, they still have to solve the combinatorial problem
# - still need to authenticate/provide integrity on the data
#   - use DHT techniques for ensuring integrity?
#   - worst case scenario: generate HMAC over all the shares + data

