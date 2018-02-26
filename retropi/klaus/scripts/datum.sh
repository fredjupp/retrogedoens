#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
sleeptime=${1:-30}
while true
do
  gawk 'BEGIN{printf "%s ",strftime("%d-%m-%Y %H:%M:%S" ,systime())}'
  sleep $sleeptime
done

