#!/bin/bash 
echo "" >> salida_inserccion_ubu.dat
i="10000"
while [ $i -le 200000 ] 
do
./insercion_peorcaso $i>>salida_inserccion_ubu.dat
i=$(($i+7600))
done

