#write a script to rotate log file to prevent them from growing too large.


#!/bin/bash
log_file="/var/log/logfile.log"
maz_size=100000

if [ $(wc -c < "$log_file") -gt $max_size ];
then
  mv "$log_file" "$log_file.old"
  touch $logfile
fi