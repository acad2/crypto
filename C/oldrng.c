#include <stdio.h>
#include <stdlib.h>
#include <time.h>
    
int shuffle_extract(unsigned char* data, unsigned char* key, unsigned char state)
{       
    unsigned int i, i2, j, temp;

    for (i = 255; i > 0; i -= 1)
    {                
        j = state & (i - 1); 
        
        //for (i2 = 0; i2 < i; i2 += 1)
        //{
        //    if (i2 == j)
        //    {
        //        temp = data[j];
        //        data[j] = data[i];
        //        data[i] = temp;
        //        key[i] ^= data[j] ^ i ^ data[i];                      
        //        state ^= key[i] ^ key[j];                 
        //    }
        //    else
        //    {
        //        temp = data[i];
        //        data[i] = data[i];
        //        data[i] = temp;
        //        key[i] ^= data[i] ^ 0 ^ data[i];                      
        //        state ^= key[i] ^ key[i];                 
        //    }
        //}
        temp = data[j];
        data[j] = data[i];
        data[i] = temp;
           
        key[i] ^= data[j] ^ i ^ data[i];                      
        state ^= key[i] ^ key[j];       
    }
        
    key[0] ^= data[1] ^ data[0]; 
    state ^= key[0] ^ key[1]; 
    return state;
}

int random_number_generator(unsigned char* key, unsigned char* seed, unsigned char* tweak, unsigned char* output, unsigned int rate, unsigned long byte_count)
{
    unsigned char state = 0x00;
    unsigned int i;
   
    state = key[0];
    state = shuffle_extract(tweak, key, state);        
    state = shuffle_extract(tweak, seed, state);
    
    unsigned long current_amount = 0; 
        
    while(current_amount < byte_count)
    {                          
        state = shuffle_extract(tweak, seed, state);
        for (i = 0; i < rate; i++)
        {            
            output[current_amount + i] = seed[tweak[i]];
        }            
        current_amount += rate;
    }
}

int write_to_file(char* data, unsigned long quantity)
{
    FILE *_file = fopen("rng_10mb.bin", "w");
    if (_file == NULL)
    {
        printf("Error\n");
        
    }
    else
    {
        printf("Writing to file\n");
        int result = fwrite(&data, 1, quantity, _file);
        printf("Success\n");
        if (result == EOF)
        {
            printf("Failed");
        }
        else 
        {
            fflush(_file);
        }
        printf("Supposedly wrote %u bytes to file\n", result);
        fclose(_file);
    }
}

int main(){
    unsigned char data[256] = {0};
    unsigned char key[256] = {0};    
    unsigned char tweak[256] = {0};
    unsigned char* output;
    unsigned int i;
    unsigned long amount = 1024 * 1024;
    
    output = (unsigned char *) malloc(amount);    
    if (output == NULL){
        printf("calloc failed");
    }

    for (i = 0; i < 256; i ++)
    {
        tweak[i] = i;        
    }
        
    clock_t start, end;
    double cpu_time_used;

    while(1){
    start = clock();
    random_number_generator(key, data, tweak, output, 256, amount);    
    end = clock();
    cpu_time_used =  ((double) (end - start)) / CLOCKS_PER_SEC;
   // for (i = 0; i < 256; i ++){
   //     printf("%c", output[i]);
   // }
    printf("Time taken: %f\n", cpu_time_used);    
    }
    write_to_file(data, amount);
    free(output);
}   
 