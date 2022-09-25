//clear char array
 int valADC;
 char x[4];

void main() {

// initialization uart(virtual terminal);
UART1_INIT(9600);
//delay_ms(100);
ADC_init();

while(1){
    //Read ADC value in RA2
    valADC=ADC_Read(0);
    //convert into string/char array
    IntToStr(valADC,x);
    //Print
    UART1_Write_Text("Analog value is=");
    UART1_Write_Text(x);
    //clear char array
    strcpy(x,"");
    UART1_Write(13);
    delay_ms(1000);
}

}