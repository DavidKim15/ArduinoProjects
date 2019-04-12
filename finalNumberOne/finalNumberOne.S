// David Kim and Jordan Tantuico 
// We pledge our honor that we have abided by the Stevens Honor System.

#define __SFR_OFFSET 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop
.global one 
.global two

setup:
  ldi r16, 0b11111111
  ldi r17, 0b00000000

  ldi r18, 0

  ldi 21, 0b00000001
  ldi 22, 0b00000010
  ldi 23, 0b00000100
    
  out DDRB, r16
  out DDRD, r17

loop:
one:
  inc r18
  cpi r18, 60
  breq reset
// ------------------------------------------------//
ROCK:
  sbis PIND, 7    //if button is pushed, skip next instruction
  jmp PAPER

  ldi r19, 1      //1 is user's ROCK

  cpi r18, 21
  brlo COMP_ROCK

  cpi r18, 41
  brlo COMP_PAPER

  cpi r18, 61
  brlo COMP_SCISSOR
  
PAPER:
  sbis PIND, 4
  jmp SCISSOR

  ldi r19, 2      //2 is user's PAPER

  cpi r18, 21
  brlo COMP_ROCK

  cpi r18, 41
  brlo COMP_PAPER

  cpi r18, 61
  brlo COMP_SCISSOR
SCISSOR:
  sbis PIND, 2
  jmp two         

  ldi r19, 3      //3 is user's SCISSOR

  cpi r18, 21
  brlo COMP_ROCK

  cpi r18, 41
  brlo COMP_PAPER

  cpi r18, 61
  brlo COMP_SCISSOR
// ------------------------------------------------//
reset:
  ldi r18, 0
  jmp one
two:
  out PORTB, r17
  jmp one
timer:
  ldi r27, 64
delay1:
  ldi r28, 200
delay2:
  ldi r29, 250
delay3:
  dec r29
  nop
  brne delay3

  dec r28
  brne delay2

  dec r27
  brne delay1
ret
// ------------------------------------------------//
COMP_ROCK:
  cpi r19, 1
  breq TIE

  cpi r19, 2
  breq WIN

  cpi r19, 3
  breq LOSE
COMP_PAPER:
  cpi r19, 1
  breq LOSE

  cpi r19, 2
  breq TIE

  cpi r19, 3
  breq WIN
COMP_SCISSOR:
  cpi r19, 1
  breq WIN

  cpi r19, 2
  breq LOSE

  cpi r19, 3
  breq TIE  
// ------------------------------------------------//
TIE:
  out PORTB, r21
  call timer
  jmp two
WIN:
  out PORTB, r22
  call timer
  jmp two
LOSE:
  out PORTB, r23
  call timer
  jmp two
