#!/bin/bash
#
PATH=/home/pi/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/games:/usr/games:/home/pi/bin
export PATH
sleeptime=${1:-300}
while true
do
 # outcp437="$(python /home/pi/klaus/weather.py | iconv -c -f utf-8  -t CP437 )"
#  python /home/pi/klaus/weather.py | iconv -c -f utf-8 -t CP437
curl -s http://open.live.bbc.co.uk/weather/feeds/en/2934691/3dayforecast.rss | 
awk -F"<|>" '/title/{print $3}' | iconv -c -f utf-8  -t CP437
#  printf "${outcp437}"
  sleep $sleeptime
done
