# g = 3
# n = 7

# 0 3 6 2 5 1 4
# 0 3 6
# 2 5 
# 1 4

# there are g subgroups
# subgroup_size := n / g
# the remainder n % g is spread out over some of the other subgroups, sometimes making other groups larger, sometimes making a new small subgroup

# the subgroup that a particular element belongs to can be determined via x % g
#

def q_finder(x, g, n):   
    _x = x
    _n = n + 1
    qs = []
    
    for count in range(16):        
        x *= (_n)
        assert x % n == _x            
        qs.append(x)
    return qs