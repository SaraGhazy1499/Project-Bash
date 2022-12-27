#!/usr/bin/bash

select choice in Create_DB List_DB Drop_DB Connect_DB Exit
do
case $REPLY in 
1)
 echo "create_DB"
;;
2)
 echo "List_DB"
;;
3)
 echo "Drop_DB"
;;
4)
echo "Connect_DB"
;;
5)
break
esac
done
