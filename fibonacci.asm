#fibonacci
.data

.text
main:
addi $s0, $zero, 3             #Number to calculate fibonacci
add $a0, $zero, $s0
addi $t1, $zero, 1
jal Fibonacci
j Exit

Fibonacci:
    addi $sp, $sp, -8	       #Load $ra and $s0 to the stack
    sw $ra, 0($sp)
    sw $s0, 4($sp)

    bne $zero, $a0, pregeneral    #if(n == 0)
        add $v0, $zero, $zero     #result = 0;
        j exitFibonacci
  
    pregeneral:
   	bne $t1, $a0, general    #if(n == 1)
     	addi $v0, $zero, 1     #result = 1;
        j exitFibonacci
        
    general:
        #add $s0, $zero, $a0    #backup n
        addi $s0, $a0, -1
        addi $a0, $a0, -1      #load n-1 as parameter
        jal Fibonacci          #call fibonacci(n-1);
        
        
        add $v0, $v0, $s0      #result = n+fibonacci(n-1);
    
    exitFibonacci:
    
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    addi $sp, $sp, 8           #release the stack
    
    jr $ra                     #return
 
Exit: 