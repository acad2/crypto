from mickshashg import G as _G

N = 160

def Eval(_input, constants):
    out = 0;
    for i in range(N):
        out ^= constants[i]     
    return out
    
def Double(constants):
    out = []
    for i in range(N):
        out.append(Eval(constants[i], constants))
    return out

def Hash( _input, depth, constants=_G):
    G = constants[:]
    out = _input;
    while depth:
        if (depth & 1):
            out = Eval(out, G)
        G[:] = Double(G)
        depth /= 2
    return out
    
