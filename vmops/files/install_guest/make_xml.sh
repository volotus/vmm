#virsh attach-interface centos76 --type bridge --source br1  --config

#[root@wx-mcloud-1 ansibleops]# virsh capabilities

#Valid memory units include:
#GB for gigabytes (109 or blocks of 1,000,000,000 bytes)
#G or GiB for gibibytes (230 or blocks of 1,073,741,824 bytes)

function set_xml
{
    newdomain=$1
    cpucount=$2
    guestmem=$3
    virsh setvcpus $domain --count $cpucount --maximum --config > /dev/null
    virsh setvcpus $domain --count $cpucount --config > /dev/null
    virsh setmaxmem $domain --config $guestmem > /dev/null
    virsh setmem    $domain --config $guestmem > /dev/null
    virsh domrename $domain $newdomain
    virsh dumpxml   $newdomain > xml/$newdomain.xml
    virsh domrename $newdomain $domain
}

mkdir -p xml
domain=centos79

set_xml centos79_2c4g  2 4GiB
set_xml centos79_2c8g  2 8GiB
set_xml centos79_4c8g  4 8GiB
set_xml centos79_4c16g 4 16GiB
set_xml centos79_8c16g 8 16GiB
set_xml centos79_8c32g 8 32GiB
