#!/bin/bash

cp -r /etc/sysconfig/network-scripts/  /tmp/

cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-bond0
DEVICE=bond0
NAME=bond0
ONBOOT=yes
TYPE=Bond
BOOTPROTO=none
BONDING_MASTER=yes
BRIDGE=br0
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
ONBOOT=yes
BOOTPROTO=static
TYPE=Bridge
EOF



# restart the network
#/etc/init.d/network restart
