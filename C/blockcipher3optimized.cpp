#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <stdint.h>

#include <time.h>
#include "Stopwatch.hpp"


#define ROTATION_AMOUNT 41
#define BIT_WIDTH 64
#define DATA_SIZE 16
typedef unsigned long long WORD_TYPE;

//#define ROTATION_AMOUNT 5
//#define BIT_WIDTH 8
//#define DATA_SIZE 16
//typedef unsigned char WORD_TYPE;

#define WORD_SIZE sizeof(WORD_TYPE)

#ifndef memcpy_s
#define memcpy_s memcpy
#endif

void print_data(WORD_TYPE* data) {
	int index;
	printf("\n");
	for (index = 0; index < DATA_SIZE; index++) {
		printf("%i: %llu\n", index, data[index]);
	}
}

template <int amount> WORD_TYPE rotate_left(WORD_TYPE word8) {
	return ((word8 << amount) | (word8 >> (8*WORD_SIZE - amount)));
}

template <int amount> WORD_TYPE rotate_right(WORD_TYPE word8) {
	return ((word8 >> amount) | (word8 << (8*WORD_SIZE - amount)));
}

template <int left_index, int right_index> WORD_TYPE round_function(WORD_TYPE* state, WORD_TYPE key) {
	WORD_TYPE left, right;
	left = state[left_index];
	right = state[right_index];

	key ^= right;
	right = rotate_left<ROTATION_AMOUNT>(right + key + left_index);
	key ^= right;

	key ^= left;
	left += right >> (BIT_WIDTH / 2);
	left ^= rotate_left<(left_index % BIT_WIDTH) ^ ROTATION_AMOUNT>(right);
	key ^= left;

	state[left_index] = left;
	state[right_index] = right;
	return key;
}

template <int left_index, int right_index> WORD_TYPE invert_round_function(WORD_TYPE* state, WORD_TYPE key) {
	WORD_TYPE left, right;
	left = state[left_index];
	right = state[right_index];

	key ^= left;
	left ^= rotate_left<(left_index % BIT_WIDTH) ^ ROTATION_AMOUNT>(right);
	left -= right >> (BIT_WIDTH / 2);
	key ^= left;

	key ^= right;
	right = rotate_right<ROTATION_AMOUNT>(right) - (key + left_index);
	key ^= right;

	state[left_index] = left;
	state[right_index] = right;
	return key;
}

void shuffle_bytes(WORD_TYPE* _state) {        
    WORD_TYPE temp = _state[0];
    
    _state[0] = _state[11];
    _state[11] = _state[8];
    _state[8] = _state[13];
    _state[13] = _state[10];
    _state[10] = _state[14];
    _state[14] = _state[2];
    _state[2] = _state[4];
    _state[4] = _state[12];
    _state[12] = _state[1];
    _state[1] = _state[5];
    _state[5] = _state[6];
    _state[6] = _state[9];
    _state[9] = _state[3];
    _state[3] = _state[15];
    _state[15] = _state[7];
    _state[7] = temp;
}

int prp(WORD_TYPE* data, WORD_TYPE key) {
	shuffle_bytes(data);
	key = round_function<14, 15>(data, key);
	key = round_function<13, 14>(data, key);
	key = round_function<12, 13>(data, key);
	key = round_function<11, 12>(data, key);
	key = round_function<10, 11>(data, key);
	key = round_function<9, 10>(data, key);
	key = round_function<8, 9>(data, key);
	key = round_function<7, 8>(data, key);
	key = round_function<6, 7>(data, key);
	key = round_function<5, 6>(data, key);
	key = round_function<4, 5>(data, key);
	key = round_function<3, 4>(data, key);
	key = round_function<2, 3>(data, key);
	key = round_function<1, 2>(data, key);
	key = round_function<0, 1>(data, key);
	key = round_function<15, 0>(data, key);
	return key;
}

void prf(WORD_TYPE* data, WORD_TYPE key) {
	shuffle_bytes(data);

	key ^= data[15];
	key = round_function<14, 15>(data, key);
	key ^= data[14];
	key = round_function<13, 14>(data, key);
	key ^= data[13];
	key = round_function<12, 13>(data, key);
	key ^= data[12];
	key = round_function<11, 12>(data, key);
	key ^= data[11];
	key = round_function<10, 11>(data, key);
	key ^= data[10];
	key = round_function<9, 10>(data, key);
	key ^= data[9];
	key = round_function<8, 9>(data, key);
	key ^= data[8];
	key = round_function<7, 8>(data, key);
	key ^= data[7];
	key = round_function<6, 7>(data, key);
	key ^= data[6];
	key = round_function<5, 6>(data, key);
	key ^= data[5];
	key = round_function<4, 5>(data, key);
	key ^= data[4];
	key = round_function<3, 4>(data, key);
	key ^= data[3];
	key = round_function<2, 3>(data, key);
	key ^= data[2];
	key = round_function<1, 2>(data, key);
	key ^= data[1];
	key = round_function<0, 1>(data, key);
    key ^= data[0];
	key = round_function<15, 0>(data, key);
}

WORD_TYPE xor_with_key(WORD_TYPE* data, WORD_TYPE* key) {
	WORD_TYPE data_xor = 0;
	//printf("Xor with key\n");
	//print_data(key);
	for (int index = DATA_SIZE; index--;) {
		data[index] ^= key[index];
		data_xor ^= data[index];
	}
	return data_xor;
}

void key_schedule(WORD_TYPE* round_keys, WORD_TYPE* _key, int rounds) {
	int index;
	WORD_TYPE key_byte, key_xor = 0;
	WORD_TYPE key[DATA_SIZE], round_key[DATA_SIZE];

	for (index = 0; index < DATA_SIZE; index++) { // create working copy of the key
		key_byte = _key[index];
		key[index] = key_byte;
		key_xor ^= key_byte;
	}

	for (index = 0; index < rounds + 1; index++) { // key schedule
		key_xor = prp(key, key_xor);
		memcpy_s(round_key, key, DATA_SIZE);

		prf(round_key, key_xor);
		memcpy_s(round_keys + (index * DATA_SIZE), round_key, DATA_SIZE);
	}
}

void encrypt(WORD_TYPE* data, WORD_TYPE* key, int rounds) {
	WORD_TYPE round_keys[DATA_SIZE * (rounds + 1)];
	WORD_TYPE round_key[DATA_SIZE], data_xor = 0;
	int index;

	key_schedule(round_keys, key, rounds);

	for (index = 0; index < rounds; index++) { // iterated even-mansour construction
		memcpy_s(round_key, round_keys + (index * DATA_SIZE), DATA_SIZE * WORD_SIZE);
		data_xor = xor_with_key(data, round_key);
		prp(data, data_xor);
	}
	memcpy_s(round_key, round_keys + (rounds * DATA_SIZE), DATA_SIZE * WORD_SIZE);
	xor_with_key(data, round_key);

}

void encrypt_cached_keyschedule(WORD_TYPE* data, WORD_TYPE* round_keys, int rounds) {
	for (int index = 0; index < rounds; index++) { // iterated even-mansour construction
		WORD_TYPE* round_key = round_keys + (index * DATA_SIZE);
		WORD_TYPE sum = xor_with_key(data, round_key);
		prp(data, sum);
	}
	xor_with_key(data, round_keys + (rounds * DATA_SIZE));
}


void invert_shuffle_bytes(WORD_TYPE* state) {
	WORD_TYPE temp[DATA_SIZE];

	temp[11] = state[0];
	temp[5]  = state[1];
	temp[4]  = state[2];
	temp[15] = state[3];
	temp[12] = state[4];
	temp[6]  = state[5];
	temp[9]  = state[6];
	temp[0]  = state[7];
	temp[13] = state[8];
	temp[3]  = state[9];
	temp[14] = state[10];
	temp[8]  = state[11];
	temp[1]  = state[12];
	temp[10] = state[13];
	temp[2]  = state[14];
	temp[7]  = state[15];

	memcpy_s(state, temp, DATA_SIZE * WORD_SIZE);
}

WORD_TYPE invert_prp(WORD_TYPE* data, WORD_TYPE key) {
	key = invert_round_function<15, 0>(data, key);
	key = invert_round_function<0, 1>(data, key);
	key = invert_round_function<1, 2>(data, key);
	key = invert_round_function<2, 3>(data, key);
	key = invert_round_function<3, 4>(data, key);
	key = invert_round_function<4, 5>(data, key);
	key = invert_round_function<5, 6>(data, key);
	key = invert_round_function<6, 7>(data, key);
	key = invert_round_function<7, 8>(data, key);
	key = invert_round_function<8, 9>(data, key);
	key = invert_round_function<9, 10>(data, key);
	key = invert_round_function<10, 11>(data, key);
	key = invert_round_function<11, 12>(data, key);
	key = invert_round_function<12, 13>(data, key);
	key = invert_round_function<13, 14>(data, key);
	key = invert_round_function<14, 15>(data, key);
	invert_shuffle_bytes(data);
	return key;
}

void decrypt(WORD_TYPE* data, WORD_TYPE* key, int rounds) {
	WORD_TYPE round_key[DATA_SIZE];
	WORD_TYPE round_keys[DATA_SIZE * (rounds + 1)];
	WORD_TYPE data_xor = 0;
	int index;

	key_schedule(round_keys, key, rounds);

	memcpy_s(round_key, round_keys + (rounds * DATA_SIZE), DATA_SIZE * WORD_SIZE);
	data_xor = xor_with_key(data, round_key);

	for (index = rounds; index--;) {
		invert_prp(data, data_xor);

		memcpy_s(round_key, round_keys + (index * DATA_SIZE), DATA_SIZE * WORD_SIZE);
		data_xor = xor_with_key(data, round_key);
	}
}

void test_encrypt_decrypt() {
	WORD_TYPE data[DATA_SIZE], key[DATA_SIZE];
	int rounds = 2;

	memset(data, 0, sizeof(data));
	data[15] = 1;

	printf("Encrypting...\n");
	encrypt(data, key, rounds);

	printf("Data:\n %s\n", data);
	print_data(data);

	decrypt(data, key, rounds);
	print_data(data);

	WORD_TYPE round_keys[(rounds + 1) * DATA_SIZE];
	key_schedule(round_keys, key, rounds);

	encrypt_cached_keyschedule(data, round_keys, rounds);
	printf("Data: %s\n", data);
	print_data(data);

}


void test_encrypt_performance() {
	const int rounds = 8, blocks = 65536, measurements = 10;
	int index, index2;
	WORD_TYPE key[DATA_SIZE], round_keys[(rounds + 1) * DATA_SIZE];

	WORD_TYPE* data = (WORD_TYPE*)malloc(DATA_SIZE * blocks * WORD_SIZE);
	WORD_TYPE* plaintext = (WORD_TYPE*)malloc(DATA_SIZE * blocks * WORD_SIZE);

	// setup test data
	memset(data, 16, DATA_SIZE * blocks * WORD_SIZE);
	memcpy(plaintext, data, DATA_SIZE * blocks * WORD_SIZE);
	memset(key, 1, sizeof(key));

	key_schedule(round_keys, key, rounds);

	Stopwatch s;
    
	for (index2 = 0; index2 < measurements; index2++) {
		for (index = 0; index < blocks; index++) {
			encrypt_cached_keyschedule(data + (index * DATA_SIZE), round_keys, rounds);
		}        
	}
    
    double timee = s.Lap();
    
    long long mega_bytes_of_data = (measurements * blocks * DATA_SIZE * WORD_SIZE) / (1024.0 * 1024.0);
    printf("%.2f MB/s\n", (mega_bytes_of_data / timee));
    //double bps = 100.0 * (blocks * DATA_SIZE * WORD_SIZE) / timee;
	//printf("%.2f MB/s\n", bps / 1024.0 / 1024.0);
}

void test_input_output()
{    
    WORD_TYPE data[16];
    int rounds = 1;
    int index;    
    for (index = 0; index < 16; index++)
    {        
        data[index] = 0;
    }    
    print_data(data);
    prp(data, 0);
    print_data(data);
    
    FILE *f = fopen("sampleoutput.txt", "w");
    if (f == NULL)
    {
        exit(1);
    }
    
    for (index = 0; index < 16; index++)
    {
        fprintf(f, "%llu\n", data[index]);
    }
    fclose(f);
} 
    
    
    
    
int main() {
	 test_encrypt_decrypt();
	//test_encrypt_performance();
    //test_input_output();
	return 0;
}