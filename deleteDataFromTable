#!/usr/bin/bash
export Lc_COLLATE=c
shopt -s extglob

#test deleteData
flag=0;
declare -i numOfLineBFDelete
declare -i numOfLineAFDelete

read -p "enter table name :" tablename

read -p "enter the primary key :" primaryKey

numOfLineBFDelete=($( wc -l < $tablename ))

#echo $numOfLineBfDelete
sed -i /^$primaryKey:/d $tablename

numOfLineAFDelete=($( wc -l < $tablename ))
#echo $numOfLineAfDelete
if [ $numOfLineBFDelete -ne $numOfLineAFDelete ]; then
 echo "deleted successfully"
else
 echo "NOT found"
#echo "ee"

fi
cat $tablename
