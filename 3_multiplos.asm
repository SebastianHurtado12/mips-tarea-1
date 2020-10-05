.data
    newLine: .asciiz "\n "

.text
.globl main
main:

  li    $t0, 1               # inicializamos la variabel para el conteo
  la    $t3, 101             # inicializamos la variabel para el conteo

loop:


  beq  $t0, $t3, exit        # if(t0==t3) goto exit
  rem  $t1, $t0, 5           # t1 = t0 % 5  verificamos si el numero es divisible por 5
  beq  $t1, $zero, imprimir  # if(t1==0) goto imprimir el numero en cuestion SI es multiplo de 5
  rem  $t1, $t0, 3           # t1 = t0 % 3  verificamos si el numero es divisible por 3
  beq  $t1, $zero, imprimir  # if(t3==0) goto imprimir el numero en cuestion SI es multiplo de 3

  addi $t0, $t0, 1      # count ++

  j loop                # repite el loop

imprimir:                    # imprimios los multiplos en la consola

  li  $v0, 1
  move  $a0, $t0
  syscall               # imprimimos el multiplo

  li $v0, 4
  la $a0, newLine
  syscall               # realizamos un salto de linea

  addi $t0, $t0, 1      # count ++

  j loop                # repite el loop

exit:                  # termina el programa

  li   $v0, 10        # syscall exit code
  syscall             # termina el programa
