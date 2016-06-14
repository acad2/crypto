#pragma once
#include <stdio.h>

inline unsigned int rotate_left(const unsigned int word32,const int amount)
{    
    return ((word32 << amount) | (word32 >> (32 - amount)));
}

inline unsigned int rotate_right(const unsigned int word32,const int amount)
{              
    return ((word32 >> amount) | (word32 << (32 - amount)));
}

void printb_64(const unsigned long word64);

void printbn_64(const unsigned long word64);

void printb_32(const unsigned int word32);

void printbn_32(const unsigned int word32);

void printb_16(const unsigned short word16);

void printbn_16(const unsigned short word16);

void printb_8(const unsigned char word8);

void printbn_8(const unsigned char word8);