#!/bin/bash
# Author    : Zez Wang
# Mail      : ber1956@gmail.com


export PATH="/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin"
#--mkfs the disk

mkdir -p /data2
echo y | mkfs.ext4 /dev/vdc

#--write to the fstab
cat >> /etc/fstab << EOF
/dev/vdc             /data2        ext4            defaults,nofail                0 0
EOF


mount -a
df -h
