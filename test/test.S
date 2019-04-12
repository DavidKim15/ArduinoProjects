#define __SFR_OFFSET 0

#include "avr/io.h"
#include <avr/portpins.h>

.text
.global setup
.global loop

setup:
  ldi r16, 0b11111111
  ldi r17, 0b00000000

  ldi r18, 0b00000001

  out DDRB, r16
  out DDRD, r17

loop:
  out PORTB, r18
  jmp loop
