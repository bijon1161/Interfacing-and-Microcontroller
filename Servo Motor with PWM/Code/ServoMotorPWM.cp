#line 1 "E:/4-2/Interfacing and Microcontroller/MicroController Lab Practice(Bijon)/Servo Motor with PWM/Code/ServoMotorPWM.c"
void main() {
int duty;
TRISC=0x00;
PORTC=0x00;
PWM1_init(2000);
duty=10;
PWM1_start();
PWM1_SET_DUTY(duty);

while(1){
 duty =40;
 PWM1_SET_DUTY(duty);
 delay_ms(2000);
 duty =75;
 PWM1_SET_DUTY(duty);
 delay_ms(2000);
 duty =110;
 PWM1_SET_DUTY(duty);
 delay_ms(2000);
}

}
