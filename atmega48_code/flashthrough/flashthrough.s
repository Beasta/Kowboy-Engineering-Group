	.module flashthrough.c
	.area text(rom, con, rel)
	.dbfile G:\mega48\flashthrough.c
	.area data(ram, con, rel)
	.dbfile G:\mega48\flashthrough.c
_old_PORTC::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile G:\mega48\flashthrough.c
	.dbsym e old_PORTC _old_PORTC c
_countser::
	.blkb 1
	.area idata
	.byte 0
	.area data(ram, con, rel)
	.dbfile G:\mega48\flashthrough.c
	.dbsym e countser _countser c
	.area text(rom, con, rel)
	.dbfile G:\mega48\flashthrough.c
	.dbfunc e main _main fV
	.even
_main::
	.dbline -1
	.dbline 69
; //*************************************************************
; //file name: testbench_atmega48_trial1.c
; //function: provides test bench for ATMEL AVR ATmega48 controller
; //target controller: ATMEL ATmega48
; //
; //ATMEL AVR ATmega48 Controller Pin Assignments
; //Chip Port Function I/O Source/Dest Asserted Notes
; //*************************************************************
; //Pin 1 Reset
; //*************************************************************
; //Pin 1 PB0
; //Pin 2 PB1
; //Pin 3 PB2
; //Pin 4 PB3
; //Pin 5 PB4 
; //Pin 6 PB5 
; //Pin 7 PB6 
; //Pin 8 PB7 
; //Pin 9 Reset
; //Pin 10 VDD
; //Pin 11 Gnd
; //Pin 12 Resonator
; //Pin 13 Resonator
; //Pin 14 PD0 to tristate LED indicator
; //Pin 15 PD1 to tristate LED indicator
; //Pin 16 PD2 to tristate LED indicator
; //Pin 17 PD3 to tristate LED indicator
; //Pin 18 PD4 
; //Pin 19 PD5 
; //Pin 20 PD6 
; //Pin 21 PD7 
; //Pin 22 PC0 to active high RC debounced switch
; //Pin 23 PC1 to active high RC debounced switch
; //Pin 24 PC2 to active high RC debounced switch
; //Pin 25 PC3 to active high RC debounced switch
; //Pin 26 PC4
; //Pin 27 PC5
; //Pin 28 PC6
; //Pin 29 PC7
; //Pin 30 AVcc to VDD
; //Pin 31 AGnd to Ground
; //Pin 32 ARef to Vcc
; //Pin 33 PA7
; //Pin 34 PA6
; //Pin 35 PA5
; //Pin 36 PA4
; //Pin 37 PA3
; //Pin 38 PA2
; //Pin 39 PA1
; //Pin 40 PA0
; //
; //orginal authors: Steven Barrett and Daniel Pack
; //modifying author: Barry Blaha
; //created: July 12, 2007
; //last revised: February 25, 2008
; //***************************************************************
; //include files**************************************************
; #include<iom48v.h> 				//ImageCraft ICC AVR
; 								//include file
; //for ATmega48
; //function prototypes********************************************
; void initialize_ports(void); 	//initializes ports
; //main program***************************************************
; //global variables
; unsigned char old_PORTC = 0x00; //present value of PORTC
; unsigned char new_PORTC; 		//new values of PORTC
; unsigned char countser = 0;		//counter
; void main(void)
; {
	.dbline 70
; initialize_ports(); 			//initialize ports
	rcall _initialize_ports
	rjmp L3
L2:
	.dbline 72
; 
; while(1){
	.dbline 73
; 		 new_PORTC = PINC; 			//read PORTC
	in R2,0x6
	sts _new_PORTC,R2
	.dbline 74
; 		 if(new_PORTC != old_PORTC){ //process change
	lds R2,_old_PORTC
	lds R3,_new_PORTC
	cp R3,R2
	breq L5
X0:
	.dbline 74
	.dbline 75
; 		 		PORTD=0x00;
	clr R2
	out 0xb,R2
	.dbline 76
; 				countser=0;
	sts _countser,R2
	rjmp L8
L7:
	.dbline 77
; 				while(countser<100){
	.dbline 78
; 					countser=countser+1;
	lds R24,_countser
	subi R24,255    ; addi 1
	sts _countser,R24
	.dbline 79
; 				}	  
L8:
	.dbline 77
	lds R24,_countser
	cpi R24,100
	brlo L7
X1:
	.dbline 80
; 				PORTD=0xff;
	ldi R24,255
	out 0xb,R24
	.dbline 81
; 				countser=0;
	clr R2
	sts _countser,R2
	rjmp L11
L10:
	.dbline 82
; 				while(countser<100){
	.dbline 83
; 					countser=countser+1;
	lds R24,_countser
	subi R24,255    ; addi 1
	sts _countser,R24
	.dbline 84
; 				}	 
L11:
	.dbline 82
	lds R24,_countser
	cpi R24,100
	brlo L10
X2:
	.dbline 85
; 				PORTD=0x00;
	clr R2
	out 0xb,R2
	.dbline 86
; 		 }
L5:
	.dbline 87
; 		}
L3:
	.dbline 72
	rjmp L2
X3:
	.dbline -2
L1:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e initialize_ports _initialize_ports fV
	.even
_initialize_ports::
	.dbline -1
	.dbline 96
; } 								//end main
; //***************************************************************
; //function definitions
; //***************************************************************
; //***************************************************************
; //initialize_ports: provides initial configuration for I/O ports
; //***************************************************************
; void initialize_ports(void)
; {
	.dbline 98
; 
; DDRB=0xff;						//PORTB as output
	ldi R24,255
	out 0x4,R24
	.dbline 99
; PORTB=0x00;						//initialize PORTB low
	clr R2
	out 0x5,R2
	.dbline 102
; 	//PORTB is not being used
; 
; DDRC=0x00; 						//PORTC[7:0] as input
	out 0x7,R2
	.dbline 103
; PORTC=0x00; 					//disable PORTC
	out 0x8,R2
	.dbline 106
; 	//pull-up resistors
; 
; DDRD=0xff; 						//set PORTD as output
	out 0xa,R24
	.dbline 107
; PORTD=0xff; 					//initialize high
	out 0xb,R24
	.dbline -2
L13:
	.dbline 0 ; func end
	ret
	.dbend
	.area bss(ram, con, rel)
	.dbfile G:\mega48\flashthrough.c
_new_PORTC::
	.blkb 1
	.dbsym e new_PORTC _new_PORTC c
; 	//port D is the output port with LEDS
; }
; //***************************************************************
; 
