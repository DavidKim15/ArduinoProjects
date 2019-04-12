#include "avr/io.h"
.text
.global setup
.global loop
.global timer
.global again

// SOS = ... _ _ _ ...

setup:
  ldi r16, 0b00100000
  sts DDRB, r16
  
loop:

       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY

       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX

       ldi r17, 0b00100000
       sts PORTB, r17
       call timerZ
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerZ
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerZ
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerZ
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerZ
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerZ

       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX

       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00100000
       sts PORTB, r17
       call timerY
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerY

       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX
       ldi r17, 0b00000000
       sts PORTB, r17
       call timerX

//  loop1:
//       ldi r20, 3
//       
//       ldi r17, 0b00100000
//       sts PORTB, r17
//       call timerY
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerY
//
//       cpi r20, 1
//       BREQ loop6
//       dec r20
//       jmp loop1
       
//   loop2:
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerX
//       jmp loop3
//       
//   loop3:
//       ldi r20, 3
//       
//       ldi r17, 0b00100000
//       sts PORTB, r17
//       call timerZ
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerZ
//       
//       cpi r20, 0
//       BRNE loop4
//       dec r20
//       jmp loop3
//
//   loop4:
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerX
//       jmp loop5
//
//   loop5:
//       ldi r20, 3
//       
//       ldi r17, 0b00100000
//       sts PORTB, r17
//       call timerY
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerY
//       
//       cpi r20, 0
//       BRNE loop6
//       dec r20
//       jmp loop5

//   loop6:
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerX
//       ldi r17, 0b00000000
//       sts PORTB, r17
//       call timerX
//       jmp end
//       
//   end:
//       jmp loop
//---------------------------------------//
timerX:  //pause
LDI R17, 32
L1X: LDI R18, 200
L2X: LDI R19, 250
L3X:
    NOP
    NOP
    DEC R19
    BRNE L3X
    DEC R18
    BRNE L2X
    DEC R17
    BRNE L1X
ret

timerY:  //dit
LDI R17, 32
L1Y: LDI R18, 50
L2Y: LDI R19, 100
L3Y:
    NOP
    NOP
    DEC R19
    BRNE L3Y
    DEC R18
    BRNE L2Y
    DEC R17
    BRNE L1Y
ret

timerZ:  //dat
LDI R17, 32
L1Z: LDI R18, 200
L2Z: LDI R19, 250
L3Z:
    NOP
    NOP
    DEC R19
    BRNE L3Z
    DEC R18
    BRNE L2Z
    DEC R17
    BRNE L1Z
ret

