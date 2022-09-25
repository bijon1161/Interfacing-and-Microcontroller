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