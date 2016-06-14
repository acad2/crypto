#include "tools.h"

void printb_64(const unsigned long word64)
{
	unsigned long mask = 1;
	unsigned int i;
	
	mask <<= 63;
	for (i = 1; i <= 64; ++i)
	{
		printf("%li", (mask & word64) >> (64 - i));
		mask >>= 1;
	}
}

void printbn_64(const unsigned long word64)
{
	printb_64(word64);
	printf("\n");
}

void printb_32(const unsigned int word32)
{
	unsigned int mask = 1;
	unsigned int i;
	
	mask <<= 31;
	for (i = 1; i <= 32; ++i)
	{
		printf("%i", (mask & word32) >> (32 - i));
		mask >>= 1;
	}
}

void printbn_32(const unsigned int word32)
{
	printb_32(word32);
	printf("\n");
}

void printb_16(const unsigned short word16)
{
	unsigned short mask = 1;
	unsigned short i;
	
	mask <<= 15;
	for (i = 1; i <= 16; ++i)
	{
		printf("%i", (mask & word16) >> (16 - i));
		mask >>= 1;
	}
}

void printbn_16(const unsigned short word16)
{
	printb_16(word16);
	printf("\n");
}

void printb_8(const unsigned char word8)
{
	unsigned char mask = 1;
	unsigned char i;
	
	mask <<= 7;
	for (i = 1; i <= 8; ++i)
	{
		printf("%i", (mask & word8) >> (8 - i));
		mask >>= 1;
	}
}

void printbn_8(const unsigned char word8)
{
	printb_8(word8);
	printf("\n");
}