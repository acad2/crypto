#include <stdio.h>

unsigned char *shuffle_bytes(unsigned char *destination, unsigned char *source, int length) {
    int i;
    __m128i mask = _mm_set_epi8(12, 13, 14, 15, 8, 9, 10, 11, 4, 5, 6, 7, 0, 1, 2, 3);
    for (i = 0; i < length; i += 4) {
        _mm_storeu_si128((__m128i *)&destination[i],
        _mm_shuffle_epi8(_mm_loadu_si128((__m128i *)&source[i]), mask));
    }
    return destination;
}

void test_shuffle_bytes()
{
    unsigned char state[16], state2[16];
    int index;
    for (index = 0; index < 16; index ++)
    {
        state[index] = index;
    }
    
    shuffle_bytes(state2, state, 16);
    for (index = 0; index < 16; index++)
    {
        printf("%i: %u\n", index, state2[index]);
    }
}