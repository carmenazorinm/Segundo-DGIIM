#!/bin/bash 
echo "" >> salida_floyd_ubu.dat
i="50"
while [ $i -le 1500 ] 
do
./floyd $i>>salida_floyd_ubu.dat
i=$(($i+50))
done

