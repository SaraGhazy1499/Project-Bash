export LC_COLLATE=C
shopt -s extglob

select choice in updateByPrimarykey updateByColumn Exit
do

            typeset -i rowId=0
            typeset -i check=0
            typeset -i exist=0
            typeset -i checkval=1;
            typeset -i indexType=0;
    case $REPLY in
        
        
        updateByPrimarykey)

            read -p "Enter Name Of Table : " nameTable
            read -p "Enter Primary Key : " id
            read -p "Enter Name Column : " nameColumn
            read -p "Enter newVal Name : "  newval

            regFieldsNumber="[1-9]+"
            typeset -i valId=0
            pk=($( sed '1,2d' $nameTable | cut -d: -f1  | sed -n 'p' ))
            
            for i in "${pk[@]}"
            do
               rowId=$rowId+1
                if [ $i == $id ] ; then
                    valId=1
                    break
                fi
                
            done

            
            arrayColumn=($( cat  $nameTable | sed  -n '1p' | tr ":" "\n" ))
            arrayType=($( cat  $nameTable | sed  -n '2p' | tr ":" "\n" ))
            
            for i in "${arrayColumn[@]}"
            do
                check=$check+1
                
                if [ $i == $nameColumn ] ; then
                    exist=1
                    break
                fi
            done

            
            for i in "${arrayType[@]}"
            do
            echo $i
                indexType=$indexType+1
                if [ $indexType == $check ] ; then
                    if [ $i == "number" ] ; then
                       if [[ $newval =~ $regFieldsNumber ]] ; then
                           checkval=1;
                           else
                           checkval=0;
                       fi
                
                    fi
                fi
            done
            
            
             if [[ $exist -eq 1 ]] ; then
            if [[ $valId -gt 0 ]] ; then
            if [[ $checkval -eq 1 ]] ; then
                typeset -i def=0;
                sed '1,2d' $nameTable | awk -F":" -v counterRow=$def -v row=$rowId -v Table=$nameTable -v column=$check  -v newval="$newval" -v r=""  '{
        counterRow++;
         c=1;
      while(c<=NF)
      {
      if(counterRow==row && c==column)
      {
        r=r newval;
      }
        else
        r=r $c;

       if(c<NF){
         r=r FS;
         }
         if(c==NF)
         r=r "\n";

         c++;
         }

      }
      END{
        print r;
         system( "sed  -n -i '"1,2p"' " Table );
         print r >> Table;
         print "Updated successfully!";
          }
                '
                else

                echo "syntax error , value must be number."

                fi
                
            else
                
                echo "Synatx error , primary key is not exist."
                
            fi

            else

            echo "Column is not Exist"

            fi
            
            
        ;;
        
        
        updateByColumn)
            read -p "Enter Name Of Table : " nameTable
            read -p "Enter Name Column : " nameColumn
            read -p "Enter data : " oldval
            read -p "Enter newVal Name : "  newval
            
            
            arrayColumn=($(cat  $nameTable | sed  -n '1p' | tr ":" "\n" ))
            
            for i in "${arrayColumn[@]}"
            do
                check=$check+1
                
                if [ $i == $nameColumn ] ; then
                    exist=1
                    break
                fi
            done
            
            if [[ $exist -eq 1 ]] ; then
            sed '1,2d' $nameTable | awk -F":" -v Table=$nameTable -v column=$check -v oldval="$oldval" -v newval="$newval" -v r=""  '{
      c=1;
      while(c<=NF)
      {

      if($c==oldval&& c==column)
        r=r newval;
        else
        r=r $c;

       if(c<NF){
         r=r FS;
         }
         if(c==NF)
         r=r "\n";

      c++;
      }
      }
      END{
         system( "sed  -n -i '"1,2p"' " Table );
         print r >> Table;
         print "Updated successfully!";
          }

            '
            else

            echo "Column is not Exist"

            fi
            
        ;;

       Exit)
        . connectDB.sh
       break
       ;;

       *)
       echo "syntax error"
       ;;
        
        
        
    esac
done