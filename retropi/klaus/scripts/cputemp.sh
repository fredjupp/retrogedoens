#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
sleeptime=${1:-30}
while true
do
if [[ -f "/opt/vc/bin/vcgencmd" ]]; then
    if gpuTempC=$(/opt/vc/bin/vcgencmd measure_temp); then
        gpuTempC=${gpuTempC:5:2}
    else
        gpuTempC=""
    fi
fi
cpuTempC=$(($(cat /sys/class/thermal/thermal_zone0/temp)/1000))
outcp437="$(echo "Temperatur...: CPU: $cpuTempC°C GPU: $gpuTempC°C "| iconv -f utf-8  -t CP437 )"
printf "${outcp437}"
sleep $sleeptime
done
