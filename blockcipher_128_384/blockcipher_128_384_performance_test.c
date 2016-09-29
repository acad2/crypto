#include "blockcipher_128_384.c"
     
#include <time.h>     
#include <stdio.h>
#define test_encrypt_performance_4x32(cipher_encrypt, measurements)\
({	WORDSIZE message[4], key[4];\
    unsigned long index;\
    clock_t begin = clock();\
    for (index = 0; index < measurements; index++){\
	    cipher_encrypt(message, key);}\
    clock_t end = clock();\
    double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;\
    printf("Time required: %.2fs\n", time_spent);\
})
     
int main()
{
    WORDSIZE data[4], key[4 * 3];
    key[0] = 1;
    encrypt(data, key);
    test_encrypt_performance_4x32(encrypt, 5000000);
    return 0;
}
