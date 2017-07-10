from crypto.utilities import choice, rotate_left

def diffusion_test(a, b): 
    # 0 1 2 3 4 5 6 7
    
    # a ^= rotate_left(a, 1)
    
    # 0 1 2 3 4 5 6 7
    # 1 2 3 4 5 6 7 0
    # = 
    # 01 12 23 34 45 56 67 70

    # a ^= rotate_left(a, 2)
    # 01 12 23 34 45 56 67 70
    # 23 34 45 56 67 70 01 12 
    # =
    # 0123 1234 2345 3456 4567 5670 6701 7012
    
    # a ^= rotate_left(b, 4)
    # a0123 a1234 a2345 a3456 a4567 a5670 a6701 a7012
    # b4567 b5670 b6701 b7012 b0123 b1234 b2345 b3456
    # =
    # a0123b4567 a1234b5670 a2345b6701 a3456b7012 a4567b0123 a5670b1234 a6701b2345 a7012b3456
    
    # b ^= rotate_left(a, 2)
    # b4567 b5670 b6701 b7012 b0123 b1234 b2345 b3456
    # a2345b6701 a3456b7012 a4567b0123 a5670b1234 a6701b2345 a7012b3456 a0123b4567 a1234b5670 
    # =
    # b4567a2345b6701 b5670a3456b7012 b6701a4567b0123 b7012a5670b1234 b0123a6701b2345 b1234a7012b3456 b2345a0123b4567 b3456a1234b5670
    # =
    # b0145a2345 b1256a3456 b2367a4567 b3470a5670 b0145a6701 b1256a7012 b2367a0123 b3470a1234
    a ^= rotate_left(a, 1)
    a ^= rotate_left(a, 2)
    b ^= rotate_left(b, 1)
    b ^= rotate_left(b, 2)
    a ^= rotate_left(b, 4)
    b ^= rotate_left(a, 2)
    return a, b
    

        
        
    
def diffusion_test2(a, b):
    # 0 1 2 3 4 5 6 7
    # a03 a14 a25 a36 a47 a50 a61 a72      # a ^= rotate_left(a, 3)
    #   0134 0235   0347    0136  0237   
    #    121  212    313     123   214
    
    
    # a03 a14 a25 a36 a47 a50 a61 a72
    # a61 a72 a03 a14 a25 a36 a47 a50      # a ^= rotate_left(a, 6) 
    # =
    # a0136 a1247 a0235 a1346 a2457 a0356 a1467 a0257
    
    # a0136 a1247 a0235 a1346 a2457 a0356 a1467 a0257
    # b0136 b1247 b0235 b1346 b2457 b0356 b1467 b0257 # a ^= b
    # = 
    # a0136b0136 a1247b1247 a0235b0235 a1346b1346 a2457b2457 a0356b0356 a1467b1467 a0257b0257
    
    #      b0136      b1247      b0235      b1346      b2457      b0356      b1467      b0257 
    # a0136b0136 a1247b1247 a0235b0235 a1346b1346 a2457b2457 a0356b0356 a1467b1467 a0257b0257
    #                 b023467    b1245      b04                              b0347      
    #                             121                                         313
    # =
    
    a ^= rotate_left(a, 3)
    a ^= rotate_left(a, 6)
    b ^= rotate_left(b, 3)
    b ^= rotate_left(b, 6)
    a ^= b
    b ^= rotate_left(a, 2)
    return a, b    
    
    # a0246 a1357 a2460 a3571 a4602 a5713 a6024 a7135
    # b0246 b1357 b2460 b3571 b4602 b5713 b6024 b7135
    # =
    # a0246b0246 a1357b1357 a2460b2460 a3571b3571 a4602b4602 a5713b5713 a6024b6024 a7135b7135
    
    # a0246b0246 a1357b1357 a2460b2460 a3571b3571 a4602b4602 a5713b5713 a6024b6024 a7135b7135
    #      b0246      b1357      b2460      b3571      b4602      b5713      b6024      b7135
    # b ^= rotate_left(a, )
    
    
    

    
    
    # 0 1 2 3 4 5 6 7
    
    # a ^= rotate_left(a, 1)
    
    # 0 1 2 3 4 5 6 7
    # 1 2 3 4 5 6 7 0
    # = 
    # 01 12 23 34 45 56 67 70

    # a ^= rotate_left(a, 2)
    # 01 12 23 34 45 56 67 70
    # 23 34 45 56 67 70 01 12 
    # =
    # 0123 1234 2345 3456 4567 5670 6701 7012
    
    # a ^= b
    # a0123 a1234 a2345 a3456 a4567 a5670 a6701 a7012
    # b0123 b1234 b2345 b3456 b4567 b5670 b6701 b7012
    # =
    # a0123b0123 a1234b1234 a2345b2345 a3456b3456 a4567b4567 a5670b5670 a6701b6701 a7012b7012
    
    # b ^= rotate_left(a, 2)
    #      b0123      b1234      b2345      b3456      b4567      b5670      b6701      b7012
    # a2345b2345 a3456b3456 a4567b4567 a5670b5670 a6701b6701 a7012b7012 a0123b0123 a1234b1234 
    # = 
    # a2345b0145 a3456b1256 a4567b2367 a5670b3470 a6701b4501 a7012b5612 a0123b6723 a1234b7034    
    
def shift_rows(b, d, amount):    
    b[:] = b[amount:] + b[:amount] # shift amount byte(s) leftwards
    d[:] = d[amount:] + d[:amount]

def _mix_pair(top, bottom, wordsize=8):
    top ^= bottom    
    top = rotate_left(top, 1, wordsize)
    bottom ^= top
    bottom = rotate_left(bottom, 2, wordsize)
    top ^= bottom
    top = rotate_left(top, 4, wordsize)
    bottom ^= top   
    return top, bottom
    
def mix_pairs(a, b, c, d):    
    for index in range(4):
        _a, _b, _c, _d = a[index], b[index], c[index], d[index]
        #_a, _b = _mix_pair(_a, _b)
        #_c, _d = _mix_pair(_c, _d)
        _a ^= _b
        _c ^= _d
        _b ^= rotate_left(_a, 2)
        _d ^= rotate_left(_c, 2)
        
        
        #_a ^= rotate_left(_b, 1); _c ^= rotate_left(_d, 1);
        #_b ^= rotate_left(_a, 2); _d ^= rotate_left(_d, 2);
        a[index], b[index], c[index], d[index] = _a, _b, _c, _d
        
def diffuse_state(a, b, c, d):
    for index in range(4):
        a[index], b[index] = diffusion_test2(a[index], b[index])
        c[index], d[index] = diffusion_test2(c[index], d[index])
    
def mix_state(a, b, c, d):        
    #diffuse_state(a, b, c, d)
    #shift_rows(b, d, 1)
    mix_pairs(a, b, c, d)
    shift_rows(b, d, 1)    
    mix_pairs(a, b, c, d)
    shift_rows(b, d, 2)
    mix_pairs(a, b, c, d)
    shift_rows(b, d, 2)    
    mix_pairs(a, d, b, c)
        
    # a0123b0123 a1234b1234 a2345b2345 a3456b3456 a4567b4567 a5670b5670 a6701b6701 a7012b7012
    # a2345b0145 a3456b1256 a4567b2367 a5670b3470 a6701b4501 a7012b5612 a0123b6723 a1234b7034      
    # c0123d0123 c1234d1234 c2345d2345 c3456d3456 c4567d4567 c5670d5670 c6701db6701 c7012d7012
    # c2345d0145 c3456d1256 c4567d2367 c5670d3470 c6701d4501 c7012d5612 c0123db6723 c1234d7034  
    
    # a0123b0123 a1234b1234 a2345b2345 a3456b3456 a4567b4567 a5670b5670 a6701b6701 a7012b7012
    # c0123d0123 c1234d1234 c2345d2345 c3456d3456 c4567d4567 c5670d5670 c6701db6701 c7012d7012
    # =
    # a0123b0123c0123d0123 a1234b1234c1234d1234 a2345b2345c2345d2345 a3456b3456c3456d3456 a4567b4567c4567d4567 a5670b5670c5670d5670 a6701b6701c6701db6701 a7012b7012c7012d7012
    
    #           c0123d0123           c1234d1234           c2345d2345           c3456d3456           c4567d4567           c5670d5670           c6701db6701          c7012d7012
    # a2345b2345c2345d2345 a3456b3456c3456d3456 a4567b4567c4567d4567 a5670b5670c5670d5670 a6701b6701c6701d6701 a7012b7012c7012d7012 a0123b0123c0123d0123 a1234b1234c1234d1234 
    #           c0145d0145           c1256d1256           c2367d2367           c3470d3470           c4501d4501           c5612d5612           c6723d6723           c7034d7034
    # =
    # a2345b2345c0145d0145 a3456b3456c1256d1256 a4567b4567c2367d2367 a5670b5670c5670d5670 a6701b6701c4501d4501 a7012b7012c5612d5612 a0123b0123c6723d6723 a1234b1234c7034d7034 
    
    
    
    
def test_diffusion_test():
    from os import urandom
    k = ord(urandom(1))
    for a in range(3):
        for b in range(3):
            print [format(item, 'b').zfill(8) for item in diffusion_test(a, b)]
            
def test_branching():
  #  branching = []
  #  for x in range(256):
  #      for y in range(256):
  #          output = diffusion_test2(y, x)
  #          output2 = diffusion_test2(y, (x + 1) % 256)
  #          difference = sum(format(output[index] ^ output2[index], 'b').count('1') for index in range(2))
  #          difference += format(x ^ ((x + 1) % 256), 'b').count('1') 
  #          branching.append(difference)
  #  print "Min difference: ", min(branching)
  #  print "Max difference: ", max(branching)
                
    branching = []    
    for x in range(256):
        for y in range(256):
            a, b, c, d = [bytearray(4) for count in range(4)]
            a[0] = x
            b[0] = y
            
            mix_state(a, b, c, d)
            output = a + b + c + d
            
            a, b, c, d = [bytearray(4) for count in range(4)]
            a[0] = (x + 1) % 256
            b[0] = y
            
            mix_state(a, b, c, d)
            output2 = a + b + c + d
            #print
            #print output
            #print output2
            difference = sum(1 for index in range(16) if output[index] != output2[index])
            assert difference, (x, y, output, output2)
            #difference = sum(format(output[index] ^ output2[index], 'b').count('1') for index in range(16))
            difference += 1#format(x ^ ((x + 1) % 256), 'b').count('1')
            branching.append(difference)
    print "Min difference: ", min(branching)
    print "Max difference: ", max(branching)
    print sorted(branching)[:80]
        
        
        

    
if __name__ == "__main__":
    #test_diffusion_test()
    test_branching()
        
        
    
    