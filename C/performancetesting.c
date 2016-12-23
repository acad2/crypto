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

#define test_encrypt_performance_4x32_128(cipher_encrypt, measurements)\
({	WORDSIZE32 message[4], key[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_encrypt_performance_4x32_128_output(cipher_encrypt, measurements)\
({	WORDSIZE32 message[4], key[4], output[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key, output);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_encrypt_performance_4x32_256(cipher_encrypt, measurements)\
({	WORDSIZE32 message[4], key[8];\
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

#define test_permutation_performance_16x32(permutation, measurements)\
({	WORDSIZE32 message[16];\
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

#define test_encrypt_performance_1x8_128_output(cipher_encrypt, measurements)\
({	WORDSIZE32 key[4], output[4];\
    unsigned char message = 0;\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key, output);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})

#define test_public_key_encrypt_performance(cipher_encrypt, measurements)\
({	WORDSIZE8 message[16];\
    WORDSIZE32 output[4 * 16], public_key[4 * 256];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, 16, output, public_key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("%lu", output[0]);\
    printf("Time required: %.2fs\n", time_spent);})
    
#define test_public_key_encrypt_performance_8bit(cipher_encrypt, measurements)\
({	WORDSIZE8 message[16], output[16 * 16], public_key[16 * 256];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, 16, output, public_key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("%c", output[0]);\
    printf("Time required: %.2fs\n", time_spent);})    
