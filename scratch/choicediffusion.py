from crypto.designs.ciphercomponents import choice

__all__ = ["choice_diffusion", ]


#@pride.unittest.test(crypto.crypto.analysis.visualization.test_4x64_function) ?
# auto generate unit test    ?

def hamming_weight(*inputs):
    return sum(format(word, 'b').count('1') for word in inputs)
    
def choice_diffusion(in0, in1, in2, in3, k0, k1, k2, k3):
    weight = hamming_weight(in0, in1, in2, in3)
    print "At enter: Weight: ", hamming_weight(in0), hamming_weight(in1), hamming_weight(in2), hamming_weight(in3)
    out0 = choice(k0, in0, in1);
    out1 = choice(k0, in1, in0);
    
    out1 = choice(k1, out1, in2);
    out2 = choice(k1, in2, out1);    
                              
    out2 = choice(k2, out2, in3);
    out3 = choice(k2, in3, out2);
                              
    out3 = choice(k3, out3, out0);
    out0 = choice(k3, out0, out3);      
    
    
    print "At exit: Weight: ", weight
    return out0, out1, out2, out3, k0, k1, k2, k3
    
def test_choice_diffusion():
    from crypto.analysis.visualization import test_4x64_function
    test_4x64_function(choice_diffusion, (1, 2, 4, 8, 1, 2, 4, 8))
    
if __name__ == "__main__":
    test_choice_diffusion()
    