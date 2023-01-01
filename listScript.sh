#!/usr/bin/bash
 path=$(pwd)
 folders=$(ls -d $path/ | wc -l )

if [ $folders -gt 0  ] ;then

  ls -d */
 
else 
  echo "this Database is not found"

fi
