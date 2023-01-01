#!/usr/bin/bash
export LC_COLLATE=C
shopt -s extglob


regix="^[a-zA-Z_]+[a-zA-Z0-9@_$%#]*"
read -p "Enter the name of DataBase :" dataBasename;

if [[ $dataBasename =~ $regix ]] ;then

  if [ -e $dataBasename ] ;then
   echo "this Data Base is already exist."

  else 
   mkdir $dataBasename
   echo "your database is successfully created"

  fi

 else
  echo "syntax error... the name should include Upper Case ,Lowercaase and numbers"
  fi


