#!/usr/bin/bash
export Lc_COLLATE=c
shopt -s extglob


read -p "enter table name " tableName

if [ -f $tableName ] ;then
     
  sed -i '2,$d' ./$tableName 
 
else 
   echo "this table is not found" 
fi
 
 
 





