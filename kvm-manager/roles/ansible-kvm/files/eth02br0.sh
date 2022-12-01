#!/bin/bash


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-eth0
DEVICE=eth0
ONBOOT=yes
BRIDGE=br0
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
ONBOOT=yes
BOOTPROTO=static
TYPE=Bridge
EOF

