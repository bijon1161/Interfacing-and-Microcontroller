#line 1 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/Four Digit Segment/Code/FourLetterSevenSegAnode.c"
char letter_CA[]= {0x88,0x80,0xC6,0x86,0x99,0x89,0xF9,0xC7,0xC0,0x8C,0x92} ;
char letter_CC[]= {0x77,0x7F,0x39,0x79,0x71,0x76,0x06,0x38,0x3F,0x73,0x6D} ;

void main() {
 int i=0,j=0;
 TRISB=0x00;
 TRISD=0x00;
 PORTB=0x00;
 PORTD=0x00;

 while(1){

 portd.f0=1;
 portb= 0x89 ;
 delay_ms(10);
 portd.f0=0;

 portd.f1=1;
 portb= 0x86 ;
 delay_ms(10);
 portd.f1=0;

 portd.f2=1;
 portb= 0xC7 ;
 delay_ms(10);
 portd.f2=0;

 portd.f6=1;
 portb= 0xC0 ;
 delay_ms(10);
 portd.f6=0;

 }

}
