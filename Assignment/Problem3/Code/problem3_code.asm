
_StartSignal:

;problem3_code.c,27 :: 		void StartSignal()
;problem3_code.c,29 :: 		DataDir = 0;     // Data port is output
	BCF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;problem3_code.c,30 :: 		Data    = 0;
	BCF        RD0_bit+0, BitPos(RD0_bit+0)
;problem3_code.c,31 :: 		Delay_ms(25);
	MOVLW      65
	MOVWF      R12+0
	MOVLW      238
	MOVWF      R13+0
L_StartSignal0:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal0
	DECFSZ     R12+0, 1
	GOTO       L_StartSignal0
	NOP
;problem3_code.c,32 :: 		Data    = 1;
	BSF        RD0_bit+0, BitPos(RD0_bit+0)
;problem3_code.c,33 :: 		Delay_us(30);
	MOVLW      19
	MOVWF      R13+0
L_StartSignal1:
	DECFSZ     R13+0, 1
	GOTO       L_StartSignal1
	NOP
	NOP
;problem3_code.c,34 :: 		DataDir = 1;     // Data port is input
	BSF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;problem3_code.c,35 :: 		}
L_end_StartSignal:
	RETURN
; end of _StartSignal

_CheckResponse:

;problem3_code.c,36 :: 		unsigned short CheckResponse()
;problem3_code.c,38 :: 		TOUT = 0;
	CLRF       _TOUT+0
;problem3_code.c,39 :: 		TMR2 = 0;
	CLRF       TMR2+0
;problem3_code.c,40 :: 		T2CON.TMR2ON = 1;      // start timer
	BSF        T2CON+0, 2
;problem3_code.c,41 :: 		while(!Data && !TOUT);
L_CheckResponse2:
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_CheckResponse3
	MOVF       _TOUT+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_CheckResponse3
L__CheckResponse35:
	GOTO       L_CheckResponse2
L_CheckResponse3:
;problem3_code.c,42 :: 		if (TOUT) return 0;
	MOVF       _TOUT+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CheckResponse6
	CLRF       R0+0
	GOTO       L_end_CheckResponse
L_CheckResponse6:
;problem3_code.c,45 :: 		TMR2 = 0;
	CLRF       TMR2+0
;problem3_code.c,46 :: 		while(Data && !TOUT);
L_CheckResponse8:
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_CheckResponse9
	MOVF       _TOUT+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_CheckResponse9
L__CheckResponse34:
	GOTO       L_CheckResponse8
L_CheckResponse9:
;problem3_code.c,47 :: 		if (TOUT) return 0;
	MOVF       _TOUT+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_CheckResponse12
	CLRF       R0+0
	GOTO       L_end_CheckResponse
L_CheckResponse12:
;problem3_code.c,50 :: 		T2CON.TMR2ON = 0;
	BCF        T2CON+0, 2
;problem3_code.c,51 :: 		return 1;
	MOVLW      1
	MOVWF      R0+0
;problem3_code.c,54 :: 		}
L_end_CheckResponse:
	RETURN
; end of _CheckResponse

_ReadByte:

;problem3_code.c,55 :: 		unsigned short ReadByte()
;problem3_code.c,57 :: 		unsigned short num = 0, t;
	CLRF       ReadByte_num_L0+0
;problem3_code.c,58 :: 		DataDir = 1;
	BSF        TRISD0_bit+0, BitPos(TRISD0_bit+0)
;problem3_code.c,59 :: 		for (i=0; i<8; i++)
	CLRF       _i+0
L_ReadByte14:
	MOVLW      8
	SUBWF      _i+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_ReadByte15
;problem3_code.c,61 :: 		while(!Data);
L_ReadByte17:
	BTFSC      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_ReadByte18
	GOTO       L_ReadByte17
L_ReadByte18:
;problem3_code.c,62 :: 		Delay_us(40);
	MOVLW      26
	MOVWF      R13+0
L_ReadByte19:
	DECFSZ     R13+0, 1
	GOTO       L_ReadByte19
	NOP
;problem3_code.c,63 :: 		if(Data) num |= 1<<(7-i);
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_ReadByte20
	MOVF       _i+0, 0
	SUBLW      7
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      R1+0
	MOVLW      1
	MOVWF      R0+0
	MOVF       R1+0, 0
L__ReadByte39:
	BTFSC      STATUS+0, 2
	GOTO       L__ReadByte40
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__ReadByte39
L__ReadByte40:
	MOVF       R0+0, 0
	IORWF      ReadByte_num_L0+0, 1
L_ReadByte20:
;problem3_code.c,64 :: 		while(Data);
L_ReadByte21:
	BTFSS      RD0_bit+0, BitPos(RD0_bit+0)
	GOTO       L_ReadByte22
	GOTO       L_ReadByte21
L_ReadByte22:
;problem3_code.c,59 :: 		for (i=0; i<8; i++)
	INCF       _i+0, 1
;problem3_code.c,65 :: 		}
	GOTO       L_ReadByte14
L_ReadByte15:
;problem3_code.c,66 :: 		return num;
	MOVF       ReadByte_num_L0+0, 0
	MOVWF      R0+0
;problem3_code.c,67 :: 		}
L_end_ReadByte:
	RETURN
; end of _ReadByte

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;problem3_code.c,68 :: 		void Interrupt() iv 0x0004 ics ICS_AUTO
;problem3_code.c,70 :: 		if(PIR1.TMR2IF)
	BTFSS      PIR1+0, 1
	GOTO       L_Interrupt23
;problem3_code.c,72 :: 		TOUT = 1;
	MOVLW      1
	MOVWF      _TOUT+0
;problem3_code.c,73 :: 		T2CON.TMR2ON = 0; // stop timer
	BCF        T2CON+0, 2
;problem3_code.c,74 :: 		PIR1.TMR2IF  = 0; // Clear TMR0 interrupt flag
	BCF        PIR1+0, 1
;problem3_code.c,75 :: 		}
L_Interrupt23:
;problem3_code.c,76 :: 		}
L_end_Interrupt:
L__Interrupt42:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;problem3_code.c,77 :: 		void main() {
;problem3_code.c,79 :: 		TRISB=0x00;
	CLRF       TRISB+0
;problem3_code.c,80 :: 		TRISA=0xff;
	MOVLW      255
	MOVWF      TRISA+0
;problem3_code.c,81 :: 		TRISD.f0=0x00;
	BCF        TRISD+0, 0
;problem3_code.c,82 :: 		TRISD.f6=0x00;
	BCF        TRISD+0, 6
;problem3_code.c,83 :: 		TRISD.f7=0xff;
	BSF        TRISD+0, 7
;problem3_code.c,84 :: 		PORTD=0x00;
	CLRF       PORTD+0
;problem3_code.c,85 :: 		h=2;
	MOVLW      2
	MOVWF      _h+0
	MOVLW      0
	MOVWF      _h+1
;problem3_code.c,87 :: 		TRISD.f0 = 0b00000010;
	BCF        TRISD+0, 0
;problem3_code.c,88 :: 		PORTD.f0 = 0;
	BCF        PORTD+0, 0
;problem3_code.c,89 :: 		CMCON = 7;// comparator off
	MOVLW      7
	MOVWF      CMCON+0
;problem3_code.c,90 :: 		ADCON1 = 0x07;// ADC off
	MOVLW      7
	MOVWF      ADCON1+0
;problem3_code.c,92 :: 		INTCON.GIE = 1;    //Enable global interrupt
	BSF        INTCON+0, 7
;problem3_code.c,93 :: 		INTCON.PEIE = 1;   //Enable peripheral interrupt
	BSF        INTCON+0, 6
;problem3_code.c,95 :: 		PIE1.TMR2IE = 1;  // Enable Timer2 interrupt
	BSF        PIE1+0, 1
;problem3_code.c,96 :: 		T2CON = 0;        // Prescaler 1:1, and Timer2 is off initially
	CLRF       T2CON+0
;problem3_code.c,97 :: 		PIR1.TMR2IF =0;   // Clear TMR INT Flag bit
	BCF        PIR1+0, 1
;problem3_code.c,98 :: 		TMR2 = 0;
	CLRF       TMR2+0
;problem3_code.c,101 :: 		UART1_init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;problem3_code.c,102 :: 		LCD_init();
	CALL       _Lcd_Init+0
;problem3_code.c,104 :: 		LCD_cmd(_lcd_clear);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem3_code.c,105 :: 		LCD_cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem3_code.c,106 :: 		portd.f6=0;
	BCF        PORTD+0, 6
;problem3_code.c,107 :: 		while(1){
L_main24:
;problem3_code.c,110 :: 		gas_value=portd.f7;
	MOVLW      0
	BTFSC      PORTD+0, 7
	MOVLW      1
	MOVWF      _gas_value+0
	CLRF       _gas_value+1
;problem3_code.c,111 :: 		IntToStr(gas_value,x);
	MOVF       _gas_value+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _gas_value+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _x+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;problem3_code.c,112 :: 		UART1_Write_text("Gas value= ");
	MOVLW      ?lstr1_problem3_code+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;problem3_code.c,113 :: 		UART1_Write_text(x);
	MOVLW      _x+0
	MOVWF      FARG_UART1_Write_Text_uart_text+0
	CALL       _UART1_Write_Text+0
;problem3_code.c,114 :: 		UART1_Write(13);
	MOVLW      13
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;problem3_code.c,115 :: 		if(portd.f7>=1)
	CLRF       R1+0
	BTFSC      PORTD+0, 7
	INCF       R1+0, 1
	MOVLW      1
	SUBWF      R1+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main26
;problem3_code.c,117 :: 		portd.f6=1;
	BSF        PORTD+0, 6
;problem3_code.c,118 :: 		}
	GOTO       L_main27
L_main26:
;problem3_code.c,121 :: 		portd.f6=0;
	BCF        PORTD+0, 6
;problem3_code.c,122 :: 		}
L_main27:
;problem3_code.c,129 :: 		PIE1.TMR2IE = 1;  // Enable Timer2 interrupt
	BSF        PIE1+0, 1
;problem3_code.c,130 :: 		ADCON1 = 0x07; // all digital selected
	MOVLW      7
	MOVWF      ADCON1+0
;problem3_code.c,131 :: 		StartSignal();
	CALL       _StartSignal+0
;problem3_code.c,132 :: 		check = CheckResponse();
	CALL       _CheckResponse+0
;problem3_code.c,133 :: 		if (!check)
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main28
;problem3_code.c,135 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem3_code.c,136 :: 		Lcd_Out(1, 1, "No response");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,137 :: 		Lcd_Out(2, 1, "from the sensor");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,138 :: 		}
	GOTO       L_main29
L_main28:
;problem3_code.c,141 :: 		RH_Byte1 = ReadByte();
	CALL       _ReadByte+0
	MOVF       R0+0, 0
	MOVWF      _RH_Byte1+0
	CLRF       _RH_Byte1+1
;problem3_code.c,142 :: 		RH_Byte2 = ReadByte();
	CALL       _ReadByte+0
	MOVF       R0+0, 0
	MOVWF      _RH_Byte2+0
	CLRF       _RH_Byte2+1
;problem3_code.c,143 :: 		T_Byte1 = ReadByte();
	CALL       _ReadByte+0
	MOVF       R0+0, 0
	MOVWF      _T_Byte1+0
	CLRF       _T_Byte1+1
;problem3_code.c,144 :: 		T_Byte2 = ReadByte();
	CALL       _ReadByte+0
	MOVF       R0+0, 0
	MOVWF      _T_Byte2+0
	CLRF       _T_Byte2+1
;problem3_code.c,145 :: 		CheckSum = ReadByte();
	CALL       _ReadByte+0
	MOVF       R0+0, 0
	MOVWF      _CheckSum+0
;problem3_code.c,147 :: 		if (CheckSum == ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF))
	MOVF       _RH_Byte2+0, 0
	ADDWF      _RH_Byte1+0, 0
	MOVWF      R1+0
	MOVF       _RH_Byte1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      _RH_Byte2+1, 0
	MOVWF      R1+1
	MOVF       _T_Byte1+0, 0
	ADDWF      R1+0, 1
	MOVF       _T_Byte1+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVF       _T_Byte2+0, 0
	ADDWF      R1+0, 1
	MOVF       _T_Byte2+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDWF      R1+1, 1
	MOVLW      255
	ANDWF      R1+0, 0
	MOVWF      R3+0
	MOVF       R1+1, 0
	MOVWF      R3+1
	MOVLW      0
	ANDWF      R3+1, 1
	MOVLW      0
	XORWF      R3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main44
	MOVF       R3+0, 0
	XORWF      R0+0, 0
L__main44:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
;problem3_code.c,149 :: 		Lcd_Out(1,1,"HUMIDITY:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,150 :: 		Lcd_Out(2,1,"TEMP:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,152 :: 		message[0] = RH_Byte1/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _RH_Byte1+0, 0
	MOVWF      R0+0
	MOVF       _RH_Byte1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+0
;problem3_code.c,153 :: 		message[1] = RH_Byte1%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _RH_Byte1+0, 0
	MOVWF      R0+0
	MOVF       _RH_Byte1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+1
;problem3_code.c,154 :: 		message[3] = RH_Byte2%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _RH_Byte2+0, 0
	MOVWF      R0+0
	MOVF       _RH_Byte2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+3
;problem3_code.c,155 :: 		Lcd_Out(1,11, message);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,156 :: 		Lcd_Out(1,16,"%");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,158 :: 		message[0] = T_Byte1/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _T_Byte1+0, 0
	MOVWF      R0+0
	MOVF       _T_Byte1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+0
;problem3_code.c,159 :: 		message[1] = T_Byte1%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _T_Byte1+0, 0
	MOVWF      R0+0
	MOVF       _T_Byte1+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+1
;problem3_code.c,160 :: 		message[3] = T_Byte2%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _T_Byte2+0, 0
	MOVWF      R0+0
	MOVF       _T_Byte2+1, 0
	MOVWF      R0+1
	CALL       _Div_16X16_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _message+3
;problem3_code.c,161 :: 		Lcd_Out(2,11, message);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      11
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _message+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,162 :: 		Lcd_Chr_CP(223);
	MOVLW      223
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;problem3_code.c,163 :: 		Lcd_Out(2,16,"C");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,165 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main31:
	DECFSZ     R13+0, 1
	GOTO       L_main31
	DECFSZ     R12+0, 1
	GOTO       L_main31
	DECFSZ     R11+0, 1
	GOTO       L_main31
	NOP
;problem3_code.c,166 :: 		}
	GOTO       L_main32
L_main30:
;problem3_code.c,169 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;problem3_code.c,170 :: 		Lcd_Out(1, 1, "Checksum Error!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,171 :: 		Lcd_Out(2, 1, "Trying Again...");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_problem3_code+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;problem3_code.c,172 :: 		}
L_main32:
;problem3_code.c,173 :: 		}
L_main29:
;problem3_code.c,174 :: 		PIE1.TMR2IE = 0;  // disable Timer2 interrupt
	BCF        PIE1+0, 1
;problem3_code.c,176 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main33:
	DECFSZ     R13+0, 1
	GOTO       L_main33
	DECFSZ     R12+0, 1
	GOTO       L_main33
	DECFSZ     R11+0, 1
	GOTO       L_main33
	NOP
	NOP
;problem3_code.c,177 :: 		}
	GOTO       L_main24
;problem3_code.c,179 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
