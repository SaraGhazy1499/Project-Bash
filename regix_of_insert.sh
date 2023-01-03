#!usr/bin/bash
#regix

dataTypeFlag=0;   #true
primarykey=0;    #true

regixOfNumber='^[0-9]+$'
regixOfString='^[A-Za-z]+$'

#validate of number

if [[ $arrayofdatatype[$i] == "integer" ]]; then
  if ![[ x[$i] =~ $regixOfNumber ]]; then
  dataTypeFlag=1;  #false
  echo "must be anumber."
  fi
fi
#validate of string

if [[ $arrayofdatatype[$i] == "string" ]]; then
  if ![[ x[$i] =~ $regixOfSrting ]]; then
  dataTypeFlag=1;  #false
  echo "must be astring."
  fi

#validate of p.k

pkCol=cat $tablename | cut -d: -f1

declare -a arrayOfPk

for a in ${! pkCol[@]};
do
  separator=":" read -r -a arrayOfPk[$a] <<< pkCol[$a]
done

for h in ${!arrayOfPk[@]};
do
 if [[ ${newValueOfPk[1]} == ${arrayOfPk[h]} ]] ;then
  primaryKey=1  #false
  echo "P.k repated" 
 else 
 
   x<< newValueOfPk
 fi

 done






















  
  

