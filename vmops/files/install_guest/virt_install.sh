#!/bin/bash

#Usage: ./virt_install.sh domain_name
#Author: Zez


SITE=http://192.168.122.1
IMG_DIR=/mcloud
IMG_LOC=${IMG_DIR}/vm-images
IMG_SIZE=300
CPU=4
MEMORY=4096
DEVICE=virbr0

LOCATION=$SITE/centos/
KS_FILE=$SITE/ks/ks.cfg

qemu-img create -f qcow2 $IMG_LOC/${1}.qcow2 ${IMG_SIZE}G

virt-install \
--name ${1} \
--vcpus $CPU \
--memory $MEMORY \
--disk path=$IMG_LOC/${1}.qcow2,size=$IMG_SIZE,bus=virtio,driver_type=qcow2 \
--os-type linux \
--os-variant rhel7 \
--network bridge:$DEVICE,model=virtio \
--graphics none \
--console pty,target_type=serial \
--location $LOCATION \
--extra-args "ks=$KS_FILE console=ttyS0,115200n8 serial"

