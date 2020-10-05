.data
    newLine: .asciiz "\n"

.text
.globl main
main:

  li    $t0, 0       # inicializo la variable
  li    $t1, 1       # inicializo la variable

  li    $v0, 1
  move  $a0, $t0     # almacenamos t0 en a0 para el syscall
  syscall            # imprimimos 0
  li    $v0, 4
  la    $a0, newLine
  syscall            # llamamos a newline para el salto de linea

  li    $v0, 1
  move  $a0, $t1     # almacenamos t1 en a0 para el syscall
  syscall            # imprimimos 1
  li    $v0, 4
  la    $a0, newLine
  syscall            # llamamos a newline para el salto de linea

  li    $t3, 18      #inicializamos t3 para su uso

loop:

  beq  $t3, $zero, exit  # if(t3==0) goto exit lo que produce while(t3 != 0)
  add  $t2, $t1, $t0     # t2=t1+t0
  li   $v0, 1
  move $a0, $t2
  syscall               # imprimimos $t2

  li  $v0, 4
  la  $a0, newLine
  syscall               # salto de linea

  move $t0, $t1         # remplazamos los valores
  move $t1, $t2
  addi $t3, $t3, -1

  j loop                # repite el loop


exit:                   # termina el programa

  li   $v0, 10        # syscall exit code
  syscall             # termina el programa
