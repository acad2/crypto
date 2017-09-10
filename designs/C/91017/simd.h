#include <stdint.h>
#include <x86intrin.h>

#define REGISTER __m128i
#define load_register(name, state_array, offset) name = _mm_loadu_si128((void *) (state_array + offset))
#define store_register(name, state_array, offset) _mm_storeu_si128((void *) (state_array + offset), name)  
#define store_state(state, a, b, c, d)\
    store_register(a, state, 0); store_register(b, state, 4);\
    store_register(c, state, 8); store_register(d, state, 12);
#define load_state(state, a, b, c, d)\
    load_register(a, state, 0); load_register(b, state, 4);\
    load_register(c, state, 8); load_register(d, state, 12);
    
#define rotate8(word, shuf_mask) word = _mm_shuffle_epi8(word, shuf_mask);
#define ROT_DOWN 11, 6, 1, 12, 7, 2, 13, 8, 3, 14, 9, 4, 15, 10, 5, 0              
#define ROL_8 12, 15, 14, 13, 8, 11, 10, 9, 4, 7, 6, 5, 0, 3, 2, 1              
#define ROL_16 13, 12, 15, 14, 9, 8, 11, 10, 5, 4, 7, 6, 1, 0, 3, 2
#define ROL_24 14, 13, 12, 15, 10, 9, 8, 11, 6, 5, 4, 7, 2, 1, 0, 3        
#define ROT_UP 3, 6, 9, 12, 15, 2, 5, 8, 11, 14, 1, 4, 7, 10, 13, 0
#define ROR_8 ROL_24
#define ROR_16 ROL_16
#define ROR_24 ROL_8 
