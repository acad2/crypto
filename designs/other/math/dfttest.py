#copied from http://code.activestate.com/recipes/578994-discrete-fourier-transform/
# Discrete Fourier Transform (DFT)
# FB - 20141227
import random
import math
import cmath
PI2 = pi2 = cmath.pi * 2.0
def DFT(fnList):
    N = len(fnList)
    FmList = []
    for m in range(N):
        Fm = 0.0
        for n in range(N):
            Fm += fnList[n] * cmath.exp(- 1j * pi2 * m * n / N)
        FmList.append(Fm / N)
    return FmList
        
def InverseDFT(FmList):
    N = len(FmList)
    fnList = []
    for n in range(N):
        fn = 0.0
        for m in range(N):
            fn += FmList[m] * cmath.exp(1j * pi2 * m * n / N)
        fnList.append(fn)
    return fnList

# TEST
print "Input Sine Wave Signal:"
N = 360 # degrees (Number of samples)
a = float(random.randint(1, 100))
f = float(random.randint(1, 100))
p = float(random.randint(0, 360))
print "frequency = " + str(f)
print "amplitude = " + str(a)
print "phase ang = " + str(p)
print
def generate_sin_wave(amplitude, frequency, phase_angle, number_of_samples, pi2=PI2):    
    fnList = []
    for n in range(number_of_samples):
        t = float(n) / number_of_samples * pi2
        fn = amplitude * math.sin(frequency * t + phase_angle / 360 * pi2)
        fnList.append(fn)
    return fnList
    
fnList = generate_sin_wave(a, f, p, N)    
fnList[10] += .355
print "DFT Calculation Results:"
FmList = DFT(fnList)

def parse_DFT_output(FmList, threshold=0.001):
    outputs = []
    for (i, Fm) in enumerate(FmList):
        if abs(Fm) > threshold:
            frequency = i
            amplitude = abs(Fm) * 2.0
            phase_angle = int(((cmath.phase(Fm) + pi2 + pi2 / 4.0) % pi2) / pi2 * 360 + 0.5)            
            outputs.append((amplitude, frequency, phase_angle))
    return outputs
    
outputs = parse_DFT_output(FmList)
for amplitude, frequency, phase_angle in outputs:
    print("\nFrequency: {}\nAmplitude: {}\nPhase Angle: {}".format(frequency, amplitude, phase_angle))
    