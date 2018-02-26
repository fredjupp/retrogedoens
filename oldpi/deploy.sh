#!/bin/bash
# deploy file from repo to their inteded destination
hdir="/home/pi"
#copy files
sudo rsync -av ./system/myled.service     /etc/systemd/system/
sudo rsync -av ./etc/rsyslog.d/myled.conf /etc/rsyslog.d/
sudo rsync -av ./etc/rsyslog.conf         /etc/
rsync -av ./klaus/*                       ${hdir}/klaus/
rsync -av ./bin/killall.sh                ${hdir}/bin/
rsync -av ./bin/runall.sh                 ${hdir}/bin/
# adjust permissions
chmod  755 ${hdir}/bin/* ${hdir}/klaus/* /opt/retropie/configs/all/runcommand-on*.sh
sudo chown root:root /etc/systemd/system/myled.service  /etc/rsyslog.d/myled.conf
sudo chmod  755 /etc/rsyslog.d /etc/systemd/system/myled.service
sudo chmod  755 /etc/rsyslog.d
sudo systemctl daemon-reload
sudo systemctl enable myled
sudo systemctl restart myled
