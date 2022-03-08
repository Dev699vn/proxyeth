#!/bin/bash
crontab -r

cron="* * * * * cd /root/eth-proxy && ./cron.sh"
(crontab -u root -l; echo "$cron" ) | crontab -u root -

