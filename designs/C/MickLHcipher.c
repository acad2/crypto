#include <time.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <xmmintrin.h>
#include <math.h>

#ifndef memcpy_s
#define memcpy_s memcpy
#endif

//typedef unsigned long long WORD;
//#define ROTATION 33
//#define PRINT_FMT "%016llX"

typedef unsigned int WORD;
#define ROTATION 5
#define PRINT_FMT "%08X"

//typedef unsigned char WORD;
//#define ROTATION 5
//#define PRINT_FMT "%02X"

#define ROUNDS 2
#define DATA_SIZE 16
#define KEY_SIZE 2

int blockTotalMB = 128, tests = 8;

void print_data(WORD* data) {
	int index;
	for (index = 0; index < DATA_SIZE; index++) {
		if (index * sizeof(WORD) == 64) printf("\n");
		printf(PRINT_FMT, data[index]);
	}
	printf("\n");
}

WORD rotate_left(WORD word8) {
	return word8 << ROTATION | word8 >> (8*sizeof(WORD) - ROTATION);
}

WORD rotate_right(WORD word8) {
	return word8 >> ROTATION | word8 << (8*sizeof(WORD) - ROTATION);
}

WORD prp(WORD* data, WORD key) {
	for (int index = 0; index < DATA_SIZE; index++) {
		WORD tmp = data[index];
		key ^= tmp;
		tmp = rotate_left(tmp + key + index);
		key ^= tmp;
		data[index] = tmp;
	}
	return key;
}

WORD invert_prp(WORD* data, WORD key) {
	for (WORD index = DATA_SIZE; index--;) {
		WORD tmp = data[index];
		key ^= tmp;
		tmp = rotate_right(tmp) - key - index;
		key ^= tmp;
		data[index] = tmp;
	}
	return key;
}

WORD prf(WORD* data, WORD key) {
	WORD index, byte;
	for (index = 0; index < KEY_SIZE; index++) {
		byte = rotate_left(data[index] + key + index);
		key ^= byte;
		data[index] = byte;
	}
}

WORD xor_with_key(WORD* data, WORD* key) {
	WORD data_xor = 0;
	for (WORD index = 0; index < DATA_SIZE; index++) {
		WORD tmp = data[index] ^ key[index % KEY_SIZE];
		data_xor ^= tmp;
		data[index] = tmp;
	}
	return data_xor;
}

void encrypt(WORD* data, WORD* round_key) {
	for (WORD index = 0; index < ROUNDS; index++) {
		WORD data_xor = xor_with_key(data, round_key); // pre-whitening
		prp(data, data_xor); // high diffusion prp
		xor_with_key(data, round_key); // post-whitening
		round_key += KEY_SIZE;
	}
}

void decrypt(WORD* data, WORD* round_key) {
	round_key += KEY_SIZE * ROUNDS;
	for (int index = ROUNDS; index--;) {
		round_key -= KEY_SIZE;
		WORD data_xor = xor_with_key(data, round_key);
		invert_prp(data, data_xor);
		xor_with_key(data, round_key);
	}
}

WORD prp_key(WORD* data, WORD key) {
	for (int index = 0; index < KEY_SIZE; index++) {
		WORD tmp = data[index];
		key ^= tmp;
		tmp = rotate_left(tmp + key + index);
		key ^= tmp;
		data[index] = tmp;
	}
	return key;
}

void keygen(WORD* round_keys, WORD* _key) {
	WORD key[KEY_SIZE];
	WORD key_xor = 0;
	for (int index = 0; index < KEY_SIZE; index++) {
		WORD tmp = _key[index];
		key_xor ^= tmp;
		key[index] = tmp;
	}
	for (int index = 0; index < ROUNDS; index++) {
		key_xor = prp_key(key, key_xor);
		memcpy(round_keys, key, sizeof(key));
		prf(round_keys, key_xor);
		round_keys += KEY_SIZE;
	}
}

//void test_encrypt_decrypt() {
//	struct timespec clockRes, startTime, endTime;
//	clock_getres(CLOCK_MONOTONIC, &clockRes);
//	double clockScale = clockRes.tv_nsec / 1000000000.0;
//	unsigned long deltaTime;
//	double encRateAvg = 0, decRateAvg = 0;
//	int index;
//	int blocks = blockTotalMB * 1024 * 1024 / DATA_SIZE / sizeof(WORD);
//	WORD key[KEY_SIZE];
//	WORD round_keys[KEY_SIZE * ROUNDS];
//	WORD* data = (WORD*)malloc(DATA_SIZE * blocks * sizeof(WORD));
//	WORD* plaintext = (WORD*)malloc(DATA_SIZE * blocks * sizeof(WORD));
//
//	// setup test data
//	memset(data, 16, DATA_SIZE * blocks * sizeof(WORD));
//	memcpy(plaintext, data, sizeof(data));
//	memset(key, 1, sizeof(key));
//	
//	keygen(round_keys, key);
//
//	for(int t=0;t<tests;t++) {
//		if (!t) printf("Encryption: ");
//		else {
//			printf("\rTest: %d / %d...", t, tests);
//			fflush(stdout);
//		}
//		clock_gettime(CLOCK_MONOTONIC, &startTime);
//		for(index=0;index<blocks;index++) {
//			encrypt(data + (index << 4), round_keys);
//		}
//		clock_gettime(CLOCK_MONOTONIC, &endTime);
//		deltaTime = (endTime.tv_sec - startTime.tv_sec) * 1000000000;
//		deltaTime += endTime.tv_nsec - startTime.tv_nsec;
//		double encRate = ((double)blockTotalMB) / (clockScale * deltaTime);
//		encRateAvg += encRate;
//		if (!t) printf("(~%5.2fMB/s)\n", encRate);
//		if (!t) print_data(data);
//
//
//		if (!t) printf("Decryption: ");
//		clock_gettime(CLOCK_MONOTONIC, &startTime);
//		for(index=0;index<blocks;index++) {
//			decrypt(data + (index << 4), round_keys);
//		}
//		clock_gettime(CLOCK_MONOTONIC, &endTime);
//		
//		deltaTime = (endTime.tv_sec - startTime.tv_sec) * 1000000000;
//		deltaTime += endTime.tv_nsec - startTime.tv_nsec;
//		double decRate = ((double)blockTotalMB) / (clockScale * deltaTime);
//		decRateAvg += decRate;
//		if (!t) printf("(~%5.2fMB/s)\n", decRate);
//		if (!t) print_data(data);
//
//		if (!t) printf("Check: %d\n", memcmp(data, plaintext, sizeof(data)) == 0);
//	}
//	printf("\n");
//	encRateAvg /= (double)tests;
//	decRateAvg /= (double)tests;
//
//	printf("Avg Throughput: %5.2fMB/s (Encrypt), %5.2fMB/s (Decrypt)\n", encRateAvg, decRateAvg);
//
//	double cpuRate = 3.3 * 1000.0 * 1000.0 * 1000.0 / 1024.0 / 1024.0;
//	printf("Avg Latency   : %5.1f clock/byte (Encrypt), %5.1f clock/byte (Decrypt)\n", 
//		cpuRate / encRateAvg, cpuRate / decRateAvg);
//}

void funstufflol() {
	WORD block[DATA_SIZE];
	size_t hist[DATA_SIZE*sizeof(WORD)];
	memset(hist, 0, sizeof(hist));
	
	int nt = 100000100;
	for(int i=0;i<nt;i++) {
		memset(block, 0, sizeof(block));
		prp(block, i);
		//print_data(block);
		for(int j=0;j<DATA_SIZE*sizeof(WORD);j++) {
			hist[j] += ((unsigned char*)block)[j];
		}
	}
	for(int j=0;j<DATA_SIZE*sizeof(WORD);j++) {
		hist[j] /= nt;
		printf("hist[%03d] = %lu\n", j, hist[j]);
	}
}

void main() {
	//test_encrypt_decrypt();
	funstufflol();
}