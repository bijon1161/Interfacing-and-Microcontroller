
_main:

;TwoDigitSevenSegAnodeButton.c,3 :: 		void main() {
;TwoDigitSevenSegAnodeButton.c,4 :: 		int i=0,j,leftDigit,rightDigit;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;TwoDigitSevenSegAnodeButton.c,5 :: 		TRISB=0x00;
	CLRF       TRISB+0
;TwoDigitSevenSegAnodeButton.c,6 :: 		PORTB=0x00;
	CLRF       PORTB+0
;TwoDigitSevenSegAnodeButton.c,7 :: 		TRISD.f0=0x00;
	BCF        TRISD+0, 0
;TwoDigitSevenSegAnodeButton.c,8 :: 		TRISD.f1=0x00;
	BCF        TRISD+0, 1
;TwoDigitSevenSegAnodeButton.c,9 :: 		PORTD.f0=0x00;
	BCF        PORTD+0, 0
;TwoDigitSevenSegAnodeButton.c,10 :: 		PORTD.f1=0x00;
	BCF        PORTD+0, 1
;TwoDigitSevenSegAnodeButton.c,11 :: 		TRISD.F6=0xff;
	BSF        TRISD+0, 6
;TwoDigitSevenSegAnodeButton.c,12 :: 		TRISD.F7=0xff;
	BSF        TRISD+0, 7
;TwoDigitSevenSegAnodeButton.c,17 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;TwoDigitSevenSegAnodeButton.c,18 :: 		while(1){
L_main2:
;TwoDigitSevenSegAnodeButton.c,19 :: 		if(portd.f6==1){
	BTFSS      PORTD+0, 6
	GOTO       L_main4
;TwoDigitSevenSegAnodeButton.c,20 :: 		if(i<100)
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main17:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;TwoDigitSevenSegAnodeButton.c,21 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
L_main5:
;TwoDigitSevenSegAnodeButton.c,23 :: 		}
L_main4:
;TwoDigitSevenSegAnodeButton.c,24 :: 		if(portd.f7==1){
	BTFSS      PORTD+0, 7
	GOTO       L_main6
;TwoDigitSevenSegAnodeButton.c,25 :: 		if(i>0)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main18
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main18:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;TwoDigitSevenSegAnodeButton.c,26 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
L_main7:
;TwoDigitSevenSegAnodeButton.c,27 :: 		}
L_main6:
;TwoDigitSevenSegAnodeButton.c,28 :: 		leftDigit=i/10;
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
;TwoDigitSevenSegAnodeButton.c,29 :: 		rightDigit=i%10;
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
;TwoDigitSevenSegAnodeButton.c,31 :: 		for(j=0;j<5;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main8:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main19
	MOVLW      5
	SUBWF      main_j_L0+0, 0
L__main19:
	BTFSC      STATUS+0, 0
	GOTO       L_main9
;TwoDigitSevenSegAnodeButton.c,33 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	NOP
;TwoDigitSevenSegAnodeButton.c,34 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;TwoDigitSevenSegAnodeButton.c,35 :: 		portb=CA[leftDigit];
	MOVF       main_leftDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigitSevenSegAnodeButton.c,36 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;TwoDigitSevenSegAnodeButton.c,37 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;TwoDigitSevenSegAnodeButton.c,39 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;TwoDigitSevenSegAnodeButton.c,40 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;TwoDigitSevenSegAnodeButton.c,41 :: 		portb=CA[rightDigit];
	MOVF       main_rightDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;TwoDigitSevenSegAnodeButton.c,42 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
;TwoDigitSevenSegAnodeButton.c,43 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;TwoDigitSevenSegAnodeButton.c,44 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	NOP
;TwoDigitSevenSegAnodeButton.c,31 :: 		for(j=0;j<5;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;TwoDigitSevenSegAnodeButton.c,45 :: 		}
	GOTO       L_main8
L_main9:
;TwoDigitSevenSegAnodeButton.c,46 :: 		}
	GOTO       L_main2
;TwoDigitSevenSegAnodeButton.c,50 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
