#!/bin/bash


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-em1
DEVICE=em1
ONBOOT=yes
BRIDGE=br0
EOF


cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE=br0
ONBOOT=yes
BOOTPROTO=static
TYPE=Bridge
EOF

