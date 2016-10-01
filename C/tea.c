#include <stdint.h>
#include <stdio.h>

#include "performancetesting.c"

void encrypt (unsigned long* v, unsigned long* k) {
    unsigned long v0=v[0], v1=v[1], sum=0, i;           /* set up */
    unsigned long delta=0x9e3779b9;                     /* a key schedule constant */
    unsigned long k0=k[0], k1=k[1], k2=k[2], k3=k[3];   /* cache key */
    for (i=0; i < 32; i++) {                       /* basic cycle start */
        sum += delta;
        v0 += ((v1<<4) + k0) ^ (v1 + sum) ^ ((v1>>5) + k1);
        v1 += ((v0<<4) + k2) ^ (v0 + sum) ^ ((v0>>5) + k3);
    }                                              /* end cycle */
    v[0]=v0; v[1]=v1;
}

int main()
{
    test_encrypt_performance_2x32(encrypt, 5000000 * 2);
    return 0;
}