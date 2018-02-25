#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
sleeptime=${1:-30}
echo $sleeptime
while true
do
  ps -ef | awk '/awk/{next}/runcommand/{a=$NF;i=split(a,b,"/");printf "Playing: % ",b[i];exit}'
  sleep $sleeptime
done
