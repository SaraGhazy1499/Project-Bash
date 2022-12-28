     read -p "Enter Name of Table  : " name 
        reg="[a-zA-Z]+"
       if [ -e $name ] ; then
       echo "Table is Exist."
       elif [[ $name =~ $reg ]] ; then
       touch $name

        read -p "Enter Name of Fields  : " fields

         for ((i=1;i<=$fields;i++))
          do
          read -p "Enter Name of field  : " namefield
          select type in string number
           do
           case $REPLY in 
           string)
           echo $namefield':string'  >>  $name
           break
           ;;

            number)
            echo $namefield':number'  >>  $name
            break
            ;;

            *)
            echo "name of type is error"
            break
            ;;

           esac

           done
            done

       echo "Created Table Successfully!"
       else
       echo "Name of Table is error."
       fi