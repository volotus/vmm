#!/bin/bash
# Author    : Zez Wang
# Mail      : ber1956@gmail.com


export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin"
#--mkfs the disk

mkdir -p /data
echo y | mkfs.xfs /dev/vdb

#--write to the fstab
cat >> /etc/fstab << EOF
/dev/vdb             /data        xfs            defaults,nofail                0 0
EOF


mount -a
df -h
