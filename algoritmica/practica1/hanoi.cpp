/**
   @file Resolucion del problema de las Torres de Hanoi
*/

   
#include <iostream>
using namespace std;
#include <ctime>


/**
   @brief Resuelve el problema de las Torres de Hanoi
   @param M: numero de discos. M > 1.
   @param i: numero de columna en que estan los discos.
             i es un valor de {1, 2, 3}. i != j.
   @param j: numero de columna a que se llevan los discos.
             j es un valor de {1, 2, 3}. j != i.

   Esta funcion imprime en la salida estandar la secuencia de 
   movimientos necesarios para desplazar los M discos de la
   columna i a la j, observando la restriccion de que ningun
   disco se puede situar sobre otro de tamanio menor. Utiliza
   una unica columna auxiliar.
*/
void hanoi (int M, int i, int j);




void hanoi (int M, int i, int j)
{
  if (M > 0)
    {
      hanoi(M-1, i, 6-i-j);
      //cout << i << " -> " << j << endl;
      hanoi (M-1, 6-i-j, j);
  }
}

int main(int argc, char * argv[])
{

  int M;
  /*do
    {
      cout << "Numero de discos: ";
      cin >> M;
    } while (M <= 0);
*/


    M = atoi(argv[1]);

    //Para obtener el numero de segundos (en media)
    double media=0;
    for (int i=1; i<16; i++){

        //Captura el valor del reloj antes de la llamada a hanoi
        clock_t tantes=clock();

        // Llama al algoritmo de ordenacion de hanoi
        hanoi(M, 1, 2);

        //Captura el valor del reloj despues de la ejecucion de hanoi
        clock_t tdespues=clock();

        media+=  (double)(tdespues - tantes) / CLOCKS_PER_SEC;

    }

    cout << M << " "<< (media/15) << endl;


  return 0;
}
