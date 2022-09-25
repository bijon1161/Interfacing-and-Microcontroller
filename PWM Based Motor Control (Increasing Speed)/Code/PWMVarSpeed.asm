
_main:

;PWMVarSpeed.c,2 :: 		void main() {
;PWMVarSpeed.c,3 :: 		int duty=0;
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
;PWMVarSpeed.c,4 :: 		TRISB=0x00;
	CLRF       TRISB+0
;PWMVarSpeed.c,5 :: 		PORTB=0x00;
	CLRF       PORTB+0
;PWMVarSpeed.c,6 :: 		TRISC=0x00;
	CLRF       TRISC+0
;PWMVarSpeed.c,7 :: 		PORTC=0x00;
	CLRF       PORTC+0
;PWMVarSpeed.c,12 :: 		PWM1_INIT(2000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWMVarSpeed.c,13 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;PWMVarSpeed.c,15 :: 		PWM1_START();
	CALL       _PWM1_Start+0
;PWMVarSpeed.c,16 :: 		PWM1_SET_DUTY(duty);
	MOVF       main_duty_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWMVarSpeed.c,18 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;PWMVarSpeed.c,19 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;PWMVarSpeed.c,24 :: 		while(1){
L_main0:
;PWMVarSpeed.c,28 :: 		if(portd.f0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main2
;PWMVarSpeed.c,30 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
;PWMVarSpeed.c,33 :: 		if(duty<250)
	MOVLW      128
	XORWF      main_duty_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main9
	MOVLW      250
	SUBWF      main_duty_L0+0, 0
L__main9:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;PWMVarSpeed.c,36 :: 		duty=duty+10;
	MOVLW      10
	ADDWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVF       main_duty_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
	MOVF       R0+1, 0
	MOVWF      main_duty_L0+1
;PWMVarSpeed.c,37 :: 		PWM1_SET_DUTY(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWMVarSpeed.c,39 :: 		}
L_main4:
;PWMVarSpeed.c,40 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;PWMVarSpeed.c,42 :: 		}
L_main2:
;PWMVarSpeed.c,43 :: 		if(portd.f1==1)
	BTFSS      PORTD+0, 1
	GOTO       L_main5
;PWMVarSpeed.c,45 :: 		delay_ms(200);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      8
	MOVWF      R12+0
	MOVLW      119
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
;PWMVarSpeed.c,47 :: 		if(duty>=10)
	MOVLW      128
	XORWF      main_duty_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVLW      10
	SUBWF      main_duty_L0+0, 0
L__main10:
	BTFSS      STATUS+0, 0
	GOTO       L_main7
;PWMVarSpeed.c,50 :: 		duty=duty-10;
	MOVLW      10
	SUBWF      main_duty_L0+0, 0
	MOVWF      R0+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_duty_L0+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_duty_L0+0
	MOVF       R0+1, 0
	MOVWF      main_duty_L0+1
;PWMVarSpeed.c,51 :: 		PWM1_SET_DUTY(duty);
	MOVF       R0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWMVarSpeed.c,53 :: 		}
L_main7:
;PWMVarSpeed.c,55 :: 		portc.f0=1;
	BSF        PORTC+0, 0
;PWMVarSpeed.c,56 :: 		}
L_main5:
;PWMVarSpeed.c,61 :: 		}
	GOTO       L_main0
;PWMVarSpeed.c,63 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
