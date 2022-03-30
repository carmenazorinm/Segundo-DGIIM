/**
   @file Ordenacion por insercion
*/

   
#include <iostream>
using namespace std;
#include <ctime>
#include <cstdlib>
#include <climits>
#include <cassert>






/* ************************************************************ */ 
/*  Metodo de ordenacion por insercion  */

/**
   @brief Ordena un vector por el metodo de insercion.

   @param T: vector de elementos. Debe tener num_elem elementos.
             Es MODIFICADO.
   @param num_elem: numero de elementos. num_elem > 0.

   Cambia el orden de los elementos de T de forma que los dispone
   en sentido creciente de menor a mayor.
   Aplica el algoritmo de insercion.
*/
inline static 
void insercion(int T[], int num_elem);



/**
   @brief Ordena parte de un vector por el metodo de insercion.

   @param T: vector de elementos. Tiene un numero de elementos 
                   mayor o igual a final. Es MODIFICADO.
   @param inicial: Posicion que marca el incio de la parte del
                   vector a ordenar.
   @param final: Posicion detras de la ultima de la parte del
                   vector a ordenar. 
		   inicial < final.

   Cambia el orden de los elementos de T entre las posiciones
   inicial y final - 1de forma que los dispone en sentido creciente
   de menor a mayor.
   Aplica el algoritmo de insercion.
*/
static void insercion_lims(int T[], int inicial, int final);



/**
   Implementacion de las funciones
**/

inline static void insercion(int T[], int num_elem)
{
  insercion_lims(T, 0, num_elem);
}


static void insercion_lims(int T[], int inicial, int final)
{
  int i, j;
  int aux;
  for (i = inicial + 1; i < final; i++) {
    j = i;
    while ((T[j] < T[j-1]) && (j > 0)) {
      aux = T[j];
      T[j] = T[j-1];
      T[j-1] = aux;
      j--;
    };
  };
}



int main(int argc, char * argv[])
{
    int n;
    /*cout << "Introduce numero de elementos del vector: ";
      cin >> n;*/
    n=atoi(argv[1]);
    double media=0;
    for (int i=1; i<16; i++){
        int * T = new int[n];
        assert(T);

        //srandom(time(0));

        for (int i = 0; i < n; i++)
        {
            T[i] = i;
        };

        //Captura el valor del reloj antes de la llamada a hanoi
        clock_t tantes=clock();
        
        //Llama a inserccion
        insercion(T, n);

        //Captura el valor del reloj despues de la ejecucion de hanoi
        clock_t tdespues=clock();

        media+=  (double)(tdespues - tantes) / CLOCKS_PER_SEC;


        delete [] T;
    }
    
    cout << n << " "<< (media/15) << endl;
    return 0;
};
