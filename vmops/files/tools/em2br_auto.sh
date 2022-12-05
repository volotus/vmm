#!/bin/bash

DIR="/etc/sysconfig/network-scripts/"
Interface3=ifcfg-em3

echo "get ip config"
IPADDR=`grep -i 'ipaddr'   $DIR/$Interface3 |cut -d '=' -f 2 `
GATEWAY=`grep -i 'gateway' $DIR/$Interface3 |cut -d '=' -f 2 `
NETMASK=`grep -i 'netmask' $DIR/$Interface3 |cut -d '=' -f 2`
echo $IPADDR $GATEWAY $NETMASK

cp /etc/sysconfig/network-scripts/ifcfg-em3 /tmp

setup_birdge_em3 () {
   FILE_IFCFG_BR0="/etc/sysconfig/network-scripts/ifcfg-br0"
   cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-br0
DEVICE="br0"
ONBOOT=yes
BOOTPROTO=static
NM_CONTROLLED="no"
TYPE=Bridge
EOF
echo IPADDR=${IPADDR}  >> $FILE_IFCFG_BR0
echo NETMASK=${NETMASK} >> $FILE_IFCFG_BR0
echo GATEWAY=${GATEWAY} >> $FILE_IFCFG_BR0

    cat <<EOF > /etc/sysconfig/network-scripts/ifcfg-em3
DEVICE="em3"
ONBOOT=yes
BRIDGE=br0
EOF
}

#configure a bridge
setup_birdge_em3

# restart the network
#/etc/init.d/network restart

echo '/etc/sysconfig/network-scripts/ifcfg-em3'
cat /etc/sysconfig/network-scripts/ifcfg-em3
echo '/etc/sysconfig/network-scripts/ifcfg-br0'
cat /etc/sysconfig/network-scripts/ifcfg-br0

