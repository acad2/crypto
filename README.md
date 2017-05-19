Ella's Crypto Research

This repository contains my research into cryptographic algorithm design

Layout
----
- crypto
    - analysis       
    - C
        - folder names are generally design-date (or brief summary of content)
    - designs
        - blockcipher
            - arx
                - I abuse/reappropriate the term to mean (or at least include) And Rotate Xor
            - lightweight
            - sbox
                - exploring the "class 13 representative" optimal 4x4 s-box
            - standardized ("real"/official ciphers)
                - AES, speck
        - encoding
            - not implemented            
        - hash 
        - homomorphic
            - integerbased
            - latticebased
            - modexpbased
            - old
                - initialidea
                - integerbased
                - xorbased
            - publickeyrecipes
            - xorbased
        - integers
        - permutation
            - arxcalibur
                - The only design that I actually named
        - streamcipher
    - latex
        - Contains "papers" I have written. Most are halfway done (if that), some are barely started, and none are published.
    - other
        - contains odds and ends that do not fit into the standard design categories    
        - (Folder): old
        - (Folder): scratch    
         

Most algorithms/files are simply named according to the design type in an increasing sequence, or are named according to the design type and date.
    
The analysis tools are written in python, as well the designs. A few designs have variants written in C to get a better understanding of algorithm performance on the CPU.
Most of the designs are my own and are not intended for use to protect data in the real world. 

The code is for research purposes. Much of it is effectively scratch paper - the contents of any file are not guaranteed to contain accurate or complete reasoning.