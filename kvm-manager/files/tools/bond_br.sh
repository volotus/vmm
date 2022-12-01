#!/bin/bash

cp -r /etc/sysconfig/network-scripts/  /tmp/

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
NAME=br0
BOOTPROTO=static
IPADDR=$1
GATEWAY=$2
PREFIX=26
ONBOOT=yes
NM_CONTROLLED="no"
TYPE=Bridge
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond0
DEVICE=bond0
NAME=bond0
TYPE=Bond
BONDING_MASTER=yes
ONBOOT=yes
BOOTPROTO=none
BONDING_OPTS="mode=1 miimon=100"
NM_CONTROLLED="no"
BRIDGE=br0
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-em1
DEVICE=em1
NAME=bond0-slave
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes
MASTER=bond0
SLAVE=yes
NM_CONTROLLED="no"
EOF

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-em2
DEVICE=em2
NAME=bond0-slave
TYPE=Ethernet
BOOTPROTO=none
ONBOOT=yes
MASTER=bond0
SLAVE=yes
NM_CONTROLLED="no"
EOF


systemctl stop NetworkManager.service     #
systemctl disable NetworkManager.service  # 

#/etc/init.d/network restart
echo "Run    /etc/init.d/network restart    "
