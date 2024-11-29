#!/bin/bash

#logfile="/var/logs/syslog"
logfile="/var/log/sssd/sssd.log"


keyword="ERROR"

grep $keyword $logfile > errorfile.text | cat 

