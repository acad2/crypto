// copied from gimli tar ball

#include <stdio.h>
#include <unistd.h>

#include "simdtest2.c"

long long cpucycles(void)
{
  unsigned long long result;
  asm volatile(".byte 15;.byte 49;shlq $32,%%rdx;orq %%rdx,%%rax"
    : "=a" (result) ::  "%rdx");
  return result;
}

int main()
{
  WORDSIZE x[16];
  int i;
  unsigned long long t[21];

  for (i = 0;i < 16;++i) x[i] = getpid() + i;

  for (i = 0;i < 21;++i) {
    t[i] = cpucycles();
  }

  for (i = 0;i < 21;++i) {
    t[i] = cpucycles();
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
    permutation(x);
  }

  for (i = 0;i < 20;++i) printf("%lld * 0.1\n",t[i + 1] - t[i]);
  return 0;
}
