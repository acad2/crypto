#!/usr/bin/env python

# copied from http://cis.sjtu.edu.cn/index.php/A_Simple_Python_Script_for_Translating_Sbox_to_ANF_Boolean_Functions 

"""
Translate sbox to ANF Boolean functions.
The size of the input sbox should be $2^n$.
"""

import sys
import math


__author__ = 'Bo Zhu, http://cis.sjtu.edu.cn/index.php/Bo_Zhu'
__copyright__ = 'Copyright 2009, Shanghai Jiao Tong University'
__license__ = 'GPL, http://www.gnu.org/licenses/gpl.txt'


class InputError(Exception):
    "Raise this exception when the size of sbox is not $2^n$."
    def __str__(self):
        return repr('Invalid size of sbox!')


def components(x):
    """
    A little tricky here.
    Find out which entries of the sbox should be considered.
    Return a list containing the indices of such entries.
    """
    return [i for i in range(x + 1) if x & i == i]


def sbox2anf(sbox):
    """
    The core function of Sbox2ANF module.
    Calculate every coefficient of the ANF Boolean functions.
    Return a nested list containing the computed coefficients.
    """
    num = len(sbox)
    dim = int(math.log(num, 2))
    if 2 ** dim != num:
        raise InputError

    ls = []
    for d in range(dim):
        dc = []
        for n in range(num):
            sign = 0
            for i in components(n):
                sign = sign ^ ((sbox[i] >> d) & 0x1)
            dc.append(sign)
        ls.append(dc)
    return ls


def print_anf(sbox):
    "Print out the ANF equations."
    anf = sbox2anf(sbox)
    for i in range(len(anf)):
        sys.stdout.write('y%u = ' % i)

        first_time = True
        ls = anf[i]
        for j in range(len(ls)):
            if ls[j] == 1:
                if first_time:
                    first_time = False
                else:
                    sys.stdout.write(' + ')

                if j == 0:
                    sys.stdout.write('1')
                else:
                    mask = 0x1
                    while mask <= j:
                        if mask & j > 0 :
                            sys.stdout.write('x%u' % int(math.log(mask, 2)))
                        mask = mask << 1
        if first_time: # if still be True
            sys.stdout.write('0')
        sys.stdout.write('\n')

def count_terms(sbox):
    import StringIO
    backup = sys.stdout
    sys.stdout = logger = StringIO.StringIO()
    print_anf(sbox)
    sys.stdout = backup
    logger.seek(0)
    
    with open("anfdump.txt", 'w') as _file:
        for line in logger.readlines():
            line = line.replace('+', '')
            line = line.replace('=', '')
            print line.split()[1:]
            _file.write(line[2:])
    
if __name__ == '__main__':
    print 'The sample sbox'
    sample_sbox = (0x0, 0x2, 0x4, 0x6, 0x7, 0xA, 0xC, 0xE,
                   0x1, 0x3, 0x5, 0x7, 0x9, 0xB, 0xD, 0xF)
    print 'y = sbox(x) =', sample_sbox
    print 'has been translated to ANF Boolean functions'
    with open("anfdump.txt", 'w') as _file:
        sys.stdout = _file
        print_anf(sample_sbox)
        sys.stdout = sys.__stdout__
    #print_anf(sample_sbox)
    #
    #count_terms(sample_sbox)
    