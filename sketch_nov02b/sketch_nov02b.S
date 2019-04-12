#include "avr/io.h"
#define __SFR_OFFSET 0

.global loop
.global setup

//setup:
//  ldi r16, 00
//  ldi r17, 0x00
//  out DDRB, r16     //have to use 'sts' if you don't have OFFSET definition
//
//loop:
//  out PORTB, r17

setup:  //long leg in port 13
  ldi r16, 9
  ldi r17, 0xFF
  ser r16
  out DDRB, r16 //turn on LED
loop:
  ldi r16, 0    //adding this command while turn off LED
  out PORTB, r16
