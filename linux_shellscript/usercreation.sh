#!/bin//bash
action=$1
username=$2

case $action in
   "add")
        useradd  $username
    ;;
    "delete")
        userdel  $username
    *)
      echo "usage: $0 {add|modify|delete} username"

     exit 1
     ;;
esac