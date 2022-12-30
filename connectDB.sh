export LC_COLLATE=C
shopt -s extglob

if [ -d ~/Database ] ; then
 cd ~/Database
 echo "enter in database"

 else
  mkdir Database
  cd ~/Database
  echo "create and enter in databse"
fi
cd DB1
p2="DB1"


select choice in createTable listTable dropTable  selectData deleteData Exit
 do 
  case $REPLY in 
    createTable)
    . createTable.sh
     ;;

    listTable)
      path=$(pwd)
      files=$(ls $path | wc -l )
      echo $files
       if [ $files -gt 0 ] ; then 
       ls -p  | grep -v / 
       else
       echo "There are no tables."
       fi
      ;;

     dropTable)
       read -p "Enter Name of Table  : " name 
       if [ -f $name ] ; then
          rm $name
       echo "dropped Table Successfully!"
       else
       echo "error , Table is not exist."
       fi
    ;;

      selectData)
       . selectData.sh
      ;;
       Exit)
       break
         ;;

    *)
    echo "Error"
    break

  esac

done