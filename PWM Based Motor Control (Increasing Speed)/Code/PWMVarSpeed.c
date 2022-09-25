
void main() {
  int duty=0;
  TRISB=0x00;
  PORTB=0x00;
  TRISC=0x00;
  PORTC=0x00;


  //PORTD=0x00;

  PWM1_INIT(2000);
  TRISD=0xff;

  PWM1_START();
  PWM1_SET_DUTY(duty);

  portb.f0=1;
  portb.f1=0;
  /* for reverse spin
     portb.f0=0;
     portb.f1=1;
  */
  while(1){

     // delay_ms(200);

      if(portd.f0==1)
      {
          delay_ms(200);


           if(duty<250)
            {

              duty=duty+10;
              PWM1_SET_DUTY(duty);

           }
               portc.f0=1;

      }
         if(portd.f1==1)
      {
          delay_ms(200);

            if(duty>=10)
            {

              duty=duty-10;
              PWM1_SET_DUTY(duty);

            }

          portc.f0=1;
      }




  }

}