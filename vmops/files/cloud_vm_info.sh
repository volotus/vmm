#!/bin/bash

node_name=`virsh hostname`
node_ip=$(ifconfig br0|grep 'inet'|grep -v 'inet6'|awk '{print $2}'|tr -d ' ')
node_info=`virsh nodeinfo`
all_host=`virsh list --all | egrep 'running|off' | awk '{print $2}'`
running_host=`virsh list --all | grep 'running' | awk '{print $2}'`
running_cpu=0
running_memory=0
all_vm_cpu=0
all_vm_memory=0

echo "=== All vms info ==="

for i in $all_host
do
  current_cpu=`virsh dominfo $i | grep 'CPU(s)' | awk '{print $2}'`
  ((all_vm_cpu=$all_vm_cpu + $current_cpu))
  current_memory=`virsh dominfo $i | grep 'Used memory' | awk '{print $3}'`
  ((current_memory_gb=($current_memory) / 1048576 ))
  ((all_vm_memory=$all_vm_memory + $current_memory))
  echo "$i : ${current_cpu}c${current_memory_gb}g"
done

#host cpu mem
host_cpu=`virsh nodeinfo | grep 'CPU(s)' | awk '{print $2}'`
host_memory=`virsh nodeinfo | grep 'Memory size' | awk '{print $3}'`
((reserve_cpu=($host_cpu - $all_vm_cpu) ))
((host_memory_gb=($host_memory) / 1048576 ))
((all_vm_memory_gb=($all_vm_memory) / 1048576 ))
((reserve_memory=($host_memory - $all_vm_memory) / 1048576 ))

echo ""
echo "=== The Node info ==="
echo "node_name: $node_name, $node_ip"
echo "vcpus: ${host_cpu}, vcpus_used: ${all_vm_cpu}, vcpus_reserved: ${reserve_cpu}"
#echo "vcpus_used: ${all_vm_cpu}"
#echo "vcpus_reserved: ${reserve_cpu}"
echo "memory: ${host_memory_gb} GiB, memory_used: ${all_vm_memory_gb} GiB, memory_free: ${reserve_memory} GiB"
#echo "memory_used: ${all_vm_memory_gb} Gb"
#echo "memory_free: ${reserve_memory} Gb"
