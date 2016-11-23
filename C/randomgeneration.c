#include <stdio.h>
#include <windows.h>
#include <Wincrypt.h>
#pragma comment(lib, "advapi32.lib")

int main()
{
	HCRYPTPROV hProvider = 0;

	if (!CryptAcquireContextW(&hProvider, 0, 0, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT | CRYPT_SILENT))
		return 1;

	const DWORD dwLength = 8;
	BYTE pbBuffer[8] = {};

	if (!CryptGenRandom(hProvider, dwLength, pbBuffer))
	{
		CryptReleaseContext(hProvider, 0);
		return 1;
	}

	for (DWORD i = 0; i < dwLength; ++i)
		printf("%x\n", pbBuffer[i]);

	if (!CryptReleaseContext(hProvider, 0))
		return 1;
}