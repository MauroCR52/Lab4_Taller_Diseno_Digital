.text
.global _start

_start:
    LDR R0, =0x1000        @ R0 = Dirección del teclado 
    LDR R1, =0x2000        @ R1 = Dirección del contador 

    MOV R8, #0xE000        
    ORR R9, R8, #0x0048    @ R9 = código flecha 
    ORR R10, R8, #0x0050   @ R10 = código flecha 

loop:
    LDRH R2, [R0]          

    CMP R2, R9             
    BEQ mover_arriba

    CMP R2, R10            
    BEQ mover_abajo

    B loop           

mover_arriba:
    LDR R3, [R1]           
    ADD R3, R3, #1         
    STR R3, [R1]           
    B loop

mover_abajo:
    LDR R4, [R1]           
    SUB R4, R4, #1         
    STR R4, [R1]           
    B loop
