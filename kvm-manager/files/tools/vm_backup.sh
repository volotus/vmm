#!/bin/bash
export PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:$PATH

echo "begin--"`date`
now_time="`date +%Y%m%d%H%M`"

vmName=$1
rsync_ip=$2
rsync_dir=$3


#for instance qcow file backup
blklist=$(virsh domblklist "$vmName" | awk 'NR>=3{if($2 != "-" && NF>=1) print $2}')
xml_file=/etc/libvirt/qemu/$vmName.xml
du -sh $blklist
backupdir="${vmName}_${now_time}"

rsync -av  $xml_file $blklist  ${rsync_ip}::$rsync_dir/$backupdir/

echo "end--"`date`
