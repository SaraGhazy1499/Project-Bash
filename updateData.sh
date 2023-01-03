export LC_COLLATE=C
shopt -s extglob

select choice in updateByPrimarykey updateByColumn
do
    
    case $REPLY in
        
        
        updateByPrimarykey)
            
            read -p "Enter Name Of Table : " nameTable
            read -p "Enter Primary Key : " id
            read -p "Enter Name Column : " nameColumn
            read -p "Enter newVal Name : "  newval
            valId=($( awk -F ":" '$1='$id  $nameTable ))
            typeset -i rowId=0
            
            pk=($( sed '1,2d' $nameTable | cut -d: -f1  | sed -n 'p' ))
            for i in "${pk[@]}"
            do
               rowId=$rowId+1
                if [ $i == $rowId ] ; then
                    break
                fi
                
            done
            rowId=$rowId
            
            
            typeset -i check=0
            typeset -i exist=0
            
            arrayColumn=($( cat  $nameTable | sed  -n '1p' | tr ":" "\n" ))
            
            for i in "${arrayColumn[@]}"
            do
                check=$check+1
                
                if [ $i == $nameColumn ] ; then
                    exist=1
                    break
                fi
            done
            
            
            if [[ $valId -gt 0 ]] ; then
                typeset -i def=0;
                sed '1,2d' $nameTable | awk -F":" -v counterRow=$def -v row=$rowId -v Table=$nameTable -v column=$check  -v newval="$newval" -v r=""  '{
        counterRow++;
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
         print r ;
          }
                '
                
            else
                
                echo "Synatx error , column is not exist."
                
            fi
            
            
        ;;
        
        
        updateByColumn)
            read -p "Enter Name Of Table : " nameTable
            read -p "Enter Name Column : " nameColumn
            read -p "Enter data : " oldval
            read -p "Enter newVal Name : "  newval
            
            typeset -i check=0
            typeset -i exist=0
            
            arrayColumn=($(cat  $nameTable | sed  -n '1p' | tr ":" "\n" ))
            
            for i in "${arrayColumn[@]}"
            do
                check=$check+1
                
                if [ $i == $nameColumn ] ; then
                    exist=1
                    break
                fi
            done
            
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
            
        ;;
        
        
        
    esac
done