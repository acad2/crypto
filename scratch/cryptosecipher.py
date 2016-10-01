from pride.crypto.utilities import bytes_to_words, words_to_bytes

def _cic_blockcipher32_encrypt(key, m, rounds, 
                               cround = 0x9e3779b9, cmul = 0x6a09e667,
                               _mask=0xFFFFFFFF):
    for round in range(rounds):
        for index in range(len(key)):
            m ^= key[index]
            m = (m * cmul) & _mask
            m ^= m >> 16
            m = m + (m << 16) & _mask
        m = (m + ((cround * round) & _mask)) & _mask   
    return m ^ key[0]
    
#def _cic_blockcipher32_decrypt(key, m, rounds,
#                               cround = 0x9e3779b9, cmul = 0x6a09e667,
#                               _mask=0xFFFFFFFF):
#    m ^= key[0]
#    for round in range(rounds):
#        m = (_mask + (m - ((cround * round) & _ mask))) & _mask
#        for index in reversed(range(len(key))):
#            m = (_mask + (m - (m << 16))) & _mask
#            m ^= m >> 16
#            m = _mask + 
                               
def blockcipher32(key, m, rounds=1):
    key = bytes_to_words(bytearray(key), 4)
    m = bytes_to_words(bytearray(m), 4)[0]
    return words_to_bytes([_cic_blockcipher32_encrypt(key, m, rounds)], 4)

def test_blockcipher32():
    data = "Test"
    key = "\x00" * 4
    ciphertext = blockcipher32(key, data)
    print("plaintext:  {}\n".format(data))
    print("ciphertext: {}".format(ciphertext))
    
#public static uint Encrypt(uint[] key, uint m)
#{
#	for(uint r = 1; r <= rounds; r++)
#	{
#		for(int i = 0; i < key.Length; i++)
#		{
#			m ^= key[i];
#			m *= cmul;
#			m ^= m >> 16;
#			m += m << 16;
#		}
#		m += cround * r;
#	}
#	return m ^ key[0];
#}
            
#for (size_t i = 0; i < N; ++i) {
#  word _mask = -((lhs >> i) & 1);
#  word prod = rhs << i;
#  ret = ret + (prod & _mask);
#}            
if __name__ == "__main__":
    test_blockcipher32()
    