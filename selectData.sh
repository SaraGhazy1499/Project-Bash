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

             
                if [[ $exist -ne 0 ]] ; then

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
                                  

                }
                END { if (r =="") print "No Data is Found "; }
                '
                
                else

                echo "Synatx error , column is not exist."

                fi
                   
            ;;
            
            *)
             echo "Synatx error"
            . connectDB.sh
                break
            ;;
            
            
            
            
        esac
        
    done
    
else
    echo "Table is not exist."
    
fi

