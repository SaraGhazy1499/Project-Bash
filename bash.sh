#!/usr/bin/bash

if [ -d Database ] ; then
 cd ~/Database
 echo "enter in database"

 else
  mkdir Database
  cd Database
  echo "create and enter in databse"
fi

select choice in createDB listDB dropDB connectDB Exit
do
case $REPLY in 
createDB)
 . createScript.sh
;;
listDB)
 . listScript.sh
;;
dropDB)
 . deleteScript.sh
;;
connectDB)
read -p "Enter Name of DB  : " nameDB
 if [ -e $nameDB ] ; then
 cd $nameDB
 . connectDB.sh
 else
  echo "Table is not exist."
 fi
;;

Exit)
cd --
break
;;

*)
echo "Syntax Error";
;;

esac
done
