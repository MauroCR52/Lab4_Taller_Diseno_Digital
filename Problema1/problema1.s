.data
array:   .word 1, 3, 7, 2, 10, 5, 6, 4, 8, 9   @ arreglo
y:       .word 5                             

.text
.global _start
_start:
    LDR R0, =array     
    MOV R1, #0         @ R1 = índice i
    LDR R2, =y
    LDR R3, [R2]       @ R3 = y

loop:
    CMP R1, #10
    BEQ end            @ si i == 10 termina

    LDR R4, [R0, R1, LSL #2]  @ R4 = array[i]

    CMP R4, R3 @ Hacemos la comparacion
    BLT else_sum 

    @ Hacemos la multiplicacion
    MUL R4, R4, R3
    STR R4, [R0, R1, LSL #2]
    B next

else_sum:
    @ Realizamos la suma
    ADD R4, R4, R3
    STR R4, [R0, R1, LSL #2]

next:
    ADD R1, R1, #1 @ se suma 1 al indice de la lista
    B loop

end:
    B end  
