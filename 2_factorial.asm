.data
    prompt: .asciiz "Introduzca su numero a factorizar : "

.text
.globl main
main:


  li    $v0, 4
  la    $a0, prompt
  syscall            # imprimimos prompt

  li    $v0, 5
  syscall            # leo el numero introducido
  move  $t0, $v0     # lo almaceno en t0

  li   $t1, 1        # inicialimzamos t1  

loop:

  beq  $t0, $zero, exit  # if(t3==0) goto exit lo que produce while(t3 != 0)
  mul  $t1, $t1, $t0     # t1= t1*t0
  addi $t0, $t0, -1      # count --

  j loop                # repite el loop


exit:                  # termina el programa
  li   $v0, 1
  move $a0, $t1
  syscall             # imprimimos el numero ya factorizado
  li   $v0, 10        # syscall exit code
  syscall             # termina el programa
