#line 1 "I:/Microcontroller Lab Assignment/Problem1/Problem1 Code/Problem_1_code.c"
char CA[]={0xC0,0xF9,0xA4,0xB0,0x99,0x92,0x82,0xF8,0x80,0x90} ;
char CC[]={0x3F,0x06,0x5B,0x4F,0x66,0x6D,0x7D,0x07,0x7F,0x6F} ;
void main() {
 int i=0,j,leftDigit,rightDigit,countP=0,countR=0,stage=0;
 TRISA=0x00;
 PORTA=0x00;
 TRISB=0x00;
 PORTB=0x00;
 TRISC=0xFF;
 TRISD.F0=0x00;
 TRISD.F1=0x00;
 TRISD.F6=0xff;
 TRISD.F7=0xff;
 PORTD=0x00;
 portc.f0=0;

 while(1)
 {
 if(portc.f0==1)
 {
 porta.f1=0;
 porta.f2=0;
 porta.f3=0;
 stage=1;

 i=0;
 while(1){



 if(portd.f6==1){
 if(i<100) {
 i++;
 countP++;
 }
 }
 if(portd.f7==1){
 if(i>0) {
 i--;
 countP--;
 }
 }


 leftDigit=i/10;
 rightDigit=i%10;
 for(j=0;j<50;j++)
 {
 portd.f0=1;
 portb=CA[leftDigit];
 delay_ms(10);
 portd.f0=0;

 portd.f1=1;
 portb=CA[rightDigit];
 delay_ms(10);
 portd.f1=0;


 }
 if(portc.f0==0)
 {
 break;
 }
 }

 }
 else if(portc.f0==0)
 {

 leftDigit=0;
 rightDigit=0;
 portb=CA[0];
 for(j=0;j<50;j++)
 {
 portd.f0=1;
 portb=CA[0];
 delay_ms(10);
 portd.f0=0;

 portd.f1=1;
 portb=CA[0];
 delay_ms(10);
 portd.f1=0;
 }
 i=0;
 j=0;
 porta.f1=1;
 while(1){



 if(portd.f6==1){
 if(i<100) {
 i++;
 countR++;
 }
 }
 if(portd.f7==1){
 if(i>0) {
 i--;
 countR--;
 }
 }


 leftDigit=i/10;
 rightDigit=i%10;
 for(j=0;j<50;j++)
 {
 portd.f0=1;
 portb=CA[leftDigit];
 delay_ms(10);
 portd.f0=0;

 portd.f1=1;
 portb=CA[rightDigit];
 delay_ms(10);
 portd.f1=0;


 }

 if(countP==countR && stage==1)
 {
 porta.f1=0;
 porta.f2=1;
 delay_ms(2000);
 porta.f2=0;
 porta.f3=1;
 delay_ms(2000);
 porta.f3=0;
 porta.f1=1;
 delay_ms(2000);
 }
 else{
 porta.f1=1;
 }
 if(portc.f0==1)
 {
 break;
 }

 }




 }


 }



}
