#line 1 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/LED Blinking/Code/LED_Blinking.c"
void main() {
 TRISB = 0x00;
 PORTB = 0x00;

 while(1){
 portB.f2 = 1;
 delay_ms(1000);
 portB.f2 = 0;
 delay_ms(1000);
 }
}
