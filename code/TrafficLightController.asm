
_main:

;TrafficLightController.c,6 :: 		void main() {
;TrafficLightController.c,7 :: 		adcon1=7;
	MOVLW      7
	MOVWF      ADCON1+0
;TrafficLightController.c,8 :: 		trisa=0b00000011;
	MOVLW      3
	MOVWF      TRISA+0
;TrafficLightController.c,9 :: 		porta=0;
	CLRF       PORTA+0
;TrafficLightController.c,10 :: 		trisb=0;
	CLRF       TRISB+0
;TrafficLightController.c,11 :: 		portb=0;
	CLRF       PORTB+0
;TrafficLightController.c,12 :: 		trisc=0;
	CLRF       TRISC+0
;TrafficLightController.c,13 :: 		portc=0b00000011;
	MOVLW      3
	MOVWF      PORTC+0
;TrafficLightController.c,16 :: 		while(1){
L_main0:
;TrafficLightController.c,18 :: 		counter2=2;counter1=3; //counter1 represents the ones value of count,counter2 represents the tens value of count
	MOVLW      2
	MOVWF      _counter2+0
	MOVLW      3
	MOVWF      _counter1+0
;TrafficLightController.c,19 :: 		portc=0b001100; //initial colors of traffic light
	MOVLW      12
	MOVWF      PORTC+0
;TrafficLightController.c,20 :: 		while(!porta.b0){ //auto mode on
L_main2:
	BTFSC      PORTA+0, 0
	GOTO       L_main3
;TrafficLightController.c,21 :: 		portb=counter1--;
	MOVF       _counter1+0, 0
	MOVWF      PORTB+0
	DECF       _counter1+0, 1
;TrafficLightController.c,22 :: 		portb.b4=counter2;
	BTFSC      _counter2+0, 0
	GOTO       L__main48
	BCF        PORTB+0, 4
	GOTO       L__main49
L__main48:
	BSF        PORTB+0, 4
L__main49:
;TrafficLightController.c,23 :: 		if(counter2==2){portb.b5=1;}
	MOVF       _counter2+0, 0
	XORLW      2
	BTFSS      STATUS+0, 2
	GOTO       L_main4
	BSF        PORTB+0, 5
	GOTO       L_main5
L_main4:
;TrafficLightController.c,24 :: 		else{portb.b5=0;}
	BCF        PORTB+0, 5
L_main5:
;TrafficLightController.c,26 :: 		if(counter2==0&&counter1<3){ //count reaches 03
	MOVF       _counter2+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main8
	MOVLW      3
	SUBWF      _counter1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main8
L__main46:
;TrafficLightController.c,27 :: 		if(south_open==1){portc=0b00010001;}
	MOVF       _south_open+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main9
	MOVLW      17
	MOVWF      PORTC+0
L_main9:
;TrafficLightController.c,28 :: 		if(south_open==0){portc=0b00001010;}
	MOVF       _south_open+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main10
	MOVLW      10
	MOVWF      PORTC+0
L_main10:
;TrafficLightController.c,29 :: 		}
L_main8:
;TrafficLightController.c,30 :: 		if(counter1==0&&counter2==0){  //count reaches 00
	MOVF       _counter1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
	MOVF       _counter2+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main13
L__main45:
;TrafficLightController.c,31 :: 		if(south_open==0){ //close south,open west
	MOVF       _south_open+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main14
;TrafficLightController.c,32 :: 		counter2=1;counter1=5;
	MOVLW      1
	MOVWF      _counter2+0
	MOVLW      5
	MOVWF      _counter1+0
;TrafficLightController.c,33 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
	NOP
;TrafficLightController.c,34 :: 		portc=0b00100001;
	MOVLW      33
	MOVWF      PORTC+0
;TrafficLightController.c,35 :: 		}
	GOTO       L_main16
L_main14:
;TrafficLightController.c,36 :: 		else if(south_open==1){ //close west,open south
	MOVF       _south_open+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;TrafficLightController.c,37 :: 		counter2=2;counter1=3;
	MOVLW      2
	MOVWF      _counter2+0
	MOVLW      3
	MOVWF      _counter1+0
;TrafficLightController.c,38 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	DECFSZ     R11+0, 1
	GOTO       L_main18
	NOP
	NOP
;TrafficLightController.c,39 :: 		portc=0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;TrafficLightController.c,40 :: 		}
L_main17:
L_main16:
;TrafficLightController.c,41 :: 		south_open=!south_open;
	MOVF       _south_open+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _south_open+0
;TrafficLightController.c,42 :: 		}
	GOTO       L_main19
L_main13:
;TrafficLightController.c,43 :: 		else if(counter1==0) {
	MOVF       _counter1+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main20
;TrafficLightController.c,44 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
	NOP
;TrafficLightController.c,45 :: 		portb.b0=portb.b1=portb.b2=portb.b3=0;
	BCF        PORTB+0, 3
	BTFSC      PORTB+0, 3
	GOTO       L__main50
	BCF        PORTB+0, 2
	GOTO       L__main51
L__main50:
	BSF        PORTB+0, 2
L__main51:
	BTFSC      PORTB+0, 2
	GOTO       L__main52
	BCF        PORTB+0, 1
	GOTO       L__main53
L__main52:
	BSF        PORTB+0, 1
L__main53:
	BTFSC      PORTB+0, 1
	GOTO       L__main54
	BCF        PORTB+0, 0
	GOTO       L__main55
L__main54:
	BSF        PORTB+0, 0
L__main55:
;TrafficLightController.c,46 :: 		counter1=9;counter2--;
	MOVLW      9
	MOVWF      _counter1+0
	DECF       _counter2+0, 1
;TrafficLightController.c,47 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main22:
	DECFSZ     R13+0, 1
	GOTO       L_main22
	DECFSZ     R12+0, 1
	GOTO       L_main22
	DECFSZ     R11+0, 1
	GOTO       L_main22
	NOP
	NOP
;TrafficLightController.c,48 :: 		}
	GOTO       L_main23
L_main20:
;TrafficLightController.c,49 :: 		else{delay_ms(1000);}
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main24:
	DECFSZ     R13+0, 1
	GOTO       L_main24
	DECFSZ     R12+0, 1
	GOTO       L_main24
	DECFSZ     R11+0, 1
	GOTO       L_main24
	NOP
	NOP
L_main23:
L_main19:
;TrafficLightController.c,50 :: 		}
	GOTO       L_main2
L_main3:
;TrafficLightController.c,52 :: 		counter3=3;
	MOVLW      3
	MOVWF      _counter3+0
;TrafficLightController.c,53 :: 		south_open=1;
	MOVLW      1
	MOVWF      _south_open+0
;TrafficLightController.c,54 :: 		wait=1;  // case of waiting for 3 seconds 0 or 1
	MOVLW      1
	MOVWF      _wait+0
;TrafficLightController.c,55 :: 		while(porta.b0){ // manual mode on
L_main25:
	BTFSS      PORTA+0, 0
	GOTO       L_main26
;TrafficLightController.c,56 :: 		portb=0;
	CLRF       PORTB+0
;TrafficLightController.c,57 :: 		if(porta.b1==1){south_open=!south_open;wait=1;}
	BTFSS      PORTA+0, 1
	GOTO       L_main27
	MOVF       _south_open+0, 0
	MOVLW      1
	BTFSS      STATUS+0, 2
	MOVLW      0
	MOVWF      _south_open+0
	MOVLW      1
	MOVWF      _wait+0
L_main27:
;TrafficLightController.c,58 :: 		if(south_open==1&&wait==1){
	MOVF       _south_open+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVF       _wait+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main30
L__main44:
;TrafficLightController.c,59 :: 		portc=0b00010100;
	MOVLW      20
	MOVWF      PORTC+0
;TrafficLightController.c,60 :: 		for(counter3=3;counter3>=1;counter3--){
	MOVLW      3
	MOVWF      _counter3+0
L_main31:
	MOVLW      1
	SUBWF      _counter3+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main32
;TrafficLightController.c,61 :: 		if(!porta.b0){break;}//while counting if it's turned into auto mode, break
	BTFSC      PORTA+0, 0
	GOTO       L_main34
	GOTO       L_main32
L_main34:
;TrafficLightController.c,62 :: 		portb=counter3;
	MOVF       _counter3+0, 0
	MOVWF      PORTB+0
;TrafficLightController.c,63 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
	NOP
;TrafficLightController.c,60 :: 		for(counter3=3;counter3>=1;counter3--){
	DECF       _counter3+0, 1
;TrafficLightController.c,64 :: 		}
	GOTO       L_main31
L_main32:
;TrafficLightController.c,65 :: 		portc=0b00100001;
	MOVLW      33
	MOVWF      PORTC+0
;TrafficLightController.c,66 :: 		wait=0;
	CLRF       _wait+0
;TrafficLightController.c,67 :: 		}
L_main30:
;TrafficLightController.c,68 :: 		if(south_open==0&&wait==1){
	MOVF       _south_open+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main38
	MOVF       _wait+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main38
L__main43:
;TrafficLightController.c,69 :: 		portc=0b00100010;
	MOVLW      34
	MOVWF      PORTC+0
;TrafficLightController.c,70 :: 		for(counter3=3;counter3>=1;counter3--){portb=counter3;delay_ms(1000);}
	MOVLW      3
	MOVWF      _counter3+0
L_main39:
	MOVLW      1
	SUBWF      _counter3+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_main40
	MOVF       _counter3+0, 0
	MOVWF      PORTB+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main42:
	DECFSZ     R13+0, 1
	GOTO       L_main42
	DECFSZ     R12+0, 1
	GOTO       L_main42
	DECFSZ     R11+0, 1
	GOTO       L_main42
	NOP
	NOP
	DECF       _counter3+0, 1
	GOTO       L_main39
L_main40:
;TrafficLightController.c,71 :: 		portc=0b00001100;
	MOVLW      12
	MOVWF      PORTC+0
;TrafficLightController.c,72 :: 		wait=0;
	CLRF       _wait+0
;TrafficLightController.c,73 :: 		}
L_main38:
;TrafficLightController.c,74 :: 		}
	GOTO       L_main25
L_main26:
;TrafficLightController.c,76 :: 		}
	GOTO       L_main0
;TrafficLightController.c,77 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
