/*
 * Copyright © 2016, Mykos Hudson-Crisp <micklionheart@gmail.com>
 * All rights reserved.
 */

#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <memory.h>
#include <vector>
#include "IsaacPrng.h"

using namespace std;

#define ENTROPY_PER_CORE 128
IsaacPrng PRNG;

IsaacCore::IsaacCore() {
	seeded = false;
	memset(state, 0, sizeof(state));
	memset(output, 0, sizeof(output));
	ctr = 0;
	security = 0;
	tries = 0;
}

IsaacCore::IsaacCore(unsigned char* data, size_t num) {
	seeded = false;
	memset(state, 0, sizeof(state));
	memset(output, 0, sizeof(output));
	ctr = 0;
	security = 0;
	tries = 0;
	Seed(data, num);
}

IsaacCore::IsaacCore(IsaacCore* prng) {
	seeded = false;
	memset(state, 0, sizeof(state));
	memset(output, 0, sizeof(output));
	ctr = 0;
	security = 0;
	tries = 0;
	Seed(prng);
}

IsaacCore::IsaacCore(IsaacPrng* prng) {
	seeded = false;
	memset(state, 0, sizeof(state));
	memset(output, 0, sizeof(output));
	ctr = 0;
	security = 0;
	tries = 0;
	Seed(prng);
}

unsigned int IsaacCore::Rand() {
	if (ctr <= 0) Randomize();
	return output[--ctr];
}

size_t IsaacCore::Rand(void* out, size_t bytes) {
	unsigned char* dst = (unsigned char*)out;
	size_t i = 0;
	while (i < bytes) {
		Randomize();
		size_t block = bytes - i;
		if (block > ctr*4) {
			block = ctr*4;
			ctr = 0;
		}
		memcpy(&dst[i], output, block);
		i += block;
	}
	return i;
}

unsigned int IsaacCore::Random(unsigned int range) {
	if (range <= 1) return 0;
	unsigned long long d = 0x100000000LL / range;
	for(;;) {
		if (ctr <= 0) Randomize();
		unsigned int x = output[--ctr] / d;
		if (x < range) return x;
	}
}

unsigned int IsaacCore::Random(unsigned int l, unsigned int h) {
	return l + Random(1 + h - l);
}

/*
BigZ IsaacCore::BigRand(size_t bits) {
	vector<char> buf;
	auto bytes = 1 + bits / 8;
	buf.resize(bytes);
	BigZ N, M = BigZ(2) ^ bits;
	Rand(&buf[0], bytes);
	N.Import(buf);
	N &= (M - 1);
	return N;
}

BigZ IsaacCore::BigRandom(BigZ low, BigZ high) {
	BigZ range = high - low;
	size_t bits = range.Log2();
	BigZ random = BigRand(bits);
	while (random > range) random = BigRand(bits);
	return low + random;
}

BigZ IsaacCore::BigPrime(int bits) {
	vector<unsigned char> buf;
	auto bytes = 1 + bits / 8;
	buf.resize(bytes);
	BigZ R, M = BigZ(2) ^ bits;
	M |= 1;
	while (!R.IsPrime()) {
		Rand(&buf[0], bytes);
		R.Import(&buf[0], bytes);
		R |= M;
		tries++;
	}
	return R;
}
*/

void IsaacCore::Randomize() {
	if (!seeded) Prepare();
	cc = cc + 1;
	bb = bb + cc;
	for (int i=0;i<256;i++) {
		auto x = state[i];
		switch (i%4) {
			case 0: aa = aa^(aa<<13); break;
			case 1: aa = aa^(aa>>6); break;
			case 2: aa = aa^(aa<<2); break;
			case 3: aa = aa^(aa>>16); break;
		}
		aa += state[(i+128) & 0xFF];
		state[i] = aa + bb + state[(x >> 2) & 0xFF];
		bb = x + state[(state[i] >> 10) & 0xFF];
		output[i] = bb;
	}
	ctr = 256;
}

void IsaacCore::Seed(IsaacCore* prng) {
	security = prng->security;
	for(auto& x: output) x = prng->Rand();
	seeded = true;
	Prepare();
}

void IsaacCore::Seed(IsaacPrng* prng) {
	security = prng->security;
	for(auto& x: output) x = prng->Rand();
	seeded = true;
	Prepare();
}

void IsaacCore::Seed(const void* data, size_t num, size_t entropy) {
	FIPS202_SHAKE256((unsigned char*)data, num, (unsigned char*)output, sizeof(output));
	seeded = true;
	Prepare();
	security = entropy;
}

void IsaacCore::Prepare() {
#define mix(a,b,c,d,e,f,g,h) { \
   a^=b<<11; d+=a; b+=c; \
   b^=c>>2;  e+=b; c+=d; \
   c^=d<<8;  f+=c; d+=e; \
   d^=e>>16; g+=d; e+=f; \
   e^=f<<10; h+=e; f+=g; \
   f^=g>>4;  a+=f; g+=h; \
   g^=h<<8;  b+=g; h+=a; \
   h^=a>>9;  c+=h; a+=b; \
}
	if (!seeded) {
#ifdef WIN32
		HCRYPTPROV hProvider = 0;
		if (!CryptAcquireContextW(&hProvider, 0, 0, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT | CRYPT_SILENT)) return false;
		if (!CryptGenRandom(hProvider, sizeof(output), output)) {
			fprintf(stderr, "[WARNING] IsaacCore: Using seed from libc\n");
			srand(rand()+time(0));
			for (int i=0;i<256;i+=8) output[i] = rand();
		}
		CryptReleaseContext(hProvider, 0);
#else
		FILE*fp=fopen("/dev/urandom", "rb");
		security = 0;
		if (fp) {
			fprintf(stderr, "[NOTICE] IsaacCore: Using seed from /dev/urandom\n");
			fread(output, 1, sizeof(output), fp);
			fclose(fp);
		} else {
			fprintf(stderr, "[WARNING] IsaacCore: Using seed from libc\n");
			srand(rand()+time(0));
			for (int i=0;i<256;i+=8) output[i] = rand();
		}
#endif
	}
	seeded = true;
	aa=bb=cc=0;
	unsigned int a,b,c,d,e,f,g,h;
	a=b=c=d=e=f=g=h=0x9E3779B9;
	for (int i=0;i<4;i++) {
		mix(a,b,c,d,e,f,g,h);
	}
	for (int i=0;i<256;i+=8) {
		a+=output[i  ]; b+=output[i+1]; c+=output[i+2]; d+=output[i+3];
		e+=output[i+4]; f+=output[i+5]; g+=output[i+6]; h+=output[i+7];
		mix(a,b,c,d,e,f,g,h);
		state[i  ]=a; state[i+1]=b; state[i+2]=c; state[i+3]=d;
		state[i+4]=e; state[i+5]=f; state[i+6]=g; state[i+7]=h;
	}
	for (int i=0; i<256; i+=8) {
		a+=state[i  ]; b+=state[i+1]; c+=state[i+2]; d+=state[i+3];
		e+=state[i+4]; f+=state[i+5]; g+=state[i+6]; h+=state[i+7];
		mix(a,b,c,d,e,f,g,h);
		state[i  ]=a; state[i+1]=b; state[i+2]=c; state[i+3]=d;
		state[i+4]=e; state[i+5]=f; state[i+6]=g; state[i+7]=h;
	}
	Randomize();
	ctr = 0;
}

bool IsaacCore::Secure(size_t bits, bool force, size_t* entropyBits) {
#define mix(a,b,c,d,e,f,g,h) { \
   a^=b<<11; d+=a; b+=c; \
   b^=c>>2;  e+=b; c+=d; \
   c^=d<<8;  f+=c; d+=e; \
   d^=e>>16; g+=d; e+=f; \
   e^=f<<10; h+=e; f+=g; \
   f^=g>>4;  a+=f; g+=h; \
   g^=h<<8;  b+=g; h+=a; \
   h^=a>>9;  c+=h; a+=b; \
}
	if (!force && bits <= security) return true;
#ifdef WIN32
	HCRYPTPROV hProvider = 0;
	if (!CryptAcquireContextW(&hProvider, 0, 0, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT | CRYPT_SILENT)) return false;
	if (!CryptGenRandom(hProvider, 1 + bits / 8, output)) {
		CryptReleaseContext(hProvider, 0);
		return false;
	}
	CryptReleaseContext(hProvider, 0);
#else
	FILE*fp=fopen("/dev/random", "rb");
	if (!fp) return false;
	seeded = true;
	Randomize();
	fprintf(stderr, "[NOTICE] IsaacCore: Gathering entropy from /dev/random...\n");
	unsigned char* buf = (unsigned char*)output;
	size_t bytes = 1 + bits / 8;
	if (bytes > sizeof(output)) {
		bytes = sizeof(output);
	}
	size_t tbits = 0;
	for(size_t i=0;i<bytes;i++) {
		char b;
		fread(&b, 1, 1, fp);
		buf[i] ^= b;
		size_t ebits = bits - tbits;
		if (ebits > 8) ebits = 8;
		tbits += ebits;
		if (entropyBits) *entropyBits += ebits;
		fprintf(stderr, "\r[");
		int bars = (74 * i) / bytes;
		for(int q=0;q<74;q++) {
			fprintf(stderr, "%c", ((q < bars) ? '|' : ' '));
		}
		fprintf(stderr, "] %02lu%%", (100 * i) / bytes);
	}
	security += tbits;
	fprintf(stderr, "\r[");
	for(int q=0;q<74;q++) fprintf(stderr, "|");
	fprintf(stderr, "]100%%\n");
	fclose(fp);
#endif

	// Bob Jenkins said he doesn't have much faith in the seeding routine
	// for that reason, I'm randomizing the seed here
	FIPS202_SHAKE256((unsigned char*)output, sizeof(output), (unsigned char*)output, sizeof(output));

	aa=bb=cc=0;
	unsigned int a,b,c,d,e,f,g,h;
	a=b=c=d=e=f=g=h=0x9E3779B9;
	for (int i=0;i<4;i++) {
		mix(a,b,c,d,e,f,g,h);
	}
	for (int i=0;i<256;i+=8) {
		a+=output[i  ]; b+=output[i+1]; c+=output[i+2]; d+=output[i+3];
		e+=output[i+4]; f+=output[i+5]; g+=output[i+6]; h+=output[i+7];
		mix(a,b,c,d,e,f,g,h);
		state[i  ]=a; state[i+1]=b; state[i+2]=c; state[i+3]=d;
		state[i+4]=e; state[i+5]=f; state[i+6]=g; state[i+7]=h;
	}
	for (int i=0; i<256; i+=8) {
		a+=state[i  ]; b+=state[i+1]; c+=state[i+2]; d+=state[i+3];
		e+=state[i+4]; f+=state[i+5]; g+=state[i+6]; h+=state[i+7];
		mix(a,b,c,d,e,f,g,h);
		state[i  ]=a; state[i+1]=b; state[i+2]=c; state[i+3]=d;
		state[i+4]=e; state[i+5]=f; state[i+6]=g; state[i+7]=h;
	}
	Randomize();
	Randomize();
	ctr = 0;
	return true;
}

IsaacPrng::IsaacPrng() {
	security = 0;
	IsaacCore rng;
	rng.Prepare();
	core.push_back(rng);
}

size_t IsaacPrng::Security() {
	size_t s = 0;
	//coreLock.Read();
	for(auto& rng: core) {
		int sec = rng.security;
		if (sec > ENTROPY_PER_CORE) sec = ENTROPY_PER_CORE;
		s += sec;
	}
	//coreLock.Unlock();
	return s;
}

bool IsaacPrng::Secure(size_t bits, bool force) {
	if (force) {
		security = 0;
		//coreLock.Write();
		for(auto& rng: core) {
			rng.security = 0;
		}
		//coreLock.Unlock();
	}
	if (security >= bits) return true;
	//coreLock.Read();
	for(auto& rng: core) {
		if (rng.security >= ENTROPY_PER_CORE) continue;
		size_t target = bits - security;
		if (target > ENTROPY_PER_CORE) {
			target = ENTROPY_PER_CORE;
		}
		size_t delta = target - rng.security;
		//coreLock.Upgrade();
		rng.Secure(target);
		//coreLock.Downgrade();
		security += delta;
	}
	//coreLock.Unlock();
	size_t target = bits - security;
	size_t boxes = (2 * target + 1) / (2 * ENTROPY_PER_CORE);
	target -= boxes * ENTROPY_PER_CORE;
	if (boxes > 2) {
		fprintf(stderr, "IsaacPrng: Adding %lu entropy %s\n", boxes, (boxes == 1) ? "core" : "cores");
	}
	for(int i=0;i<boxes;i++) {
		IsaacCore rng;
		rng.Secure(ENTROPY_PER_CORE, false, &security);
		//coreLock.Write();
		core.push_back(rng);
		//coreLock.Unlock();
	}
	if (target > 0) {
		IsaacCore rng;
		rng.Secure(target, false, &security);
		//coreLock.Write();
		core.push_back(rng);
		//coreLock.Unlock();
	}
	return true;
}
unsigned int IsaacPrng::Rand() {
	unsigned int output = 0;
	for(auto& prng: core) {
		output ^= prng.Rand();
		output = (output >> 13) | (output << 19);
	}
	return output;
}
size_t IsaacPrng::Rand(void* out, size_t bytes) {
	unsigned char* dst = (unsigned char*)out;
	size_t i = 0;
	while (i < bytes) {
		unsigned int output = Rand();
		size_t block = bytes - i;
		if (block > sizeof(output)) block = sizeof(output);
		memcpy(&dst[i], &output, block);
		i += block;
	}
	return i;
}
unsigned int IsaacPrng::Random(unsigned int range) {
	if (range <= 1) return 0;
	unsigned long long d = 0x100000000LL / range;
	for(;;) {
		unsigned int x = Rand() / d;
		if (x < range) return x;
	}
}
unsigned int IsaacPrng::Random(unsigned int low, unsigned int high) {
	return low + Random(1 + high - low);
}
/*
BigZ IsaacPrng::BigRand(size_t bits) {
	vector<char> buf;
	auto bytes = 1 + bits / 8;
	buf.resize(bytes);
	BigZ N, M = BigZ(2) ^ bits;
	Rand(&buf[0], bytes);
	N.Import(&buf[0], bytes);
	N &= (M - 1);
	return N;
}
BigZ IsaacPrng::BigRandom(BigZ low, BigZ high) {
	BigZ range = high - low;
	size_t bits = range.Log2();
	BigZ random = BigRand(bits);
	while (random > range) random = BigRand(bits);
	return low + random;
}
BigZ IsaacPrng::BigPrime(int bits) {
	vector<char> buf;
	auto bytes = 1 + bits / 8;
	buf.resize(bytes);
	BigZ R, M = BigZ(2) ^ bits;
	M |= 1;
	while (!R.IsPrime()) {
		Rand(&buf[0], bytes);
		R.Import(&buf[0], bytes);
		R |= M;
		tries++;
	}
	return R;
}
*/

void IsaacPrng::Seed(IsaacPrng* src) {
	IsaacCore rng;
	rng.Seed(src);
	//coreLock.Write();
	core.push_back(rng);
	//coreLock.Unlock();
}

