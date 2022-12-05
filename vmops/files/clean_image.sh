#!/bin/bash

> /etc/sysconfig/network-scripts/ifcfg-eth0

rm -f /var/log/secure-*
rm -f /var/log/spooler-*
rm -f /var/log/maillog-*
rm -f /var/log/messages-*
rm -f /var/log/cron-*
rm -rf /var/log/history/
rm -rf /var/log/sa/*

cd /var/log/
> boot.log
> dmesg
> dmesg.old
> lastlog
> messages
> maillog
> secure
> yum.log
> audit/audit.log 
> cron

#rm -rf /etc/ssh/ssh_host_*
yum clean all
rm -rf /tmp/*
rm -rf /var/tmp/*
for logfile in `find /var/log/ -type f `;do > $logfile ; done
for logfile in `find /var/cache/ -type f `;do > $logfile ; done
rm -f .viminfo .bash_history
history -c
