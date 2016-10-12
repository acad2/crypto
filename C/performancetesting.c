#include <time.h>
#include <stdio.h>

#include "constants.c"

#define test_encrypt_performance_4x32(cipher_encrypt, measurements)\
({	WORDSIZE32 message[4], key[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_encrypt_performance_4x32_384(cipher_encrypt, measurements)\
({	WORDSIZE32 message[4], key[4 * 3];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_encrypt_performance_2x32(cipher_encrypt, measurements)\
({	WORDSIZE32 message[2], key[2];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_encrypt_performance_4x64(cipher_encrypt, measurements)\
({	WORDSIZE64 message[4], key[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_permutation_performance_8x32(permutation, measurements)\
({	WORDSIZE32 message[8];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
        permutation(message);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_permutation_performance_4x32(permutation, measurements)\
({	WORDSIZE32 message[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
        permutation(message);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_permutation_performance_4x32_abcd(permutation, measurements)\
({	WORDSIZE32 a = 0, b = 0, c = 0, d = 0;\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
        permutation(a, b, c, d);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_permutation_performance_4x64(permutation, measurements)\
({	WORDSIZE64 message[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
        permutation(message);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})
