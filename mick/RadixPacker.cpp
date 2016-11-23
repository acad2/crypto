/*
 * Immoral™ Software Development Kit
 * 
 * Copyright © 2016, Mykos Hudson-Crisp <micklionheart@gmail.com>
 * All rights reserved.
 *
 */

#include "RadixPacker.h"
#include <assert.h>

RadixPacker::RadixPacker() {
	Buffer = 0;
	WordRange = 1;
}
void RadixPacker::Write(u64 x, u64 n) {
	n++; //FIXME

	assert(x < n);
	u64 z = -Buffer;
	z /= WordRange;
	if (z < n) Flush();
	Buffer += x * WordRange;
	WordRange *= n;
}
u64 RadixPacker::Flush() {
	u64 bytes = Output.size() * sizeof(u64);
	if (WordRange > 1) {
		Output.push_back(Buffer);
		while (WordRange > 1) {
			WordRange /= 256;
			bytes++;
		}
		WordRange = 1;
		Buffer = 0;
	}
	return bytes;
}

RadixUnpacker::RadixUnpacker() {
	Buffer = 0;
}
u64 RadixUnpacker::Read(u64 n) {
	n++; //FIXME

	if (!Buffer) {
		if (!Input.size()) return 0;
		Buffer = Input[0];
		Input.erase(Input.begin());
	}
	u64 r = Buffer;
	Buffer /= n;
	r -= n * Buffer;
	assert(r < n);
	return r;
}
void RadixUnpacker::Flush() {
	Buffer = 0;
}

