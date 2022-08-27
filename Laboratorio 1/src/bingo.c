/*Universidad de Costa Rica
IE-0624 Laboratorio de Microcontroladores
Prof: MSc. Marco Villalta Fallas
Estudiante: Juan Ignacio Montealegre Salazar
Carné: B95001
Laboratorio 1
Simulador de bingo
Ciclo: II-2022
*/

//Se incluye el encabezado necesario para el PIC12f675
#include <pic14/pic12f675.h>
 
#define Boton  GP3
//Prototipo de función delay
void delay (unsigned int tiempo);
void desplegar_numero (unsigned int numero, unsigned int display);
 
void main(void)
{
	//FALTA IMPLEMENTAR LOGICA
	ANSEL  = 0x00;   // Set ports as digital I/O, not analog input
	ADCON0 = 0x00;          // Shut off the A/D Converter
    CMCON  = 0x07;          // Deshabilita el comparador 
    VRCON  = 0x00;         // Shut off the Voltage Reference
	TRISIO = 0b00001000; //Se ponen los pines como salidas. Solo el GP3 es entrada por defecto
	GPIO = 0x00; //Poner pines en bajo
 
    unsigned int time = 1;
 
    //Loop forever
    while ( Boton !=1 )
    {
		//Imprimir 23 en los displays
		desplegar_numero(8,0);
		delay(time);
		desplegar_numero(5,1);
		delay(time);
			
    }
 
}

//Se define la función delay (tomada del ejemplo brindado por el profesor). Se deja por el momento por si luego puede ser de utilidad
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

void desplegar_numero (unsigned int numero, unsigned int display)
{
	GP5 = display; //Se asigna el display en el que se desplegará el número
	//Se definen los casos para cada número del 0 al 9.

	if (numero == 0)
	{
		GP0 = 0;
		GP1 = 0;
		GP2 = 0;
		GP4 = 0;
	}

	else if (numero == 1)
	{
		GP0 = 1;
		GP1 = 0;
		GP2 = 0;
		GP4 = 0;
	}

	else if (numero == 2)
	{
		GP0 = 0;
		GP1 = 1;
		GP2 = 0;
		GP4 = 0;
	}

	else if (numero == 3)
	{
		GP0 = 1;
		GP1 = 1;
		GP2 = 0;
		GP4 = 0;
	}
	
	else if (numero == 4)
	{
		GP0 = 0;
		GP1 = 0;
		GP2 = 1;
		GP4 = 0;
	}

	else if (numero == 5)
	{
		GP0 = 1;
		GP1 = 0;
		GP2 = 1;
		GP4 = 0;
	}

	else if (numero == 6)
	{
		GP0 = 0;
		GP1 = 1;
		GP2 = 1;
		GP4 = 0;
	}

	else if (numero == 7)
	{
		GP0 = 1;
		GP1 = 1;
		GP2 = 1;
		GP4 = 0;
	}

	else if (numero == 8)
	{
		GP0 = 0;
		GP1 = 0;
		GP2 = 0;
		GP4 = 1;
	}

	else if (numero == 9)
	{
		GP0 = 1;
		GP1 = 0;
		GP2 = 0;
		GP4 = 1;
	}

	else
	{
		GP0 = 1;
		GP1 = 1;
		GP2 = 1;
		GP4 = 1;
	}
}
