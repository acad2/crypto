#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# LICENCE MIT
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to
# do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
# IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

def lxor(a, b):
    if a == '0' and b == '0': return '0'
    if a == '1' and b == '0': return '1'
    if a == '0' and b == '1': return '1'
    if a == '1' and b == '1': return '0'
    return '?'

def bit_to_num(a):
    if a == '0': return 0
    if a == '1': return 1
    if a == '?': raise ValueError('Error: Converting unknown value to number')

def gen_bit(a):
    if a == 1: return '1'
    return '0'


def init():
    return ['?' for x in range(30)]

def getbit(state, index):
    return state[index]

def setbit(state, index, value):
    state[index] = value

def print_state(state):
    print(''.join(state))



def multiplexer(state):
    getindex = bit_to_num(state[28])
    getindex += 2 * bit_to_num(state[25])
    getindex += 4 * bit_to_num(state[22])
    getindex += 8 * bit_to_num(state[19])
    return getindex + 1

def iterate(state):
    bit = state.pop()
    # x^30 + x^17 + x^16 + x^13 + x^11 + x^7 + x^5 + x^3 + x^2 + x + 1
    indexes = [1, 2, 3, 5, 7, 11, 13, 16, 17]
    for i in indexes:
        b = getbit(state, i)
        setbit(state, i, lxor(bit, b))
    state.insert(0, bit)
    return state

def roundf(state):
    iterate(state)
    index_to_return = multiplexer(state)
    return getbit(state, index_to_return)


# def gen():
#     # lfsr_state = init()
#     lfsr_state = ['0','0','1','1','1','0','1','0','0','1','0','0','0','0','1','0','0','1','0','0','0','0','0','1','0','0','0','0','1','1']
#     print_state(lfsr_state)

#     output=[]
#     for x in range(60):
#         b = roundf(lfsr_state)
#         output.append(b)
#     print(output)
#     print_state(output)

#     expected = []
#     for x in range(21):
#         b = roundf(lfsr_state)
#         expected.append(b)

#     print_state(expected)

# gen()

# expected_output = ['1', '0', '0', '0', '1', '0', '0', '0', '1', '0']
# expected_values = ['0', '0', '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', '1', '1', '1', '1', '0', '0', '1', '0', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '1']
def compatible(state, expected, index):
    # we have gone through all the expected values !
    # print_state(state)
    if index >= len(expected):
        output = []
        fetch = multiplexer(state)
        fetch_bit = getbit(state, fetch)
        output.append(fetch_bit)
        for x in range(20):
            b = roundf(state)
            output.append(b)
        print("##############################################")
        print("found !")
        print_state(output)
        print("##############################################")
        return 1

    # we have not gone through all the expected values
    else:
        # is the  19th value set ?
        b = getbit(state, 19)
        if b != '?':  # yes
            # does the value expected value correspond ?
            fetch = multiplexer(state)
            fetch_bit = getbit(state, fetch)
            index1 = index + 1
            # print("[", index, "] = ", expected[index])
            if fetch_bit == '?':  # bit is not set !
                setbit(state, fetch, expected[index])
                iterated = iterate(state)
                return compatible(iterated, expected, index1)

            elif fetch_bit == expected[index]:  # yes
                # try next value
                iterated = iterate(state)
                return compatible(iterated, expected, index1)


            else:  # no
                # print("contradiction", "(",index,")")
                return 0  # fail => back track!

        else:  # no
            # try with 0
            state_0 = list(state)
            setbit(state_0, 19, '0')
            # print(index, " try 0")
            if compatible(state_0, expected, index) == 1:
                return 1
            state_1 = list(state)
            setbit(state_1, 19, '1')
            # print(index, " try 1")
            if compatible(state_1, expected, index) == 1:
                return 1
            else:  # try with 0
                # print ("backtrack (",index,")")
                # print_state(state)
                return 0


def init_search_state(index_search):
    search_state = init()
    for i in range(10):
        setbit(search_state, (29 - i), gen_bit((index_search >> i) & 1))
    return search_state


def search():
    expected_values = ['0', '0', '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '1', '0', '0',
                       '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', '1', '1', '1', '1', '0', '0', '1', '0', '1',
                       '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1',
                       '0', '1', '1']
    for i in range(1024):
        search_state_init = init_search_state(i)
        print_state(search_state_init)
        if compatible(search_state_init, expected_values, 0) == 1:
            return


# # def search():
# #     expected_values = ['0', '0', '1', '1', '1', '0', '0', '1', '1', '0', '0', '0', '1', '0', '1', '0', '1', '0', '0', '1', '0', '0', '0', '1', '0', '0', '0', '1', '0', '1', '1', '1', '1', '0', '0', '1', '0', '1', '0', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '1', '1', '0', '1', '1']
# #     for i in range(2**30):
# #         if i % 100000 == 0 : print(i)
# #         search_state_init = init_search_state(i)
# #         if compatible(search_state_init,expected_values,0) == 1:
# #             return

search()
