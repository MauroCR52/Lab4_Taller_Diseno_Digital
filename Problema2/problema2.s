.data
x1: .word 3     @ resultado 6
x2: .word 4     @ resultado 24
x3: .word 5     @ resultado 120

.text
.global _start
_start:
   
    LDR R0, =x1
    LDR R1, [R0]     @ R1 = x
    BL factorial   	

    
    LDR R0, =x2
    LDR R1, [R0]
    BL factorial   

   
    LDR R0, =x3
    LDR R1, [R0]
    BL factorial    

    B end        


factorial:
    MOV R2, #1       @ se guarda el resultado en r2, donde se realizan las multiplicacion
    MOV R3, #1       @ el inidice hasta llegar al numero del factorial

loop:
    CMP R3, R1
    BGT fact_end     

    MUL R2, R2, R3   @ se multiplica lo que llevamos del resultado por el indice
    ADD R3, R3, #1   @ i++
    B fact_loop

fact_end:
    BX LR            @ volvemos a donde fue llamado

end:
	B end