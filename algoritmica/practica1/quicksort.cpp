/**
   @file Ordenacion rapida (quicksort).
*/

   
#include <iostream>
using namespace std;
#include <ctime>
#include <cstdlib>
#include <climits>
#include <cassert>






/* ************************************************************ */ 
/*  Metodo de ordenacion rspida  */

/**
   @brief Ordena un vector por el metodo quicksort.

   @param T: vector de elementos. Debe tener num_elem elementos.
             Es MODIFICADO.
   @param num_elem: numero de elementos. num_elem > 0.

   Cambia el orden de los elementos de T de forma que los dispone
   en sentido creciente de menor a mayor.
   Aplica el algoritmo quicksort.
*/
inline static 
void quicksort(int T[], int num_elem);



/**
   @brief Ordena parte de un vector por el metodo quicksort.

   @param T: vector de elementos. Tiene un numero de elementos 
                   mayor o igual a final. Es MODIFICADO.
   @param inicial: Posicion que marca el incio de la parte del
                   vector a ordenar.
   @param final: Posicion detras de la ultima de la parte del
                   vector a ordenar. 
		   inicial < final.

   Cambia el orden de los elementos de T entre las posiciones
   inicial y final - 1 de forma que los dispone en sentido creciente
   de menor a mayor.
   Aplica el algoritmo quicksort.
*/
static void quicksort_lims(int T[], int inicial, int final);


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
   @param final: Posicion detrss de la ultima de la parte del
                   vector a ordenar. 
		   inicial < final.

   Cambia el orden de los elementos de T entre las posiciones
   inicial y final - 1 de forma que los dispone en sentido creciente
   de menor a mayor.
   Aplica el algoritmo de insercion.
*/
static void insercion_lims(int T[], int inicial, int final);


/**
   @brief Redistribuye los elementos de un vector segun un pivote.

   @param T: vector de elementos. Tiene un numero de elementos 
                   mayor o igual a final. Es MODIFICADO.
   @param inicial: Posicion que marca el incio de la parte del
                   vector a ordenar.
   @param final: Posicion detras de la ultima de la parte del
                   vector a ordenar. 
		   inicial < final.
   @param pp: Posicion del pivote. Es MODIFICADO.

   Selecciona un pivote los elementos de T situados en las posiciones
   entre inicial y final - 1. Redistribuye los elementos, situando los
   menores que el pivote a su izquierda, despues los iguales y a la
   derecha los mayores. La posicion del pivote se devuelve en pp.
*/
static void dividir_qs(int T[], int inicial, int final, int & pp);



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


const int UMBRAL_QS = 50;


inline void quicksort(int T[], int num_elem)
{
  quicksort_lims(T, 0, num_elem);
}

static void quicksort_lims(int T[], int inicial, int final)
{
  int k;
  if (final - inicial < UMBRAL_QS) {
    insercion_lims(T, inicial, final);
  } else {
    dividir_qs(T, inicial, final, k);
    quicksort_lims(T, inicial, k);
    quicksort_lims(T, k + 1, final);
  };
}


static void dividir_qs(int T[], int inicial, int final, int & pp)
{
  int pivote, aux;
  int k, l;

  pivote = T[inicial];
  k = inicial;
  l = final;
  do {
    k++;
  } while ((T[k] <= pivote) && (k < final-1));
  do {
    l--;
  } while (T[l] > pivote);
  while (k < l) {
    aux = T[k];
    T[k] = T[l];
    T[l] = aux;
    do k++; while (T[k] <= pivote);
    do l--; while (T[l] > pivote);
  };
  aux = T[inicial];
  T[inicial] = T[l];
  T[l] = aux;
  pp = l;
};




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

  srandom(time(0));

  for (int i = 0; i < n; i++)
    {
      T[i] = random();
    };


    //Captura el valor del reloj antes de la llamada a hanoi
    clock_t tantes=clock();
    
    quicksort(T, n);

        //Captura el valor del reloj despues de la ejecucion de hanoi
        clock_t tdespues=clock();
    media+=  (double)(tdespues - tantes) / CLOCKS_PER_SEC;

  delete [] T;
}

cout << n << " "<< (media/15) << endl;
  return 0;
};
