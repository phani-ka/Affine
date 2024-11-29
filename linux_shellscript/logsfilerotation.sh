#!/bin/bash

read "Enter the path:" path

max_siz=1

if [ $(wc -c < "$path") -gt $max_size];
then 
   mv "$path" "$path-file"
   echo "file have created"
else
   echo "file is under the $max_size"
fi
