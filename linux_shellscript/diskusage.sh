#!/bin/bash
threshold=70


current_usage=$(df -h| grep /| awk '{print$5}' |sed 's/%//g')

disk_details(){
   h_usage=$(df -h| grep /| awk '{print$5}' |sed 's/%//g' | sort -n | tail -1)
   d_d=$(df -h | grep $i% )
   if [ $h_usage -eq $i ];
    then
     echo "currently high usage disk details:\n $d_d"
   fi

}

for i in $current_usage
do
  if [ $i -gt $threshold ];
    then
     echo "disk is crossed $treshold"
    else
     # echo "disk is not croseed"
      disk_details
    fi
done
