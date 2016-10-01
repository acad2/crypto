#!/usr/bin/env python
#
# p8: 8 bit Multi-Purpose Hash Function with Pseudo-Random Funtion Algorithm/Source Code
# 
# /*
# Copyright(c) 2016, Karl-Uwe Frank
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
#   1. Redistributions of source code must retain the above copyright
#   notice, this list of conditions and the following disclaimer.
# 
#   2. Redistributions in binary form must reproduce the above copyright
#   notice, this list of conditions and the following disclaimer in the
#   documentation and/or other materials provided with the distribution.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES(INCLUDING, BUT NOT LIMITED
# TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT(INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# #** p8 algorithm designed and developed by Karl-Uwe Frank
# */

# /*
# ------------------------------------------------------------------
#  p8 Test vectors
# ------------------------------------------------------------------
#  Message   : 
#  Hash      : b2c01b7e3885ddef4f06823f8812aac6
# ------------------------------------------------------------------
#  Message   : test
#  Hash      : 61b68858e259fc831dad93d1006164a3
# ------------------------------------------------------------------
#  Message   : A quick brown fox jumps over the lazy dog
#  Hash      : 3c89d45fe2430fde8dfd224c115854f2
# ------------------------------------------------------------------
#  Message   : A quick brown fox jumps over the lazy dog.
#  Hash      : 0f85404487ad0dfd0ebdbf7178586e5c
# ------------------------------------------------------------------
#  Hash Size : 128
#  Seed (Hex): 00f75bce 
#  Key  (Hex): 50617373776f7264
#  Message   : 
#  Hash      : 3d59507bce934c1b7fdede288aecf768
# --------------------------------------------------------------------
#  Hash Size : 128
#  Seed (Hex): 00f75bce 
#  Key  (Hex): 50617373776f7264
#  Message   : test
#  Hash      : ce8cd52605349815fb9d03688625fa7a
# -------------------------------------------------------------------
#
# echo -en "The quick brown fox jumps over the lazy dog" | pypy p8.py
# 3c89d45fe2430fde8dfd224c115854f2
# 
# echo  -en "" | pypy p8.py 128 0x00f75bce 50617373776f7264
# 3d59507bce934c1b7fdede288aecf768
# 
#
# */



import sys, os

#-----------------------------------------
# Simulate missing ANSI-C "printf"
#
def printf(*args):
  sys.stdout.write(*args)
  sys.stdout.flush()

def print_stderr(*args):
  sys.stderr.write(*args)
  sys.stderr.flush()




#-----------------------------------------
# 
# Swap Values 
#
# (primitive Way for some Kind of ANSI-C
#  Compatibility when comparing Listings)
#
def swap(X,Y):
  return Y, X



# -----------------------------------------
# 
#  Global Varaiable Definition
#  
# Secret State Array
SBox = bytearray(256)

# Global Carry on Array Indices
a = int(0)
b = int(0)
c = int(0)
d = int(0)
j = int(0)


#-----------------------------------------
# PIA = Permutation Initialisation Algorithm
#
def SBox8_PIA(seed):
  global SBox, a, b, c, d, j
  
  if (seed == 0):
    a = 14
    b = 59
    c = 23
    d = 77
  else:
    a = ( seed        & 255)
    b = ((seed >>  8) & 255)
    c = ((seed >> 16) & 255)
    d = ((seed >> 24) & 255)

  # Shifting to the next odd Value of each Variable
  # in Order to generate an alternating Permutation
  b |= 1
  c |= 1
  d |= 1

  # Initialise the alternating Permutation
  for i in range(0,256):
    a = (a + (b ^ c) + d) & 255
    SBox[i] = a
    
#-----------------------------------------
# KSA = Key Schedule Algorithm
#
def SBox8_KSA(Key, keyLen):
  global SBox, a, b, c, d, j

  # Shuffle the Key into the Permutation
  for i in range(0,256):
    d = (i % keyLen)
    
    a = (a + SBox[b]) & 255
    b = (b + SBox[a]) & 255
    c = (a + b + i + Key[d]) & 255
    
    SBox[c], SBox[i] = swap(SBox[c], SBox[i])
  
  j=0
  
  
#-----------------------------------------
# PRGA = Pseudo-Random Generation Algorithm
#
def SBox8_PRGA():
  global SBox, a, b, c, d, j

  a = (a + SBox[b]) & 255
  b = (b + SBox[a]) & 255
  c = (a + b + j + SBox[j]) & 255
  
  SBox[c], SBox[j] = swap(SBox[c], SBox[j])

  d = SBox[(SBox[c] + SBox[d]) & 255] & 255
  
  j = (j + 1) & 255

  return ((a + b) ^ (c + d)) & 255


#-----------------------------------------
#
def ShowUsage(ThisName):
  print_stderr ( "\nUsage  : %s file_to_hash [optional: Hash Size(in Bit)  Seed(as 32bit Hex)  Key(in Hex)]\n" % ThisName)
  print_stderr ( "\nExample: %s file_to_hash [optional: 128 78e68cf3 7d0ef66789aca2cfa6c76db7560554]\n" % ThisName)
  print_stderr ( '\n         echo -en "test" | %s [optional: 128 78e68cf3 7d0ef66789aca2cfa6c76db7560554]\n\n' % ThisName)



# -----------------------------------------
# Main 
#
def main():
  global SBox, a, b, c, d, j

  Key     = bytearray(256)
  keyLen  = 0

  seed    = int(0)
  KeyHash = ""
  
  # Minimum Hash Size is 128bit
  hSize = 16
  
  #
  # Check if a Prarmeter is passed through
  PrgName = sys.argv[0]

  if (len(sys.argv) < 1):
    ShowUsage(PrgName)
    sys.exit()
  

  # Define the Hash Size in Byte
  if (len(sys.argv) > 1):
    hSize = int(sys.argv[1])
    hSize = hSize/8  

 
  #-----------------------------------------
  # seed for the permutation initialisation
  #
  if (len(sys.argv) > 2): seed = int(sys.argv[2], 16)

  # Initialisation of SBoxes
  SBox8_PIA(seed)

  # If a Seed is passed, but no Key, use the Seed additionally as Initial Key
  if ((seed > 0) and (len(sys.argv) == 3)):
    # Build the 4 Byte Key[] always Big Endian 04030201
    Key[0] = ((seed >> 24) & 0xff)
    Key[1] = ((seed >> 16) & 0xff)
    Key[2] = ((seed >>  8) & 0xff)
    Key[3] = ( seed        & 0xff)

    # Shuffle the Key into the SBox8 Permutation
    SBox8_KSA(Key, 4)
 
  # If a Seed and a Key is passed
  if ((seed > 0) and (len(sys.argv) == 4)):  
    KeyHash = sys.argv[3]
   

  BLOCKSIZE = 8 # Byte
  inBuffer  = bytearray(BLOCKSIZE)
  
  # Offset for j
  j = 0;

  # Read from STDIN    
  inBuffer = sys.stdin.read(BLOCKSIZE) # read Byte  
  while len(inBuffer) > 0:

    # Hash the Content
    for i in range(len(inBuffer)):
    
      # Inject the Data into the Internal State
      a = (a + b + ord(inBuffer[i])) & 255
          
      # Collect the Key Byte
      Key[j] = Key[j] ^ SBox[a]
      
      # Update the Internal State
      SBox8_PRGA()
     
    inBuffer = sys.stdin.read(BLOCKSIZE) # read Byte

  # First Drop of the complete Internal State
  for i in range(0,256): SBox8_PRGA()
  
  # Update the Key
  for i in range(0,256): Key[i] = Key[i] ^ SBox8_PRGA()

  # Shuffle the Key into the SBox8 Permutation
  SBox8_KSA(Key, 256)

  # If an additional Key was passed through
  if (len(KeyHash) > 0):
    keyLen  = len(KeyHash) /2
    for i in range(keyLen):
      Key[i] = int(KeyHash[i*2:(i*2)+2], 16)

    # Second Drop of the complete Internal State
    for i in range(0,256): SBox8_PRGA()

    # Shuffle the additonal Key into the SBox8 Permutation
    SBox8_KSA(Key, keyLen)

  # Final Drop of Parts of the Internal State
  # eight times the Byte Size of the final Hash
  # in order to mix up Elements once again.
  # Also usefull for the Avalance Effect
  for i in range(hSize*8): SBox8_PRGA()

  # Final Hash Output
  for i in range(hSize): print_stderr ('%02x' % SBox8_PRGA())
  print_stderr ('\n')

  sys.stdout.flush()


# Begin cryptanalysis of PIA
def calculate_possible_b_values():
    return [b | 1 for b in range(256)]  
    
def calculate_possible_c_values():
    return [c | 1 for c in range(256)]    
    
def calculate_possible_d_values():
    return [d | 1 for d in range(256)]  
        
def calculate_possible_b_xor_c_values(b_values, c_values):
    b_xor_c = []
    for value in b_values:
        for value2 in c_values:
            b_xor_c.append(value ^ value2)
    return b_xor_c
    
def calculate_possible_bc_plus_d_values(b_xor_c, d_values):
    b_xor_c_plus_d = []
    for value in b_xor_c:
        for value2 in d_values:
            b_xor_c_plus_d.append((value + value2) & 255)
    return b_xor_c_plus_d
       
def generate_possible_initial_sboxes(b_xor_c_plus_d):   
    first_a = set()
    for a in range(256):        
        for constant in b_xor_c_plus_d:
            first_a.add((a + constant) & 255)
        
    return first_a   
    
b_values = calculate_possible_b_values()   
c_values = calculate_possible_c_values()
d_values = calculate_possible_d_values()
b_xor_c = calculate_possible_b_xor_c_values(b_values, c_values)
b_xor_c_plus_d = calculate_possible_bc_plus_d_values(b_xor_c, d_values)
first_sbox_inputs = generate_possible_initial_sboxes(set(b_xor_c_plus_d))

print "Set sizes for possible values for b, c, and d: ", len(set(b_values)), len(set(c_values)), len(set(d_values))
print "Symbol space used by b, c, and d: (out of 256) ", len(set(b_values).union(c_values).union(d_values))
print "(b ^ c) + d values: ", set(b_xor_c_plus_d) 
print "Sbox count: ", len(first_sbox_inputs)
# End cryptanalysis of PIA

if __name__ == "__main__":
  main()
  sys.exit()
