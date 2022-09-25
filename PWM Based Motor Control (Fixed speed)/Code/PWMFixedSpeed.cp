#line 1 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/PWM Based Motor Control (Fixed speed)/Code/PWMFixedSpeed.c"

void main() {
 int duty=0;
 TRISB=0x00;
 PORTB=0x00;
 TRISC=0x00;
 PORTC=0x00;




 PWM1_INIT(2000);
 TRISD=0xff;
 duty=250;
 PWM1_START();
 PWM1_SET_DUTY(duty);
#line 24 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/PWM Based Motor Control (Fixed speed)/Code/PWMFixedSpeed.c"
 while(1){
#line 60 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/PWM Based Motor Control (Fixed speed)/Code/PWMFixedSpeed.c"
 portb.f0=1;
 portb.f1=0;
 delay_ms(5000);
 portb.f0=0;
 portb.f1=1;
 delay_ms(5000);



 }

}
