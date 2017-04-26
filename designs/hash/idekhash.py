def _h(m, k1, k2):
    return ((m * k1) + k2)
    
def h(m, k1, k2):
    m_hash = _h(m, k1, k2)
    return (m * m_hash) + m_hash
    # m * ((m * k1) + k2) + ((m * k1) + k2)
    # mm * mk1 + mk2 + mk1 + k2
    
def test_h():
    for m in range(16):
        for k1 in range(16):
            for k2 in range(16):
                print m, h(m, k1, k2)
                
if __name__ == "__main__":
    test_h()
    