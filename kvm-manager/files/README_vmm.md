Virtual Machine Manager (VMM) is a management tool for the virtualized datacenter, enabling you to configure and manage your virtualization host, networking, and storage resources.


##使用方法

将 `vmm` 程序放到 `/usr/sbin/`，并增加可执行权限

- `vmm -a    |  display all the vm info`
- `vmm -d    |  display the vm disk`
- `vmm -i    |  display the vm ip`
- `vmm -s    |  display the total resources`
- `vmm -n    |  display the node information` 
- `vmm -b    |  start the domain at boot`
- `vmm -h    |  display the help`
- `vmm -v    |  display the version`

- `stop        |  vmm stop domain`
- `start       |  vmm start domain`
- `stopall     |  vmm stopall`
- `startall    |  vmm startall`
- `setcpu      |  vmm setcpu domain 2`
- `setmem      |  vmm setmem domain 8G`
- `setdisk     |  vmm setdisk domain data2 2T vdb/vdc/vdd ...`


   

#可以查看虚拟机所有磁盘
virsh domblklist cos

#永久移除vdb磁盘
virsh detach-disk cos vdb --persistent

下面给cos这台虚拟机添加网卡，使用virtio类型的网卡，网络模式为桥接

virsh attach-interface --domain cos --type bridge --source br1 --model virtio --persistent

可以查看新添加的网卡，及其mac地址
virsh domiflist cos

根据mac地址移除网卡
#virsh detach-interface cos bridge 52:54:00:a2:29:2a --persistent 
