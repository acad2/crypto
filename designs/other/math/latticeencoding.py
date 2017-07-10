base = 17
points = range(16)

def encode_point(point):
    assert point in points
    return base * point
    
def decode_point(encoded_point, base):
    e = encoded_point % base
    modifier = 0
    if e > base / 2:
        modifier = 1
    return ((encoded_point - e) / base) + modifier
    
    