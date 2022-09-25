
_main:

;Problem_1_code.c,3 :: 		void main() {
;Problem_1_code.c,4 :: 		int i=0,j,leftDigit,rightDigit,countP=0,countR=0,stage=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_countP_L0+0
	CLRF       main_countP_L0+1
	CLRF       main_countR_L0+0
	CLRF       main_countR_L0+1
	CLRF       main_stage_L0+0
	CLRF       main_stage_L0+1
;Problem_1_code.c,5 :: 		TRISA=0x00;
	CLRF       TRISA+0
;Problem_1_code.c,6 :: 		PORTA=0x00;
	CLRF       PORTA+0
;Problem_1_code.c,7 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Problem_1_code.c,8 :: 		PORTB=0x00;
	CLRF       PORTB+0
;Problem_1_code.c,9 :: 		TRISC=0xFF;
	MOVLW      255
	MOVWF      TRISC+0
;Problem_1_code.c,10 :: 		TRISD.F0=0x00;
	BCF        TRISD+0, 0
;Problem_1_code.c,11 :: 		TRISD.F1=0x00;
	BCF        TRISD+0, 1
;Problem_1_code.c,12 :: 		TRISD.F6=0xff;
	BSF        TRISD+0, 6
;Problem_1_code.c,13 :: 		TRISD.F7=0xff;
	BSF        TRISD+0, 7
;Problem_1_code.c,14 :: 		PORTD=0x00;
	CLRF       PORTD+0
;Problem_1_code.c,15 :: 		portc.f0=0;
	BCF        PORTC+0, 0
;Problem_1_code.c,17 :: 		while(1)
L_main0:
;Problem_1_code.c,19 :: 		if(portc.f0==1)
	BTFSS      PORTC+0, 0
	GOTO       L_main2
;Problem_1_code.c,21 :: 		porta.f1=0;
	BCF        PORTA+0, 1
;Problem_1_code.c,22 :: 		porta.f2=0;
	BCF        PORTA+0, 2
;Problem_1_code.c,23 :: 		porta.f3=0;
	BCF        PORTA+0, 3
;Problem_1_code.c,24 :: 		stage=1;
	MOVLW      1
	MOVWF      main_stage_L0+0
	MOVLW      0
	MOVWF      main_stage_L0+1
;Problem_1_code.c,26 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Problem_1_code.c,27 :: 		while(1){
L_main3:
;Problem_1_code.c,31 :: 		if(portd.f6==1){
	BTFSS      PORTD+0, 6
	GOTO       L_main5
;Problem_1_code.c,32 :: 		if(i<100) {
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main43
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main43:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Problem_1_code.c,33 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Problem_1_code.c,34 :: 		countP++;
	INCF       main_countP_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_countP_L0+1, 1
;Problem_1_code.c,35 :: 		}
L_main6:
;Problem_1_code.c,36 :: 		}
L_main5:
;Problem_1_code.c,37 :: 		if(portd.f7==1){
	BTFSS      PORTD+0, 7
	GOTO       L_main7
;Problem_1_code.c,38 :: 		if(i>0) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main44:
	BTFSC      STATUS+0, 0
	GOTO       L_main8
;Problem_1_code.c,39 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;Problem_1_code.c,40 :: 		countP--;
	MOVLW      1
	SUBWF      main_countP_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_countP_L0+1, 1
;Problem_1_code.c,41 :: 		}
L_main8:
;Problem_1_code.c,42 :: 		}
L_main7:
;Problem_1_code.c,45 :: 		leftDigit=i/10;
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
;Problem_1_code.c,46 :: 		rightDigit=i%10;
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
;Problem_1_code.c,47 :: 		for(j=0;j<50;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main9:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      50
	SUBWF      main_j_L0+0, 0
L__main45:
	BTFSC      STATUS+0, 0
	GOTO       L_main10
;Problem_1_code.c,49 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Problem_1_code.c,50 :: 		portb=CA[leftDigit];
	MOVF       main_leftDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,51 :: 		delay_ms(10);
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
;Problem_1_code.c,52 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Problem_1_code.c,54 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Problem_1_code.c,55 :: 		portb=CA[rightDigit];
	MOVF       main_rightDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,56 :: 		delay_ms(10);
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
;Problem_1_code.c,57 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Problem_1_code.c,47 :: 		for(j=0;j<50;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;Problem_1_code.c,60 :: 		}
	GOTO       L_main9
L_main10:
;Problem_1_code.c,61 :: 		if(portc.f0==0)
	BTFSC      PORTC+0, 0
	GOTO       L_main14
;Problem_1_code.c,63 :: 		break;
	GOTO       L_main4
;Problem_1_code.c,64 :: 		}
L_main14:
;Problem_1_code.c,65 :: 		}
	GOTO       L_main3
L_main4:
;Problem_1_code.c,67 :: 		}
	GOTO       L_main15
L_main2:
;Problem_1_code.c,68 :: 		else if(portc.f0==0)
	BTFSC      PORTC+0, 0
	GOTO       L_main16
;Problem_1_code.c,71 :: 		leftDigit=0;
	CLRF       main_leftDigit_L0+0
	CLRF       main_leftDigit_L0+1
;Problem_1_code.c,72 :: 		rightDigit=0;
	CLRF       main_rightDigit_L0+0
	CLRF       main_rightDigit_L0+1
;Problem_1_code.c,73 :: 		portb=CA[0];
	MOVF       _CA+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,74 :: 		for(j=0;j<50;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main17:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVLW      50
	SUBWF      main_j_L0+0, 0
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main18
;Problem_1_code.c,76 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Problem_1_code.c,77 :: 		portb=CA[0];
	MOVF       _CA+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,78 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	NOP
;Problem_1_code.c,79 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Problem_1_code.c,81 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Problem_1_code.c,82 :: 		portb=CA[0];
	MOVF       _CA+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,83 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	NOP
;Problem_1_code.c,84 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Problem_1_code.c,74 :: 		for(j=0;j<50;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;Problem_1_code.c,85 :: 		}
	GOTO       L_main17
L_main18:
;Problem_1_code.c,86 :: 		i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Problem_1_code.c,87 :: 		j=0;
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
;Problem_1_code.c,88 :: 		porta.f1=1;
	BSF        PORTA+0, 1
;Problem_1_code.c,89 :: 		while(1){
L_main22:
;Problem_1_code.c,93 :: 		if(portd.f6==1){
	BTFSS      PORTD+0, 6
	GOTO       L_main24
;Problem_1_code.c,94 :: 		if(i<100) {
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      100
	SUBWF      main_i_L0+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main25
;Problem_1_code.c,95 :: 		i++;
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Problem_1_code.c,96 :: 		countR++;
	INCF       main_countR_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_countR_L0+1, 1
;Problem_1_code.c,97 :: 		}
L_main25:
;Problem_1_code.c,98 :: 		}
L_main24:
;Problem_1_code.c,99 :: 		if(portd.f7==1){
	BTFSS      PORTD+0, 7
	GOTO       L_main26
;Problem_1_code.c,100 :: 		if(i>0) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      main_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       main_i_L0+0, 0
	SUBLW      0
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;Problem_1_code.c,101 :: 		i--;
	MOVLW      1
	SUBWF      main_i_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_i_L0+1, 1
;Problem_1_code.c,102 :: 		countR--;
	MOVLW      1
	SUBWF      main_countR_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_countR_L0+1, 1
;Problem_1_code.c,103 :: 		}
L_main27:
;Problem_1_code.c,104 :: 		}
L_main26:
;Problem_1_code.c,107 :: 		leftDigit=i/10;
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
;Problem_1_code.c,108 :: 		rightDigit=i%10;
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
;Problem_1_code.c,109 :: 		for(j=0;j<50;j++)
	CLRF       main_j_L0+0
	CLRF       main_j_L0+1
L_main28:
	MOVLW      128
	XORWF      main_j_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      50
	SUBWF      main_j_L0+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main29
;Problem_1_code.c,111 :: 		portd.f0=1;
	BSF        PORTD+0, 0
;Problem_1_code.c,112 :: 		portb=CA[leftDigit];
	MOVF       main_leftDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,113 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	NOP
;Problem_1_code.c,114 :: 		portd.f0=0;
	BCF        PORTD+0, 0
;Problem_1_code.c,116 :: 		portd.f1=1;
	BSF        PORTD+0, 1
;Problem_1_code.c,117 :: 		portb=CA[rightDigit];
	MOVF       main_rightDigit_L0+0, 0
	ADDLW      _CA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTB+0
;Problem_1_code.c,118 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	NOP
;Problem_1_code.c,119 :: 		portd.f1=0;
	BCF        PORTD+0, 1
;Problem_1_code.c,109 :: 		for(j=0;j<50;j++)
	INCF       main_j_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_j_L0+1, 1
;Problem_1_code.c,122 :: 		}
	GOTO       L_main28
L_main29:
;Problem_1_code.c,124 :: 		if(countP==countR && stage==1)
	MOVF       main_countP_L0+1, 0
	XORWF      main_countR_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVF       main_countR_L0+0, 0
	XORWF      main_countP_L0+0, 0
L__main50:
	BTFSS      STATUS+0, 2
	GOTO       L_main35
	MOVLW      0
	XORWF      main_stage_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      1
	XORWF      main_stage_L0+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L_main35
L__main41:
;Problem_1_code.c,126 :: 		porta.f1=0;
	BCF        PORTA+0, 1
;Problem_1_code.c,127 :: 		porta.f2=1;
	BSF        PORTA+0, 2
;Problem_1_code.c,128 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
;Problem_1_code.c,129 :: 		porta.f2=0;
	BCF        PORTA+0, 2
;Problem_1_code.c,130 :: 		porta.f3=1;
	BSF        PORTA+0, 3
;Problem_1_code.c,131 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
;Problem_1_code.c,132 :: 		porta.f3=0;
	BCF        PORTA+0, 3
;Problem_1_code.c,133 :: 		porta.f1=1;
	BSF        PORTA+0, 1
;Problem_1_code.c,134 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
;Problem_1_code.c,135 :: 		}
	GOTO       L_main39
L_main35:
;Problem_1_code.c,137 :: 		porta.f1=1;
	BSF        PORTA+0, 1
;Problem_1_code.c,138 :: 		}
L_main39:
;Problem_1_code.c,139 :: 		if(portc.f0==1)
	BTFSS      PORTC+0, 0
	GOTO       L_main40
;Problem_1_code.c,141 :: 		break;
	GOTO       L_main23
;Problem_1_code.c,142 :: 		}
L_main40:
;Problem_1_code.c,144 :: 		}
	GOTO       L_main22
L_main23:
;Problem_1_code.c,149 :: 		}
L_main16:
L_main15:
;Problem_1_code.c,152 :: 		}
	GOTO       L_main0
;Problem_1_code.c,156 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
