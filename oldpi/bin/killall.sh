#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
# kill all scripts for the led matrix 
#
PIDFile=/home/pi/run/runall.pid
if [ -f ${PIDFile} ] 
then
  cat ${PIDFile} | xargs -r kill
  rm -f ${PIDFile}
fi
