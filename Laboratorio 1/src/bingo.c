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
 
//Prototipo de función delay
void delay (int tiempo);
 
void main(void)
{
	//FALTA IMPLEMENTAR LOGICA
}

//Se define la función delay. Se deja por el momento por si luego puede ser de utilidad
void delay(int tiempo)
{
	int i;
	int j;

	for(i=0;i<tiempo;i++)
	  for(j=0;j<1275;j++);
}
