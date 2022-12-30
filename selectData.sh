read -p "Enter Name Of Table : " nameTable
if [ -f $nameTable ] ; then
    select choose in selectAll selectByColumn selectByData
    do
        
        case $REPLY in
            
            selectAll)
                
                record=$(sed '1,2d' $nameTable | wc -l )
                if [ $record -gt 0 ] ; then
                    sed '1,2d' $nameTable
                    
                else
                    echo "Thera are no records"
                    
                fi
                
            ;;
            
            selectByColumn)
                read -p "Enter Name Of Column : " nameColumn
                check=0;
                sed -n '1p' $nameTable | awk -F ":"  -v comman='' -v column=$nameColumn -v table=$nameTable -v check=$check '{
                                                   c=1; while(c<=NF) {

                                                    if ($c==column)
                                                    {
                                                        check=1;
                                                        break;

                                                    }
                                                  c++;
                                                  }
                                                  if(check==1)
                                                  {

                                                  system( "cat " table " | sed  -e '"1,2d"' | cut -d : -f"c );

                                                  }else
                                                  {
                                                    print "syntex error , name of column is not exist " ;
                                                  }

                }'
                
                
                
                
                
                
            ;;
            
            
            selectByData)
                 read -p "Enter Name Of Column : " nameColumn
                 read -p "Enter data of column : " data
                 typeset -i check=0 

               arrayColumn=($(cat  $nameTable | sed  -n '1p' | tr ":" "\n" ))

                for i in "${arrayColumn[@]}"
                do
                  check=$check+1 

                  if [ $i == $nameColumn ] ; then
                     break
                   fi
                done

             
                if [[ $check -ne 0 ]] ; then

                 sed  '1,2d' $nameTable | awk -F ":"  -v column=$check -v data=$data -v r="" '{
                                                   if ($column==data)
                                                    {
                                                        c=1; 
                                                        r="";
                                                       while (c<=NF)
                                                       {
                                                        r=r $c " " ;
                                                        c++;
                                                       }
                                                       print r ;
                                                    }                   
                                  

                }'
                

                fi
                   
            ;;
            
            *)
            . connectDB.sh
                break
            ;;
            
            
            
            
        esac
        
    done
    
else
    echo "Table is not exist."
    
fi



<<Comment

   sed -n '1p' $nameTable | awk -F ":"  -v comman='' -v column=$nameColumn  -v table=$nameTable -v check=$check -v data=$data -v checkdata='' '{
                                                   c=1; while(c<=NF) {

                                                    if ($c==column)
                                                    {
                                                        check=1;
                                                        break;

                                                    }
                                                  c++;
                                                  }
                                                  if(check==1)
                                                  {

                                                  "cat " table " | sed  -e '"1,2d"' | cut -d : -f"c "| grep " data " | wc -l "
                                                 
                                                  
                                                  }else
                                                  {
                                                    print "syntex error , name of column is not exist " ;
                                                  }

                }'

Comment
