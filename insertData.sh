#!/usr/bin/bash
# read variable

declare -a arrayColumn
declare -a arrayofdatatype
declare -a x
field=""

arrayColumn=($(cat $tableName |sed -n '1p' | tr ":" "\n"))
arrayofdatatype=($(cat $tableName |sed -n '2p'))

for ((i=0; i<${#arrayColumn[@]}; i++))
 do
   echo ${arrayColumn[$i]}
  done
 
 for i in ${arrayColumn//:/ }
do

 read -p "enter $i :" x
 
 field+=$x 
 field+=":"
 


#print variables
done
 
echo ${field:0:-1} >> $tableName





