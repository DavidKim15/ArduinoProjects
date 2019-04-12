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
  
  ldi r21, 0b00100000
  ldi r22, 0b00001100
  ldi r23, 0b00101100
  ldi r24, 0b00001101
  ldi r25, 0b00101101
  ldi r26, 0b00011111

  ldi r18, 0 //our random generator huehue

  out DDRB, r16
  out DDRD, r17


loop:
one:
  inc r18
  cpi r18, 254
  breq reset
  
  sbis PIND, 7   //if button is pushed
  brne two

  cpi r18, 43
  brlo FACE_ONE

  cpi r18, 85
  brlo FACE_TWO

  cpi r18, 127
  brlo FACE_THREE

  cpi r18, 169
  brlo FACE_FOUR

  cpi r18, 211
  brlo FACE_FIVE

  cpi r18, 255
  brlo FACE_SIX
  
  jmp one
// ------------------------------------------------//
two:
  out PORTB, r17
  jmp one
reset:
  ldi r18, 0
  jmp one
// ------------------------------------------------//
FACE_ONE:
  out PORTB, r21
  call timer
  out PORTB, r17
  jmp one 
FACE_TWO:
  out PORTB, r22
  call timer
  out PORTB, r17
  jmp one 
FACE_THREE:
  out PORTB, r23
  call timer
  out PORTB, r17
  jmp one 
FACE_FOUR:
  out PORTB, r24
  call timer
  out PORTB, r17
  jmp one 
FACE_FIVE:
  out PORTB, r25
  call timer
  out PORTB, r17
  jmp one 
FACE_SIX:
  out PORTB, r26
  call timer
  out PORTB, r17
  jmp one 
// ------------------------------------------------//
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
