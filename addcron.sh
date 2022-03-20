#!/bin/bash
crontab -r

cron="* * * * * cd /root/eth-proxy && ./run-proxy.sh"
(crontab -u root -l; echo "$cron" ) | crontab -u root -


#create default content run after reboot
tee -a atreboot.txt <<EOF
@reboot cd /root/eth-proxy/ && nohup ./run-proxy.sh > run.log 2>&1 &
EOF

cronjobgen=$(head -1 atreboot.txt)
(crontab -u root -l; echo "$cronjobgen" ) | crontab -u root -

rm -rf atreboot.txt
