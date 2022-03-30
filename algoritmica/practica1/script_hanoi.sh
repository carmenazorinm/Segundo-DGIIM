#!/bin/bash 
echo "" >> salida_hanoi_ubu.dat
i="5"
while [ $i -le 33 ] 
do
./hanoi $i>>salida_hanoi_ubu.dat
i=$(($i+1))
done

