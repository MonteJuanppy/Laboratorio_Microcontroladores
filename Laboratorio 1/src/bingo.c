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
 
#define Boton  GP3//Se define parametro ligado a pin GPIO3

typedef unsigned int word; //Variable para modificar registro Config
word __at 0x2007 __CONFIG = (_WDT_OFF & _MCLRE_OFF); //Se ponen parametros para apagar condiciones de reset

//Prototipos de funciones
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
 
    unsigned int tiempo = 1; //Tiempo de permutacion entre displays
	unsigned int numero_0 = 10;//Valor por defecto, por lo que se despliega "A" en pantalla del display 0.
	unsigned int numero_1 = 10;//Valor por defecto, por lo que se despliega "A" en pantalla del display 1.
	unsigned int contador = 0; //Contador para llevar cuenta de numeros mostrados
	unsigned int random = 0; //Variable para generar numero aleatorio
	unsigned int random2 = 0;//Variable para generar numero aleatorio
	unsigned int sumar = 0; //Variable para determinar si se incrementa el contador
 
	//Loop que se repite siempre

	while (1)
	{	//Cada ciclo se incrementan la variables aleatorias
		//La frecuencia es tal que los numeros seran muy dificiles de predecir
		random +=1; 
		random2 +=1;
		//Se verifica el estado del boton
		if ( Boton == 1) //Si el boton no esta presionado (configuracion pull-up)
		{
			//Se cambia el estado de la variable sumar
			sumar = 1;
			//Imprimir los numeros en los displays
			desplegar_numero(numero_0,0);
			random2 +=1;//Se incrementa otro contador
			delay(tiempo);
			desplegar_numero(numero_1,1);
			random2 +=1; //Se vuelve a incrementar
			delay(tiempo);
		}
	
		if (random >=10) //Si es mayor a 10
		{
			random = 0; //Vuelve a ser 0.
		}

		if (random2 >=10) //Si es mayor a 10
		{
			random2 = 0;//Vuelve a ser 0.
		}


		if ( Boton != 1){//Si el boton se presiona
			if (sumar ==1)//Si sumar es 1
			{
				contador +=1;//Se incrementa el contador
				sumar = 0;//Vuelve a su estado inicial
			}
			numero_1 = (unsigned int)(random);//Se asigna un numero aleatorio para desplegar en el display 1
			numero_0 = (unsigned int)(random2);//Se asigna el otro numero aleatorio para desplegar en el display 0

		}
		if (contador == 17){//Si ya se mostraron 16 numeros distintos
			//Se despliega 9 de forma intermitente
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(16,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(16,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(16,tiempo,50);
			desplegar_prolongado(9,tiempo,70);
			desplegar_prolongado(16,tiempo,50);
			//Los numeros vuelven a sus valores por defecto
			numero_0 = 10;
			numero_1 = 10;
			contador = 0;//Se reinicia el contador
		}
	}
	
 
}

//Se define la función delay (tomada del ejemplo brindado por el profesor). 
void delay(unsigned int tiempo)
{
	unsigned int i;
	unsigned int j;
	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}

//Funcion para desplegar un numero en un display
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

	//Casos especial
	else if (numero == 10)//Imprimir A
	{
		GP0 = 0;
		GP1 = 1;
		GP2 = 0;
		GP4 = 1;
	}

	else if (numero == 16)//Apagar la pantalla (activa compuerta AND)
	{
		GP0 = 0;
		GP1 = 1;
		GP2 = 1;
		GP4 = 1;
	}
}

//Funcion para desplegar en ambos display un mismo numero por un tiempo prolongado
void desplegar_prolongado (unsigned int numero, unsigned int tiempo, unsigned int i){
	for (int j = 0; j < i; j++)

	{
		desplegar_numero(numero,0);
		delay(tiempo);
		desplegar_numero(numero,1);
		delay(tiempo);

	}
}
