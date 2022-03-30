#!/bin/bash 
echo "" >> salida_quicksort_ubu.dat
i="10000"
while [ $i -le 200000 ] 
do
./quicksort $i>>salida_quicksort_ubu.dat
i=$(($i+7600))
done

