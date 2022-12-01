
function list_domains() {
  virsh list --all | grep off | awk '{ print $2}'
}


list_domains | while read vmName; do
ip=$(virt-cat -d $vmName /etc/sysconfig/network-scripts/ifcfg-eth0)
echo $vmName -- $ip
#virsh autostart $vmName
done
