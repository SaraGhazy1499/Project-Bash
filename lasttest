#!/usr/bin/bash
# read variable

dataTypeFlag=0;   #true
primarykey=0;    #true
declare -a arrayColumn
declare -a arrayofdatatype
declare -a x
field=""
regixOfNumber='^[0-9]+$'
regixOfString='^[A-Za-z]+$'

arrayColumn=($(cat ./test |sed -n '1p' | tr ":" "\n"))
arrayofdatatype=($(cat ./test |sed -n '2p' | tr ":" "\n"))   #refix


for i in ${arrayColumn[@]};
 
do

read -p "enter $i :" x
#-------------------------regix--------------

pkCol=($(cat ./test | cut -d: -f1))

  for h in ${#pkCol[@]};
    do
       if [[ ${x[1]} == ${pkCol[h]} ]] ;then
          primaryKey=1  #false
          echo "P.k repated"
          
       fi
    done


for ((i=2; i<${#arrayColumn[@]}; i++))  #make i from 1 ,,i=0 for pk
 
  do
   #echo ${arrayColumn[$i]}
   # echo ${arrayofdatatype[1]}
    #echo ${x[$i]}


   if [[ $arrayofdatatype[$i] == "number" ]]; then
      if ! [[ x[$i] =~ $regixOfNumber ]]; then
         dataTypeFlag=1;  #false
         echo "must be anumber."
         break
      fi
   

   elif [[ $arrayofdatatype[$i] == "string" ]]; then
      if ! [[ x[$i] =~ $regixOfSrting ]]; then
         dataTypeFlag=1;  #false
         echo "must be astring."
         break
      fi
   fi
 done


#-----------------------------------------------

 
  #echo "element $i : ${arrayColumn[i]}"
 field+=$x 
 field+=":"
 


#print variables
done

if [[ $dataTypeFlag==0 && $primarykey==0 ]]; then

  echo ${field:0:-1} >> ./test
else
  echo "Failed to store record"
 fi




