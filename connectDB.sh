export LC_COLLATE=C
shopt -s extglob

if [ -d ~/Database ] ; then
 cd ~/Database
 echo "enter in database"
 ls -l
 else
  mkdir Database
  cd ~/Database
  echo "create and enter in databse"
fi
cd DB1
p2=DB1

select choice in createTable listTable dropTable
 do 
  case $REPLY in 
    createTable)
    . createTable.sh
     ;;

    listTable)
      ls -p  | grep -v / 
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

    *)
    echo "Error"
    break

  esac

done