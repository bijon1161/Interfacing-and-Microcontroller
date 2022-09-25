#line 1 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/Two Digit Seven Seg with button/Code/TwoDigitSevenSegAnodeButton.c"
char CA[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90} ;
char CC[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F} ;
void main() {
 int i=0,j,leftDigit,rightDigit;
 TRISB=0x00;
 PORTB=0x00;
 TRISD.f0=0x00;
 TRISD.f1=0x00;
 PORTD.f0=0x00;
 PORTD.f1=0x00;
 TRISD.F6=0xff;
 TRISD.F7=0xff;

 while(1)
 {

 i=0;
 while(1){
 if(portd.f6==1){
 if(i<100)
 i++;

 }
 if(portd.f7==1){
 if(i>0)
 i--;
 }
 leftDigit=i/10;
 rightDigit=i%10;

 for(j=0;j<5;j++)
 {
 delay_ms(10);
 portd.f0=1;
 portb=CA[leftDigit];
 delay_ms(10);
 portd.f0=0;

 delay_ms(10);
 portd.f1=1;
 portb=CA[rightDigit];
 delay_ms(10);
 portd.f1=0;
 delay_ms(10);
 }
 }
 }


}
