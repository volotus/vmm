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


   