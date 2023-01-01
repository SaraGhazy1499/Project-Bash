export LC_COLLATE=C
shopt -s extglob

select choice in updateByPrimarykey updateByColumn 
do

case $REPLY in 
 

 updateByPrimarykey)

 read -p "Enter Name Of Table : " nameTable
 read -p "Enter Primary Key : " id 
 read -p "Enter Name Column : " column 
 read -p "Enter newVal Name : "  newval

  valId=($( awk -F ":" '$1='$id  $nameTable ))

  pk=($( cut -d: -f1  $nameTable | sed -n '1p' ))


  typeset -i check=0 
  typeset -i exist=0 

        if [[ $valId -gt 0 ]] ; then

                 sed  '1,2d' $nameTable | awk -F ":"   -v id=$id -v r="" '{

                    if($1==id)
                    {
                        c=1;

                        while(c<=NF)
                        {
                            r=r $c " ";

                            c++;
                        }
                    }


                                  

                }
                END { print r ; }
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



             sed  '1,2d' -e sed -i 's/^'$oldval':$/'$newval':/g'






;;



esac 
done