#include <string.h> // for memset

#define WORDSIZE unsigned long

//void permutation(WORDSIZE*);
        
void key_alternating_cipher(void (*permutation)(WORDSIZE*),
                            WORDSIZE* round_keys, 
                            WORDSIZE* state,
                            int rounds, int size)
{
    int round, index;
    for(index = 0; index < size; index++)
        {
            state[index] ^= round_keys[index];
        }    
        
    for (round = 0; round < rounds; round++)
    {
        (*permutation)(state);
        round_keys += size;
        for(index = 0; index < size; index++)
        {
            state[index] ^= round_keys[index];
        }               
    }
}

void key_schedule(void (*permutation)(WORDSIZE*),
                  WORDSIZE* key, WORDSIZE* round_keys,
                  int rounds, int size)
{                  
    int round;
    memcpy(round_keys, key, size);
    for (round = 0; round < rounds; round++)
    {        
        permutation(key);
        round_keys += size;        
        memcpy(round_keys, key, size);
    }
}
