unsigned char counter1=0;
unsigned char counter2=0;
unsigned char counter3=0;
unsigned char wait=0;
unsigned char south_open=0;
void main() {
adcon1=7;
trisa=0b00000011;
porta=0;
trisb=0;
portb=0;
trisc=0;
portc=0b00000011;


while(1){
//intial value of count 2_3
counter2=2;counter1=3; //counter1 represents the ones value of count,counter2 represents the tens value of count
portc=0b001100; //initial colors of traffic light
while(!porta.b0){ //auto mode on
  portb=counter1--;
  portb.b4=counter2;
 if(counter2==2){portb.b5=1;}
 else{portb.b5=0;}

 if(counter2==0&&counter1<3){ //count reaches 03
    if(south_open==1){portc=0b00010001;}
    if(south_open==0){portc=0b00001010;}
 }
 if(counter1==0&&counter2==0){  //count reaches 00
           if(south_open==0){ //close south,open west
           counter2=1;counter1=5;
           delay_ms(1000);
           portc=0b00100001;
           }
           else if(south_open==1){ //close west,open south
           counter2=2;counter1=3;
           delay_ms(1000);
           portc=0b00001100;
           }
         south_open=!south_open;
  }
 else if(counter1==0) {
        delay_ms(1000);
        portb.b0=portb.b1=portb.b2=portb.b3=0;
        counter1=9;counter2--;
        delay_ms(1000);
      }
 else{delay_ms(1000);}
}

 counter3=3;
 south_open=1;
 wait=1;  // case of waiting for 3 seconds 0 or 1
 while(porta.b0){ // manual mode on
  portb=0;
  if(porta.b1==1){south_open=!south_open;wait=1;}
 if(south_open==1&&wait==1){
      portc=0b00010100;
      for(counter3=3;counter3>=1;counter3--){
            if(!porta.b0){break;}//while counting if it's turned into auto mode, break
            portb=counter3;
            delay_ms(1000);
      }
     portc=0b00100001;
     wait=0;
 }
 if(south_open==0&&wait==1){
  portc=0b00100010;
  for(counter3=3;counter3>=1;counter3--){portb=counter3;delay_ms(1000);}
  portc=0b00001100;
   wait=0;
  }
}

}
}