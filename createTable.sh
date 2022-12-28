         reg="[a-zA-Z]+"
          field="";
         read -p "Enter Name of Table  : " nameTable  
         if [ -e $nameTable ] ; then
         echo "Table is Exist."
         elif [[ $nameTable =~ $reg ]] ; then

         read -p "Enter Number of Fields  : " fields

         for ((i=1;i<=$fields;i++))
          do
          read -p "Enter Name of field  : " namefield

          echo "Enter Type Of Field : "
          select type in string number
           do
           case $REPLY in 
            string)
            field+=$namefield":string,"
             break
             ;;

             number)
             field+=$namefield":number,"
            break
            ;;

            *)
            echo "name of type is error"
            break
            ;;

           esac

           done
           done

         touch $nameTable
       echo $field >>  $nameTable
       echo "Created Table Successfully!"
       else
       echo "Name of Table is error."
       fi