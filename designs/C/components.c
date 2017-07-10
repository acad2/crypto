#define WORDSIZE16 unsigned short
#define WORDSIZE64 unsigned long long

void add_key(WORDSIZE64* state, WORDSIZE64* key)
{
    int index;
    for (index = 0; index < 4; index++)
    {
        state[index] ^= key[index];
    }
}

           