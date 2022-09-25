
_main:

;TemparatureSensorLCD.c,21 :: 		void main() {
;TemparatureSensorLCD.c,22 :: 		TRISB=0x00;
	CLRF       TRISB+0
;TemparatureSensorLCD.c,23 :: 		TRISA=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;TemparatureSensorLCD.c,24 :: 		adcon1=0x80;
	MOVLW      128
	MOVWF      ADCON1+0
;TemparatureSensorLCD.c,27 :: 		LCD_init();
	CALL       _Lcd_Init+0
;TemparatureSensorLCD.c,28 :: 		ADC_init();
	CALL       _ADC_Init+0
;TemparatureSensorLCD.c,29 :: 		LCD_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TemparatureSensorLCD.c,30 :: 		LCD_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;TemparatureSensorLCD.c,32 :: 		while(1){
L_main0:
;TemparatureSensorLCD.c,33 :: 		result=ADC_read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _result+0
	MOVF       R0+1, 0
	MOVWF      _result+1
;TemparatureSensorLCD.c,34 :: 		volt=result*4.88;
	CALL       _int2double+0
	MOVLW      246
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _volt+0
	MOVF       R0+1, 0
	MOVWF      _volt+1
	MOVF       R0+2, 0
	MOVWF      _volt+2
	MOVF       R0+3, 0
	MOVWF      _volt+3
;TemparatureSensorLCD.c,35 :: 		temp=volt/10;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _temp+0
	MOVF       R0+1, 0
	MOVWF      _temp+1
	MOVF       R0+2, 0
	MOVWF      _temp+2
	MOVF       R0+3, 0
	MOVWF      _temp+3
;TemparatureSensorLCD.c,37 :: 		LCD_out(1,1,"Temp= ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_TemparatureSensorLCD+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;TemparatureSensorLCD.c,39 :: 		floattostr(temp,display);
	MOVF       _temp+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       _temp+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       _temp+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       _temp+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _display+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;TemparatureSensorLCD.c,41 :: 		LCD_out_cp(display);
	MOVLW      _display+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;TemparatureSensorLCD.c,42 :: 		LCD_chr(1,16,223);
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;TemparatureSensorLCD.c,43 :: 		LCD_out_cp(" C");
	MOVLW      ?lstr2_TemparatureSensorLCD+0
	MOVWF      FARG_Lcd_Out_CP_text+0
	CALL       _Lcd_Out_CP+0
;TemparatureSensorLCD.c,44 :: 		delay_ms(1000);
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
;TemparatureSensorLCD.c,45 :: 		}
	GOTO       L_main0
;TemparatureSensorLCD.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
