#define STATE_SIZE 32
#define PADDING_CHARACTER 0x80
#define rotate_left8(word, amount)(((word << amount) | (word >> (8 - amount))))

void pad_input(hash_input, input_size, to_size){, padding_character=chr(128)):        
    hash_input += PADDING_CHARACTER
    input_size += 8 // + 8 for 64 bits for the size bytes at the end
    padding = to_size - (input_size % to_size)
    hash_input += ("\x00" * padding) + (struct.pack("Q", input_size))     
    return hash_input
                                    
#define _hash(output, data, hash_key, data_size)({\
    for (index = 0; index < data_size; index++){\
        byte8 = data[index];\
        byte8 ^= rotate_left8(output[(index + 1) % STATE_SIZE], 1);\
        byte8 ^= rotate_left8(output[(index + 2) % STATE_SIZE], 2);\
        byte8 ^= rotate_left8(output[(index + 3) % STATE_SIZE], 3);\
        output[index % STATE_SIZE] ^= byte8;\
        xor_subroutine(output, hash_key[byte8 % STATE_SIZE]);\}})
        
#define hash_function(output, data, data_size, hash_key, post_processing_steps)({\
    _hash(output, data, data_size, hash_key);\
    _hash(output, data_size, hash_key, 8);\
    _hash(output, POST_PROCESSING_BLOCK, hash_key, STATE_SIZE);})