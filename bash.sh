#!/usr/bin/bash
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
break
;;

*)
echo "Syntax Error";
;;

esac
done
