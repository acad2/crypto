/*
 * Immoral™ Software Development Kit
 * 
 * Copyright © 2016, Mykos Hudson-Crisp <micklionheart@gmail.com>
 * All rights reserved.
 *
 */

#pragma once

typedef unsigned char u8;
typedef unsigned long long int u64;
typedef unsigned int u32;

extern "C" {
	void Keccak(u32 r, u32 c, const u8 *in, u64 inLen, u8 sfx, u8 *out, u64 outLen);
	void KeccakXOR(u32 r, u32 c, const u8 *in, u64 inLen, u8 sfx, u8 *out, u64 outLen);
	void FIPS202_SHAKE128(const u8 *in, u64 inLen, u8 *out, u64 outLen);
	void FIPS202_SHAKE256(const u8 *in, u64 inLen, u8 *out, u64 outLen);
	void CUSTOM_SHAKE512(const u8 *in, u64 inLen, u8 *out, u64 outLen);
	void FIPS202_SHA3_224(const u8 *in, u64 inLen, u8 *out);
	void FIPS202_SHA3_256(const u8 *in, u64 inLen, u8 *out);
	void FIPS202_SHA3_384(const u8 *in, u64 inLen, u8 *out);
	void FIPS202_SHA3_512(const u8 *in, u64 inLen, u8 *out);
	void KeccakF1600(void *s);
};

