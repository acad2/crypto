#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <memory.h>
#include <vector>
#include <algorithm>
#include <string>
#include "IsaacPrng.h"
#include "RadixPacker.h"

using namespace std;

#define BIT(n) (1ull << (n))
#define N 256
typedef unsigned short Key[N*2];
typedef unsigned char Plaintext[N/8];
typedef unsigned char Ciphertext[N/4];
typedef Ciphertext PublicKey[N];

void Keygen(Key key) {
	for (int i = 0; i < N*2; i++) {
		key[i] = i;
	}
	for (int i = 0; i <= N*2-2; i++) {
		unsigned j = PRNG.Random(N*2 - i);
		swap(key[i], key[i + j]);
	}
}

void Encrypt(Ciphertext out, Plaintext input, Key key) {
	Ciphertext in;
	memcpy(in, input, sizeof(Plaintext));
	PRNG.Rand(in + sizeof(Plaintext), sizeof(Plaintext));
	for(int i=0;i<sizeof(Plaintext);i++) {
		in[i] ^= in[i + sizeof(Plaintext)];
	}
	memset(out, 0, sizeof(Ciphertext));
	for(int i=0;i<sizeof(Ciphertext);i++) {
		unsigned char y = 0;
		for(int j=0;j<8;j++) {
			int k = key[i*8 + j];
			int k8 = k / 8;
			unsigned char x = in[k8];
			k -= 8 * k8;
			if (x & BIT(k)) {
				y |= BIT(j);
			}
		}
		out[i] = y;
	}
}

void Decrypt(Plaintext output, Ciphertext in, Key key) {
	Ciphertext out;
	memset(out, 0, sizeof(Ciphertext));
	for(int i=0;i<sizeof(Ciphertext);i++) {
		unsigned char x = in[i];
		for(int j=0;j<8;j++) {
			int k = key[i*8 + j];
			int k8 = k / 8;
			k -= 8 * k8;
			if (x & BIT(j)) {
				out[k8] |= BIT(k);
			}
		}
	}
	for(int i=0;i<sizeof(Plaintext);i++) {
		output[i] = out[i] ^= out[i + sizeof(Plaintext)];
	}
}

void MakePubKey(PublicKey out, Key in) {
	Plaintext base;
	for(int i=0;i<N;i++) {
		memset(base, 0, sizeof(Plaintext));
		base[i/8] = BIT(i%8);
		Encrypt(out[i], base, in);
	}
}

void XorCiphertext(Ciphertext dst, Ciphertext src) {
	for(int i=0;i<sizeof(Ciphertext);i++) {
		dst[i] ^= src[i];
	}
}

int HammingWeight(unsigned char* buf, int len) {
	int out = 0;
	for(int i=0;i<len;i++) {
		unsigned char x = buf[i];
		while (x) {
			out += x & 1;
			x >>= 1;
		}
	}
	return out;
}

void PubEncrypt(Ciphertext out, Plaintext in, PublicKey key) {
	memset(out, 0, sizeof(Ciphertext));
	for(int i=0;i<N;i++) {
		if (in[i/8] & BIT(i%8)) {
			XorCiphertext(out, key[i]);
		}
	}
}

void ExportKey(Key key, const char* fn) {
	FILE*fp=fopen(fn,"wb");
	if (!fp) return;
	fwrite(key, 1, sizeof(Key), fp);
	fclose(fp);
}

void ImportKey(Key key, const char* fn) {
	FILE*fp=fopen(fn,"rb");
	if (!fp) return;
	fread(key, 1, sizeof(Key), fp);
	fclose(fp);
}

void ExportKey2(Key key, const char* fn) {
	FILE*fp=fopen(fn,"wb");
	if (!fp) return;
	RadixPacker rp;
	vector<int> values;
	for(int i=0;i<N*2;i++) {
		values.push_back(i);
	}
	for(int i=0;i<N*2;i++) {
		int x = -1;
		for(int j=0;j<N*2;j++) {
			if (key[i] == values[j]) {
				x = j;
				break;
			}
		}
		rp.Write(x, values.size());
		values.erase(values.begin() + x);
	}
	u64 len = rp.Flush();
	fwrite(rp.Output.data(), 1, len, fp);
	fclose(fp);
}

void ImportKey2(Key key, const char* fn) {
	FILE*fp=fopen(fn,"rb");
	if (!fp) return;
	RadixUnpacker rp;
	while (!feof(fp)) {
		u64 word = 0;
		fread(&word, 1, sizeof(word), fp);
		rp.Input.push_back(word);
	}
	fclose(fp);
	rp.Flush();
	
	vector<int> values;
	for(int i=0;i<N*2;i++) {
		values.push_back(i);
	}

	for(int i=0;i<N*2;i++) {
		int x = rp.Read(values.size());
		key[i] = values[x];
		values.erase(values.begin() + x);
		//key[i] = rp.Read(0x10000);
	}
}

void ExportPubKey(PublicKey key, const char* fn) {
	FILE*fp=fopen(fn,"wb");
	if (!fp) return;
	fwrite(key, N, sizeof(Ciphertext), fp);
	fclose(fp);
}

void ImportPubKey(PublicKey key, const char* fn) {
	FILE*fp=fopen(fn,"rb");
	if (!fp) return;
	fread(key, N, sizeof(Ciphertext), fp);
	fclose(fp);
}

int main(int argc, const char** argv) {
	if (argc <= 1) {
		printf("Usage: %s < keygen / pubkey / encrypt / decrypt / pubencrypt > < output > < input > [ key ]\n", argv[0]);
		return 1;
	}
	if (string(argv[1]) == "keygen") {
		Key key;
		Keygen(key);
		ExportKey(key, "private.key");
		
		PublicKey pkey;
		MakePubKey(pkey, key);
		ExportPubKey(pkey, "public.key");
		return 0;
	}
	if (string(argv[1]) == "pubkey") {
		Key key;
		ImportKey2(key, "private.key");

		PublicKey pkey;
		MakePubKey(pkey, key);
		ExportPubKey(pkey, "public.key");
		return 0;
	}
	if (string(argv[1]) == "comp") {
		Key key;
		ImportKey(key, "backup.key");
		ExportKey2(key, "private.key");
		return 0;
	}
	if (string(argv[1]) == "decomp") {
		Key key, key2;
		ImportKey2(key, "private.key");
		ImportKey(key2, "backup.key");
		for(int q=0;q<sizeof(key);q++) {
			key[q] ^= key2[q];
		}
		ExportKey(key, "decompressed.key");
		return 0;
	}
	if (string(argv[1]) == "encrypt") {
		Key key;
		ImportKey2(key, "private.key");
		
		FILE*fin=fopen(argv[2],"rb");
		if (!fin) return 2;
		FILE*fout=fopen(argv[3],"wb");
		if (!fout) return 3;
		while(!feof(fin)) {
			Plaintext in;
			memset(in, 0, sizeof(Plaintext));
			fread(in, 1, sizeof(Plaintext), fin);
			Ciphertext out;
			Encrypt(out, in, key);
			fwrite(out, 1, sizeof(Ciphertext), fout);
		}
		fclose(fin);
		fclose(fout);
	}
	if (string(argv[1]) == "decrypt") {
		Key key;
		ImportKey2(key, "private.key");
//		ImportKey(key, "backup.key");
		
		FILE*fin=fopen(argv[2],"rb");
		if (!fin) return 2;
		FILE*fout=fopen(argv[3],"wb");
		if (!fout) return 3;
		while(!feof(fin)) {
			Ciphertext in;
			memset(in, 0, sizeof(Ciphertext));
			if (!fread(in, 1, sizeof(Ciphertext), fin)) break;
			Plaintext out;
			Decrypt(out, in, key);
			fwrite(out, 1, sizeof(Plaintext), fout);
		}
		fclose(fin);
		fclose(fout);
	}
	if (string(argv[1]) == "decrypt-cracked") {
		Key key;
		ImportKey(key, "crack.key");
		
		FILE*fin=fopen(argv[2],"rb");
		if (!fin) return 2;
		FILE*fout=fopen(argv[3],"wb");
		if (!fout) return 3;
		while(!feof(fin)) {
			Ciphertext in;
			memset(in, 0, sizeof(Ciphertext));
			fread(in, 1, sizeof(Ciphertext), fin);
			Plaintext out;
			Decrypt(out, in, key);
			fwrite(out, 1, sizeof(Plaintext), fout);
		}
		fclose(fin);
		fclose(fout);
	}
	if (string(argv[1]) == "pubencrypt") {
		PublicKey pkey;
		ImportPubKey(pkey, "public.key");
		
		FILE*fin=fopen(argv[2],"rb");
		if (!fin) return 2;
		FILE*fout=fopen(argv[3],"wb");
		if (!fout) return 3;
		while(!feof(fin)) {
			Plaintext in;
			memset(in, 0, sizeof(Plaintext));
			fread(in, 1, sizeof(Plaintext), fin);
			Ciphertext out;
			PubEncrypt(out, in, pkey);
			fwrite(out, 1, sizeof(Ciphertext), fout);
		}
		fclose(fin);
		fclose(fout);
	}
	if (string(argv[1]) == "crack") {
		Key key;
		memset(key, 0, sizeof(key));
		PublicKey pkey;
		ImportPubKey(pkey, "public.key");
		for(int q=0;q<N*2;q++) {
			for(int k=0;k<N;k++) {
				Ciphertext accum;
				memset(accum, 0, sizeof(accum));
				for(int j=0;j<N;j++) {
					if (j == k) continue;
					unsigned char deal = 0;
					if (pkey[j][q/8] & BIT(q%8)) deal = 0xFF;
					for(int i=0;i<sizeof(accum);i++) {
						accum[i] |= pkey[j][i] ^ deal;
					}
				}
				int w = HammingWeight(accum, sizeof(accum));
				if (w == N*2 - 2) {
					key[q] = k;
					break;
				}
			}
		}
		ExportKey(key, "crack.key");
		return 0;
	}
	return 0;
}

