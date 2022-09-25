
_main:

;TwoDigitSevenSegAnodeButton.c,2 :: 		void main() {
;TwoDigitSevenSegAnodeButton.c,3 :: 		int i=0,j,leftDigit,rightDigit;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;TwoDigitSevenSegAnodeButton.c,4 :: 		TRISB=0x00;
	CLRF       TRISB+0
;TwoDigitSevenSegAnodeButton.c,5 :: 		PORTB=0x00;
	CLRF       PORTB+0
;TwoDigitSevenSegAnodeButton.c,6 :: 		TRISD=0x00;
	CLRF       TRISD+0
;TwoDigitSevenSegAnodeButton.c,7 :: 		PORTD=0x00;
	CLRF       PORTD+0
;TwoDigitSevenSegAnodeButton.c,9 :: 		while(1)
L_main0:
;TwoDigitSevenSegAnodeButton.c,11 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
;TwoDigitSevenSegAnodeButton.c,12 :: 		for(i=0;i<100;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main3:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;TwoDigitSevenSegAnodeButton.c,13 :: 		leftDigit=i/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      main_leftDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      main_leftDigit_L0+1
;TwoDigitSevenSegAnodeButton.c,14 :: 		rightDigit=i%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_rightDigit_L0+0
	MOVF       R0+1, 0
	MOVWF      main_rightDigit_L0+1
;TwoDigitSevenSegAnodeButton.c,16 :: 		for(j=0;j<50;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main6:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      50
	SUBWF      main_j_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;TwoDigitSevenSegAnodeButton.c,18 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;TwoDigitSevenSegAnodeButton.c,19 :: 		portb=CA[leftDigit];
	MOVF       main_leftDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigitSevenSegAnodeButton.c,20 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
;TwoDigitSevenSegAnodeButton.c,21 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;TwoDigitSevenSegAnodeButton.c,23 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;TwoDigitSevenSegAnodeButton.c,24 :: 		portb=CA[rightDigit];
	MOVF       main_rightDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigitSevenSegAnodeButton.c,25 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	NOP
;TwoDigitSevenSegAnodeButton.c,26 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;TwoDigitSevenSegAnodeButton.c,16 :: 		for(j=0;j<50;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;TwoDigitSevenSegAnodeButton.c,27 :: 		}
	GOTO       L_main6
L_main7:
;TwoDigitSevenSegAnodeButton.c,12 :: 		for(i=0;i<100;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;TwoDigitSevenSegAnodeButton.c,28 :: 		}
	GOTO       L_main3
L_main4:
;TwoDigitSevenSegAnodeButton.c,29 :: 		}
	GOTO       L_main0
;TwoDigitSevenSegAnodeButton.c,32 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
