reg="^[a-zA-Z_$]+[a-zA-Z0-9_$]*"
field=""
typeField=""
error=0
read -p "Enter Name of Table  : " nameTable
if [ -e $nameTable ] ; then
    echo "Table is Exist."
    elif [[ $nameTable =~ $reg ]] ; then
    
    read -p "Enter Number of columns  : " fields
    
    regFieldsNumber="[1-9]+"
    if [[ $fields =~ $regFieldsNumber ]] ; then
        
        echo "your first field will be primary key ."
        
        typeField+="primary key"
        for ((i=1;i<=$fields;i++))
        do
            read -p "Enter Name of field  : " namefield
            field+=$namefield
            
            if [ $i -ne $fields ] ; then
                field+=":"
            fi
            
            
            if [ $i -ne 1 ] ; then
                echo "Enter Type Of Field : "
                select type in string number
                do
                    case $REPLY in
                        string)
                            typeField+=":string"
                            break
                        ;;
                        
                        number)
                            typeField+=":number"
                            break
                        ;;
                        
                        *)
                            echo "syntax error"
                            error=1
                            . connectDB.sh
                            break
                        ;;
                        
                    esac
                    
                done
            fi
            
            
            if [ $error -eq 1 ] ; then
                
                break
            fi
            
        done
        
        if [ $error -eq 0 ] ; then
            touch $nameTable
            echo $field >>  $nameTable
            echo $typeField >>  $nameTable
            echo "Created Table Successfully!"
        else
            break
        fi
        
    else
        echo "syntax error, type of field should be number ."
    fi
    
else
    echo "synta error , Name of Table is error."
fi



