#!/bin/bash
scr_dir="/var/log"
target_dir="/opt/backups"

filename="log_backup_$(date +%d-%m-%Y-%H-%M).tar.gz"

backup_cre(){

if [ -d "$target_dir" ]; then
  find "$target_dir"  -type f -mtime +5 -delete
  cd $target_dir
  tar  -czf "$filename" "$scr_dir"
  echo "Backup have completed sucessfully, file name is: $target_dir$filename"
else
  echo "unable to create the backup...?"

fi
}

if [ -d "$scr_dir" ];
then
 echo "Source directory is exit"
else
  echo "source directory is not exit"

 exit 1
fi

if [ -d "$target_dir" ]; then
         backup_cre
else
  echo "target directory is not exit. creating $target_dir..."
  mkdir -p "$target_dir"
  backup_cre

fi

