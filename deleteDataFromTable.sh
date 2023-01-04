#!/usr/bin/bash
export Lc_COLLATE=c
shopt -s extglob

#test deleteData
flag=0;
declare -i numOfLineBFDelete
declare -i numOfLineAFDelete

read -p "enter table name :" nameTable

read -p "enter the primary key :" primaryKey

numOfLineBFDelete=($( wc -l < $nameTable ))

#echo $numOfLineBfDelete
sed -i /^$primaryKey:/d $nameTable

numOfLineAFDelete=($( wc -l < $nameTable ))
#echo $numOfLineAfDelete
if [ $numOfLineBFDelete -ne $numOfLineAFDelete ]; then
 echo "deleted successfully"
else
 echo "NOT found"
#echo "ee"

fi
cat $nameTable
