from keyedhash import hash_function

def quasi_commutative_hash(group_hash, group_member, hash_function=hash_function):
    member_hash = hash_function(group_member)
    xor_subroutine(group_hash, member_hash)
    return group_hash
    
def test_quasi_commutative_hash():
    members = []
    group_range = {}
    group_hash = bytearray(32)
    for member_number in range(32):
        member = bytearray(32)
        member[0] = member_number
        quasi_commutative_hash(group_hash, member)
        group_range[member_number] = group_hash[:]
    
    
    