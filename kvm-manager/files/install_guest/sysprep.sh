virt-sysprep --enable customize,flag-reconfiguration,passwd-backups,backup-files,ca-certificates,dhcp-server-state,firewall-rules,kerberos-data,puppet-data-log,rh-subscription-manager,tmp-files,abrt-data,bash-history,blkid-tab,crash-data,cron-spool,dhcp-client-state,dovecot-data,logfiles,lvm-uuids,machine-id,mail-spool,net-hostname,net-hwaddr,pacct-log,package-manager-cache,pam-data,rhn-systemid,rpm-db,samba-db-log,script,smolt-uuid,ssh-hostkeys,sssd-db-log,udev-persistent-net,utmp,yum-uuid --domain centos76


ssh-userdir * Remove ".ssh" directories in the guest
user-account   Remove the user accounts in the guest

w=$(virt-sysprep --list-operations | egrep -v 'fs-uuids|lvm-uuids|ssh-userdir' | awk '{ printf "%s,", $1}' | sed 's/,$//') echo "$w"
 virt-sysprep --list-operations | egrep -v 'fs-uuids|lvm-uuids|ssh-userdir' | awk '{ printf "%s,", $1}'



virt-sparsify --compress  centos76_v1.qcow2 centos76.qcow2 --tmp /data/tmp/

virt-sparsify --compress centos79_ori.qcow2 centos79.qcow2 --tmp /tmp


/usr/bin/rsync -vrtop --progress /mcloud/vm-images/* 10.10.100.100::mcloud/vm-images/



#  virt-sparsify --compress centos79_v2.qcow2  centos79.qcow2 --tmp /tmp
[   0.1] Create overlay file in /tmp to protect source disk
[   0.1] Examine source disk
[   2.5] Fill free space in /dev/sda1 with zero
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ --:--
[   5.0] Fill free space in /dev/sda2 with zero
 100% ⟦▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒⟧ 00:00
[1834.8] Copy to destination and make sparse

[5343.6] Sparsify operation completed with no errors.
virt-sparsify: Before deleting the old disk, carefully check that the
target disk boots and works correctly.
