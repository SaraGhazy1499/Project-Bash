export LC_COLLATE=C
shopt -s extglob

select choice in createTable listTable dropTable  selectData deleteData updateData insertData deleteAllData Exit
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

      updateData)
      . updateData.sh
      ;;

      insertData)
      . insertData.sh
      ;;

      deleteData)
      . deleteDataFromTable.sh
      ;;

      deleteAllData)
      . deleteScript.sh
      ;;

       Exit)
       cd ..
       . bash.sh
       break
         ;;

       *)
       echo "Syntax Error."
    ;;

  esac

done

