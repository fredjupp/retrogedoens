#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
# start all scripts for the led matrix 
#
PIDFile=/home/pi/run/runall.pid
date >> /tmp/runall.date
echo $$ > ${PIDFile}
#lsmod | grep spt
cd /home/pi/klaus
#sleep 10
#python init.py
sleep 10
#python inputloop.py &
#echo $! >> ${PIDFile}
#sleep 2
#printf "Willkommen/welcome " > pipe
printf "Willkommen/welcome " | logger -t MYLED
sleep 1
for x in $(ls -1 scripts/*.sh)
do
  #$x >pipe $(shuf -i 30-120 -n 1) &
  $x  $(shuf -i 30-120 -n 1) | logger -t MYLED &
  echo $! >> ${PIDFile}
  sleep 5
done
wait
