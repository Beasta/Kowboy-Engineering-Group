//*************************************************************
//file name: testbench_atmega48_trial1.c
//function: provides test bench for ATMEL AVR ATmega48 controller
//target controller: ATMEL ATmega48
//
//ATMEL AVR ATmega48 Controller Pin Assignments
//Chip Port Function I/O Source/Dest Asserted Notes
//*************************************************************
//Pin 1 Reset
//*************************************************************
//Pin 1 PB0
//Pin 2 PB1
//Pin 3 PB2
//Pin 4 PB3
//Pin 5 PB4 
//Pin 6 PB5 
//Pin 7 PB6 
//Pin 8 PB7 
//Pin 9 Reset
//Pin 10 VDD
//Pin 11 Gnd
//Pin 12 Resonator
//Pin 13 Resonator
//Pin 14 PD0 to tristate LED indicator
//Pin 15 PD1 to tristate LED indicator
//Pin 16 PD2 to tristate LED indicator
//Pin 17 PD3 to tristate LED indicator
//Pin 18 PD4 
//Pin 19 PD5 
//Pin 20 PD6 
//Pin 21 PD7 
//Pin 22 PC0 to active high RC debounced switch
//Pin 23 PC1 to active high RC debounced switch
//Pin 24 PC2 to active high RC debounced switch
//Pin 25 PC3 to active high RC debounced switch
//Pin 26 PC4
//Pin 27 PC5
//Pin 28 PC6
//Pin 29 PC7
//Pin 30 AVcc to VDD
//Pin 31 AGnd to Ground
//Pin 32 ARef to Vcc
//Pin 33 PA7
//Pin 34 PA6
//Pin 35 PA5
//Pin 36 PA4
//Pin 37 PA3
//Pin 38 PA2
//Pin 39 PA1
//Pin 40 PA0
//
//orginal authors: Steven Barrett and Daniel Pack
//modifying author: Barry Blaha
//created: July 12, 2007
//last revised: February 25, 2008
//***************************************************************
//include files**************************************************
#include<iom48v.h> 				//ImageCraft ICC AVR
								//include file
//for ATmega48
//function prototypes********************************************
void initialize_ports(void); 	//initializes ports
void delay_5ms(void);
//main program***************************************************
//global variables
unsigned char i; 		
//unsigned char j;
void main(void)
{
initialize_ports(); 			//initialize ports

while(1){//main loop
	
	
	delay_5ms();
	PORTD=0x00;
	delay_5ms();
	PORTD=0xff;
	delay_5ms();
	

	//new_PORTC = PINC; 		  //read PORTC
	//if(new_PORTC != old_PORTC){ //process change
	//		PORTD=new_PORTC;
	//  } 						//end if new_PORTC
	//	old_PORTC=new_PORTC; 	//update PORTC
	//for(j=0; j<255; j++)
	//{
		//PORTD=j;
		//delay_5ms();
	//}
	} 							//end while(1)
} 								//end main
//***************************************************************
//function definitions
//***************************************************************
//***************************************************************
//initialize_ports: provides initial configuration for I/O ports
//***************************************************************
void initialize_ports(void)
{

DDRB=0xff;						//PORTB as output
PORTB=0x00;						//initialize PORTB low
	//PORTB is not being used

DDRC=0x00; 						//PORTC[7:0] as input
PORTC=0x00; 					//disable PORTC
	//pull-up resistors

DDRD=0xff; 						//set PORTD as output
PORTD=0xff; 					//initialize hi
	//port D is the output port with LEDS
}
//***************************************************************

/*void delay_5ms()
{
	for(i=0; i<100; i++){
		asm("nop");
	}		

}*/