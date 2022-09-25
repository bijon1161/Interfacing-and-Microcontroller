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

float temp,volt;
int result ;
char display[16];

void main() {
    TRISB=0x00;
    TRISA=0xff;
    adcon1=0x80;


    LCD_init();
    ADC_init();
    LCD_cmd(_lcd_clear);
    LCD_cmd(_LCD_CURSOR_OFF);

    while(1){
         result=ADC_read(0);
         volt=result*4.88;
         temp=volt/10;

         LCD_out(1,1,"Temp= ");

         floattostr(temp,display);

         LCD_out_cp(display);
         LCD_chr(1,16,223);
         LCD_out_cp(" C");
         delay_ms(1000);
    }

}