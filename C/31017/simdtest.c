#include <stdio.h>
#include <emmintrin.h>
typedef int v4si __attribute__ ((mode(V4SI)));

union f4vector{
  v4si v;
  unsigned long f[4];};
  
int main()
{
  union f4vector a, b, c, d;

  a.f[0] = 1; a.f[1] = 2; a.f[2] = 3; a.f[3] = 4;
  b.f[0] = 5; b.f[1] = 6; b.f[2] = 7; b.f[3] = 8;
  c.f[0] = 0; c.f[1] = 0; c.f[2] = 0; c.f[3] = 0;
  d.f[0] = 0; d.f[1] = 0; d.f[2] = 0; d.f[3] = 0;
    
  a.v = a.v + b.v;     
  c.v = c.v + d.v;
  b.v = b.v ^ c.v;
  d.v = d.v ^ a.v;
  
  a.v = (__m128i)_mm_shuffle_epi32((__m128i)a.v, _MM_SHUFFLE(0,3,2,1));
  
  
  printf("%lu, %lu, %lu, %lu\n", a.f[0], a.f[1], a.f[2], a.f[3]);
  printf("%lu, %lu, %lu, %lu\n", b.f[0], b.f[1], b.f[2], b.f[3]);
  printf("%lu, %lu, %lu, %lu\n", c.f[0], c.f[1], c.f[2], c.f[3]);
  printf("%lu, %lu, %lu, %lu\n", d.f[0], d.f[1], d.f[2], d.f[3]);
  return 0;
}  