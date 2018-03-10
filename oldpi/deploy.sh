#!/bin/bash
# deploy file from repo to their inteded destination
hdir="/home/pi"
#copy files
RSYNC_OPTS="-av -c "
sudo rsync ${RSYNC_OPTS} ./system/myled.service     /etc/systemd/system/
sudo rsync ${RSYNC_OPTS} ./etc/rsyslog.d/myled.conf /etc/rsyslog.d/
sudo rsync ${RSYNC_OPTS} ./etc/rsyslog.conf         /etc/
rsync ${RSYNC_OPTS} ./klaus/*                       ${hdir}/klaus/
rsync ${RSYNC_OPTS} ./bin/killall.sh                ${hdir}/bin/
rsync ${RSYNC_OPTS} ./bin/runall.sh                 ${hdir}/bin/
# adjust permissions
chmod  755 ${hdir}/bin/* ${hdir}/klaus/* 
sudo chown root:root /etc/systemd/system/myled.service  /etc/rsyslog.d/myled.conf
sudo chmod  755 /etc/rsyslog.d /etc/systemd/system/myled.service
sudo chmod  755 /etc/rsyslog.d
sudo systemctl daemon-reload
sudo systemctl enable myled
sudo systemctl restart myled
