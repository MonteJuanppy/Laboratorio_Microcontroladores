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

typedef unsigned int word;
word __at 0x2007 __CONFIG = (_WDTE_OFF & _WDT_OFF & _MCLRE_OFF);  

//Prototipo de función delay
void delay (unsigned int tiempo);
void desplegar_numero (unsigned int numero, unsigned int display);
void desplegar_prolongado (unsigned int numero, unsigned int tiempo, unsigned int i);
 
void main(void)
{
	ANSEL  = 0x00;   //Se poenen los puertos como digitales, no analogicos
    CMCON  = 0x07;   // Deshabilita el comparador 
    VRCON  = 0x00;   //Se quita le referencia de tension
	TRISIO = 0b00001000; //Se ponen los pines como salidas. Solo el GP3 es entrada por defecto
	GPIO = 0x00; //Poner pines en bajo
 
    unsigned int tiempo = 1;
	unsigned int numero_0 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 0.
	unsigned int numero_1 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 1.
	unsigned int contador = 0;
	unsigned int random = 0;
	unsigned int random2 = 0;
	unsigned int sumar = 0;
 
	//Loop que se repite siempre

	while (1)
	{
		random +=1;
		random2 +=random;
		//Se verifica el estado del boton
		if ( Boton == 1)
		{
			sumar = 1;
			//Imprimir los numeros en los displays
			desplegar_numero(numero_0,0);
			delay(tiempo);
			desplegar_numero(numero_1,1);
			delay(tiempo);
		}
	
		if (random >=10)
		{
			random = 0;
		}
		
		if (random2 >=10)
		{
			random2 = 0;
		}
		

		if ( Boton != 1){
			if (sumar ==1)
			{
				contador +=1;
				sumar = 0;
			}
			numero_1 = (unsigned int)(random);
			numero_0 = (unsigned int)(random2);

		}
		if (contador == 17){
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(0,tiempo,50);
			numero_0 = 15;
			numero_1 = 15;
			contador = 0;
		}
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

void desplegar_prolongado (unsigned int numero, unsigned int tiempo, unsigned int i){
	for (int j = 0; j < i; j++)
	{
		desplegar_numero(numero,0);
		delay(tiempo);
		desplegar_numero(numero,1);
		delay(tiempo);

	}
}
