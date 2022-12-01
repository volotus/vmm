#!/bin/bash

#for rc.local
echo '/bin/bash /opt/set_ip.sh' >> /etc/rc.d/rc.local
chmod +x /etc/rc.d/rc.local
#check
ls -al /etc/rc.local
cat /etc/rc.local
