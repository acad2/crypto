/*
 * Immoral™ Software Development Kit
 * 
 * Copyright © 2016, Mykos Hudson-Crisp <micklionheart@gmail.com>
 * All rights reserved.
 *
 */

#pragma once

#include <stdlib.h>
#include <vector>
#include "Keccak.h"

//#include "Crypto/BigZ.h"
//#include "Utility/Mutex.h"

struct IsaacPrng;
struct IsaacCore {
	IsaacCore();
	IsaacCore(unsigned char* data, size_t num);
	IsaacCore(IsaacPrng* prng);
	IsaacCore(IsaacCore* prng);

	void Seed(const void* data, size_t num, size_t entropy = 0);
	void Seed(IsaacPrng* prng);
	void Seed(IsaacCore* prng);
	void Seed();
	bool Secure(size_t bits = 192, bool force = false, size_t* entropyBits = 0);

	unsigned int Rand(); // 32 random bits, do not use % to get a random number in a range!
	size_t Rand(void* out, size_t bytes); // "any" number of random bytes
	unsigned int Random(unsigned int range); // Unbiased over [0, range-1]
	unsigned int Random(unsigned int low, unsigned int high); // Unbiased over [low, high]
	//BigZ BigRand(size_t bits);
	//BigZ BigRandom(BigZ low, BigZ high);
	//BigZ BigPrime(int bits);
	void Randomize();
	void Prepare();

	bool seeded;
	size_t security;
	unsigned int output[256];
	unsigned int state[256];
	unsigned int aa, bb, cc;
	size_t ctr, tries;
};

struct IsaacPrng {
	IsaacPrng();
	void Seed(IsaacPrng*);
	bool Secure(size_t bits = 192, bool force = false);
	size_t Security();
	unsigned int Rand(); // 32 random bits, do not use % to get a random number in a range!
	size_t Rand(void* out, size_t bytes); // "any" number of random bytes
	unsigned int Random(unsigned int range); // Unbiased over [0, range-1], Use this instead of %
	unsigned int Random(unsigned int low, unsigned int high); // Unbiased over [low, high]
	//BigZ BigRand(size_t bits);
	//BigZ BigRandom(BigZ low, BigZ high);
	//BigZ BigPrime(int bits);

	size_t security, tries;
	std::vector<IsaacCore> core;
	//Mutex coreLock;
};

extern IsaacPrng PRNG;

