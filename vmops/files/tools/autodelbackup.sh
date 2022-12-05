
#find /data/backup -name 'atop_*' -mtime +"$LOGGENERATIONS" -exec rm {} \;

find /data/backup  -type d -ctime +30 | xargs rm -rf
