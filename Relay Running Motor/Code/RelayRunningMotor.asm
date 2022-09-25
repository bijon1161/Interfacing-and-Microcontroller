
_main:

;RelayRunningMotor.c,1 :: 		void main() {
;RelayRunningMotor.c,3 :: 		TRISC=0x00;
	CLRF       TRISC+0
;RelayRunningMotor.c,4 :: 		PORTC=0x00;
	CLRF       PORTC+0
;RelayRunningMotor.c,6 :: 		while(1){
L_main0:
;RelayRunningMotor.c,8 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;RelayRunningMotor.c,9 :: 		delay_ms(8000);
	MOVLW      82
	MOVWF      R11+0
	MOVLW      43
	MOVWF      R12+0
	MOVLW      0
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;RelayRunningMotor.c,10 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;RelayRunningMotor.c,11 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
;RelayRunningMotor.c,13 :: 		}
	GOTO       L_main0
;RelayRunningMotor.c,15 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
