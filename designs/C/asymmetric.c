#include <stdlib.h>
#include <string.h>

#define WORDSIZE unsigned long
#define KEYSIZE 16
#define ROUNDS 2

void xor_subroutine(WORDSIZE* data, WORDSIZE* data2, WORDSIZE length)
{
    unsigned long index;
    for (index = 0; index < length; index++)
    {
        data[index] ^= data2[index];
    }
}
    
void cipher(WORDSIZE* data, WORDSIZE* public_key, void (*permutation)(WORDSIZE*), WORDSIZE* private_key)
{        
    memcpy(private_key, public_key, KEYSIZE);
    
    int round, index;
    for (round = 0; round < ROUNDS; round++)
    {        
        xor_subroutine(data, private_key, KEYSIZE);        
        permutation(data);
        
        xor_subroutine(private_key, data, KEYSIZE);
        permutation(private_key);
    }
    xor_subroutine(data, private_key, KEYSIZE);       
}
    
void decipher(WORDSIZE* data, WORDSIZE* private_key, void (*invert_permutation)(WORDSIZE*), WORDSIZE* public_key)
{                  
    memcpy(public_key, private_key, KEYSIZE);
    
    xor_subroutine(data, public_key, KEYSIZE);
    int rounds;
    for (rounds = 0; rounds < ROUNDS; rounds++)
    {
        invert_permutation(public_key);
        xor_subroutine(public_key, data, KEYSIZE);
        
        invert_permutation(data);
        xor_subroutine(data, public_key, KEYSIZE);
    }    
}

void encrypt(WORDSIZE* plaintext, WORDSIZE* public_key, void (*permutation)(WORDSIZE*), WORDSIZE* private_key)
{
    cipher(plaintext, public_key, permutation, private_key);   
}

int decrypt(WORDSIZE* ciphertext, WORDSIZE* private_key, void (*invert_permutation)(WORDSIZE*), WORDSIZE* public_key)
{
    WORDSIZE _public_key[KEYSIZE];
    decipher(ciphertext, private_key, invert_permutation, _public_key);
    if (strcmp(_public_key, public_key) == 0)
        {return 0;}
    else
        {return -1;}
}

void test_encrypt_decrypt()
{
    WORDSIZE data[16], public_key[16], plaintext[16], ciphertext[16], private_key[16], _plaintext[16];
    memset(data, 0, 16);
    data[0] = 1;
    memset(public_key, 0, 16);
    memcpy(plaintext, data, 16);
           
    private_key = encrypt(data, public_key);
    memcpy(ciphertext, data, 16);
    
    flag = decrypt(ciphertext, private_key, public_key);
    if (strcmp(plaintext, _plaintext) == 0)
    {
        printf("Success\n");
    }
    else
    {
        printf("Failure\n");
    }
          
        
    //private_key = encrypt(data, public_key)
    //ciphertext = data[:]
    //print [byte for byte in private_key]
    //invalid_plaintext = decrypt(ciphertext, public_key, public_key) # cannot decrypt with the public key
    //assert invalid_plaintext == -1, invalid_plaintext
    //print [byte for byte in ciphertext]
    
int main()
{
    test_encrypt_decrypt();
    return 0;
}

    