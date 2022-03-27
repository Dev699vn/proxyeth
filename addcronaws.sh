#!/bin/bash
crontab -r

cron="* * * * * cd /home/ubuntu/eth-proxy && ./cron.sh"
(crontab -u ubuntu -l; echo "$cron" ) | crontab -u ubuntu -


#create default content run after reboot
tee -a atreboot.txt <<EOF
@reboot cd /home/ubuntu/eth-proxy && ./run-proxy.sh 2>&1 &
EOF

cronjobgen=$(cat atreboot.txt)
(crontab -u ubuntu -l; echo "$cronjobgen" ) | crontab -u ubuntu -

rm -rf atreboot.txt
