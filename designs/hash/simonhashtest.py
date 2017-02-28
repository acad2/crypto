z[31]=[1,1,1,1,1,0,1,0,0,0,
       1,0,0,1,0,1,0,1,1,0, 
       0,0,0,1,1,1,0,0,1,1,0]

def f(key): # 64 bit version
    ka = key >> 48
    kb = key >> 32
    kc = key >> 16
    kd = key >> 0

    u16tmp  = ROR_16(ka,3); 
    u16tmp  = u16tmp ^ kc;
    u16tmp  = u16tmp ^ ROR_16(u16tmp,1); 
    u16tmp  = ~kd ^ u16tmp ^ z[i]ˆ3;

    #key = (key >> 16); # == kc
    #keytmp = u16tmp; 
    #keytmp = keytmp << 48; 
    #key = keytmp + key;
    key = (u16tmp << 48) ^ kc # equivalent to above 
    
    # ka0 ka1 ka2 ka3 ka4 ka5 ka6 ka7 ka8 ka9 kaA kaB kaC kaD kaE kaF # each key, in bits
    # kb0 kb1 kb2 kb3 kb4 kb5 kb6 kb7 kb8 kb9 kbA kbB kbC kbD kbE kbF
    # kc0 kc1 kc2 kc3 kc4 kc5 kc6 kc7 kc8 kc9 kcA kcB kcC kcD kcE kcF
    # kd0 kd1 kd2 kd3 kd4 kd5 kd6 kd7 kd8 kd9 kdA kdB kdC kdD kdE kdF
    
    # u16tmp = rotate_right(ka, 3)
    # =
    # kaD kaE kaF ka0 ka1 ka2 ka3 ka4 ka5 ka6 ka7 ka8 ka9 kaA kaB kaC    
    
    # u16tmp ^= kc
    # kaD kaE kaF ka0 ka1 ka2 ka3 ka4 ka5 ka6 ka7 ka8 ka9 kaA kaB kaC    
    # kc0 kc1 kc2 kc3 kc4 kc5 kc6 kc7 kc8 kc9 kcA kcB kcC kcD kcE kcF
    # =
    # kaDkc0 kaEkc1 kaFkc2 ka0kc3 ka1kc4 ka2kc5 ka3kc6 ka4kc7 ka5kc8 ka6kc9 ka7kcA ka8kcB ka9kcC kaAkcD kaBkcE kaCkcF

    # u16tmp ^= rotate_right(u16tmp, 1)
    # kaDkc0 kaEkc1 kaFkc2 ka0kc3 ka1kc4 ka2kc5 ka3kc6 ka4kc7 ka5kc8 ka6kc9 ka7kcA ka8kcB ka9kcC kaAkcD kaBkcE kaCkcF
    # kaCkcF kaDkc0 kaEkc1 kaFkc2 ka0kc3 ka1kc4 ka2kc5 ka3kc6 ka4kc7 ka5kc8 ka6kc9 ka7kcA ka8kcB ka9kcC kaAkcD kaBkcE
    # =
    # kaDkc0kaCkcF kaEkc1kaDkc0 kaFkc2kaEkc1 ka0kc3kaFkc2 ka1kc4ka0kc3 ka2kc5ka1kc4 ka3kc6ka2kc5 ka4kc7ka3kc6 ka5kc8ka4kc7 ka6kc9ka5kc8 ka7kcAka6kc9 ka8kcBka7kcA ka9kcCka8kcB kaAkcDka9kcC kaBkcEkaAkcD kaCkcFkaBkcE
    
    # u16tmp = ~(kd) ^ u16tmp ^ z[i] ^ 3 
    # ==
    # u16tmp = 0xFFFF ^ kd ^ u16tmp ^ z[i] ^ 3
    # ==
    # u16tmp ^= 0xFFFF ^ kd ^ z[i] ^ 3
    # ==
    # u16tmp ^= constants ^ kd
    # ==
    # kaDkc0kaCkcF kaEkc1kaDkc0 kaFkc2kaEkc1 ka0kc3kaFkc2 ka1kc4ka0kc3 ka2kc5ka1kc4 ka3kc6ka2kc5 ka4kc7ka3kc6 ka5kc8ka4kc7 ka6kc9ka5kc8 ka7kcAka6kc9 ka8kcBka7kcA ka9kcCka8kcB kaAkcDka9kcC kaBkcEkaAkcD kaCkcFkaBkcE    
    # kd0 kd1 kd2 kd3 kd4 kd5 kd6 kd7 kd8 kd9 kdA kdB kdC kdD kdE kdF
    # =
    # kaDkc0kaCkcFkd0 kaEkc1kaDkc0kd1 kaFkc2kaEkc1kd2 ka0kc3kaFkc2kd3 ka1kc4ka0kc3kd4 ka2kc5ka1kc4kd5 ka3kc6ka2kc5kd6 ka4kc7ka3kc6kd7 ka5kc8ka4kc7kd8 ka6kc9ka5kc8kd9 ka7kcAka6kc9kdA ka8kcBka7kcAkdB ka9kcCka8kcBkdC kaAkcDka9kcCkdD kaBkcEkaAkcDkdE kaCkcFkaBkcEkdF + some bits flipped due to constants
      
    
    