
_main:

;PWMFixedSpeed.c,2 :: 		void main() {
;PWMFixedSpeed.c,3 :: 		int duty=0;
	CLRF       main_duty_L0+0
	CLRF       main_duty_L0+1
;PWMFixedSpeed.c,4 :: 		TRISB=0x00;
	CLRF       TRISB+0
;PWMFixedSpeed.c,5 :: 		PORTB=0x00;
	CLRF       PORTB+0
;PWMFixedSpeed.c,6 :: 		TRISC=0x00;
	CLRF       TRISC+0
;PWMFixedSpeed.c,7 :: 		PORTC=0x00;
	CLRF       PORTC+0
;PWMFixedSpeed.c,12 :: 		PWM1_INIT(2000);
	BSF        T2CON+0, 0
	BCF        T2CON+0, 1
	MOVLW      249
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;PWMFixedSpeed.c,13 :: 		TRISD=0xff;
	MOVLW      255
	MOVWF      TRISD+0
;PWMFixedSpeed.c,14 :: 		duty=250;
	MOVLW      250
	MOVWF      main_duty_L0+0
	CLRF       main_duty_L0+1
;PWMFixedSpeed.c,15 :: 		PWM1_START();
	CALL       _PWM1_Start+0
;PWMFixedSpeed.c,16 :: 		PWM1_SET_DUTY(duty);
	MOVF       main_duty_L0+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWMFixedSpeed.c,24 :: 		while(1){
L_main0:
;PWMFixedSpeed.c,60 :: 		portb.f0=1;
	BSF        PORTB+0, 0
;PWMFixedSpeed.c,61 :: 		portb.f1=0;
	BCF        PORTB+0, 1
;PWMFixedSpeed.c,62 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;PWMFixedSpeed.c,63 :: 		portb.f0=0;
	BCF        PORTB+0, 0
;PWMFixedSpeed.c,64 :: 		portb.f1=1;
	BSF        PORTB+0, 1
;PWMFixedSpeed.c,65 :: 		delay_ms(5000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
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
;PWMFixedSpeed.c,69 :: 		}
	GOTO       L_main0
;PWMFixedSpeed.c,71 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
