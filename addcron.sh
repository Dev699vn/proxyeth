#!/bin/bash
crontab -r
rm -rf cronjobcmd.txt

tee -a cronjobcmd.txt <<EOF
* * * * * cd /root/eth-proxy/ && sh cronjob.sh
EOF

cron="* * * * * cd /home/root && ./cron.sh"
(crontab -u root -l; echo "$cron" ) | crontab -u root -

