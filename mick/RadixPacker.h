/*
 * Immoral™ Software Development Kit
 * 
 * Copyright © 2016, Mykos Hudson-Crisp <micklionheart@gmail.com>
 * All rights reserved.
 *
 */

#pragma once

#include <vector>

typedef unsigned long long u64;

struct RadixPacker {
	RadixPacker();
	void Write(u64 x, u64 n);
	u64 Flush();

	u64 Buffer, WordRange;
	std::vector<u64> Output;
};

struct RadixUnpacker {
	RadixUnpacker();
	u64 Read(u64 n);
	void Flush();

	u64 Buffer;
	std::vector<u64> Input;
};

