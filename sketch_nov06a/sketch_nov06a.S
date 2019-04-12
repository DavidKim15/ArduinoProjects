#include "avr/io.h"
.text
.global setup
.global loop
.global timer
.global again

setup:
  ldi r16, 0b00100000
  sts DDRB, r16
  
loop:
       ldi r17, 0b00100000
       sts PORTB, r17
       call timer
       ldi r17, 0b00000000
       sts PORTB, r17
       call timer
       jmp loop
  
timer:  //delay of one second
LDI R17, 32
L1: LDI R18, 200
L2: LDI R19, 250
L3:
    NOP
    NOP
    DEC R19
    BRNE L3
    DEC R18
    BRNE L2
    DEC R17
    BRNE L1
ret

