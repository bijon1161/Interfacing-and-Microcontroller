//led module connections
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;

sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;
 // End LCD module connections
sbit Data at RD0_bit;
sbit DataDir at TRISD0_bit;

int gas_value,h;
char display[16];
char x[4];

char message[] = "00.0";
unsigned short TOUT = 0, CheckSum, i;
unsigned int humidity,value;
unsigned int T_Byte1, T_Byte2, RH_Byte1, RH_Byte2;
void StartSignal()
{
  DataDir = 0;     // Data port is output
  Data    = 0;
  Delay_ms(25);
  Data    = 1;
  Delay_us(30);
  DataDir = 1;     // Data port is input
}
unsigned short CheckResponse()
{
  TOUT = 0;
  TMR2 = 0;
  T2CON.TMR2ON = 1;      // start timer
  while(!Data && !TOUT);
  if (TOUT) return 0;
  else
  {
     TMR2 = 0;
     while(Data && !TOUT);
     if (TOUT) return 0;
     else
     {
        T2CON.TMR2ON = 0;
        return 1;
     }
  }
}
unsigned short ReadByte()
{
  unsigned short num = 0, t;
  DataDir = 1;
  for (i=0; i<8; i++)
  {
    while(!Data);
    Delay_us(40);
    if(Data) num |= 1<<(7-i);
    while(Data);
  }
  return num;
}
void Interrupt() iv 0x0004 ics ICS_AUTO
{
  if(PIR1.TMR2IF)
  {
     TOUT = 1;
     T2CON.TMR2ON = 0; // stop timer
     PIR1.TMR2IF  = 0; // Clear TMR0 interrupt flag
  }
}
void main() {
    unsigned short check;
    TRISB=0x00;
    TRISA=0xff;
    TRISD.f0=0x00;
    TRISD.f6=0x00;
    TRISD.f7=0xff;
    PORTD=0x00;
     h=2;
  //adcon1=0x80;
  TRISD.f0 = 0b00000010;
  PORTD.f0 = 0;
  CMCON = 7;// comparator off
  ADCON1 = 0x07;// ADC off

  INTCON.GIE = 1;    //Enable global interrupt
  INTCON.PEIE = 1;   //Enable peripheral interrupt
  // Configure Timer2 module
  PIE1.TMR2IE = 1;  // Enable Timer2 interrupt
  T2CON = 0;        // Prescaler 1:1, and Timer2 is off initially
  PIR1.TMR2IF =0;   // Clear TMR INT Flag bit
  TMR2 = 0;


    UART1_init(9600);
    LCD_init();
   // ADC_init();
    LCD_cmd(_lcd_clear);
    LCD_cmd(_LCD_CURSOR_OFF);
    portd.f6=0;
    while(1){

         //gas sensor
         gas_value=portd.f7;
         IntToStr(gas_value,x);
         UART1_Write_text("Gas value= ");
         UART1_Write_text(x);
         UART1_Write(13);
         if(portd.f7>=1)
         {
           portd.f6=1;
         }
         else
         {
             portd.f6=0;
         }

        //temperature and humidity
        // temp_result=ADC_read(0);
        // volt=temp_result*4.88;
        // temp=volt/10;

    PIE1.TMR2IE = 1;  // Enable Timer2 interrupt
    ADCON1 = 0x07; // all digital selected
    StartSignal();
    check = CheckResponse();
    if (!check)
    {
       Lcd_Cmd(_LCD_CLEAR);
       Lcd_Out(1, 1, "No response");
       Lcd_Out(2, 1, "from the sensor");
    }
    else
    {
       RH_Byte1 = ReadByte();
       RH_Byte2 = ReadByte();
       T_Byte1 = ReadByte();
       T_Byte2 = ReadByte();
       CheckSum = ReadByte();
       // Check for error in Data reception
       if (CheckSum == ((RH_Byte1 + RH_Byte2 + T_Byte1 + T_Byte2) & 0xFF))
       {
          Lcd_Out(1,1,"HUMIDITY:");
          Lcd_Out(2,1,"TEMP:");

          message[0] = RH_Byte1/10 + 48;
          message[1] = RH_Byte1%10 + 48;
          message[3] = RH_Byte2%10 + 48;
          Lcd_Out(1,11, message);
          Lcd_Out(1,16,"%");

          message[0] = T_Byte1/10 + 48;
          message[1] = T_Byte1%10 + 48;
          message[3] = T_Byte2%10 + 48;
          Lcd_Out(2,11, message);
          Lcd_Chr_CP(223);
          Lcd_Out(2,16,"C");

          Delay_ms(2000);
       }
       else
       {
           Lcd_Cmd(_LCD_CLEAR);
           Lcd_Out(1, 1, "Checksum Error!");
           Lcd_Out(2, 1, "Trying Again...");
       }
    }
    PIE1.TMR2IE = 0;  // disable Timer2 interrupt

           delay_ms(1000);
         }

    }