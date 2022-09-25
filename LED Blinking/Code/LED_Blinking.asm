
_main:

;LED_Blinking.c,1 :: 		void main() {
;LED_Blinking.c,2 :: 		TRISB = 0x00;
	CLRF       TRISB+0
;LED_Blinking.c,3 :: 		PORTB = 0x00;
	CLRF       PORTB+0
;LED_Blinking.c,5 :: 		while(1){
L_main0:
;LED_Blinking.c,6 :: 		portB.f2 = 1;
	BSF        PORTB+0, 2
;LED_Blinking.c,7 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;LED_Blinking.c,8 :: 		portB.f2 = 0;
	BCF        PORTB+0, 2
;LED_Blinking.c,9 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;LED_Blinking.c,10 :: 		}
	GOTO       L_main0
;LED_Blinking.c,11 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
