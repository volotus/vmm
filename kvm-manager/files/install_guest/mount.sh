
yum install httpd -y

cd /var/www/html/
mkdir centos
mkdir ks

mkdir -p /opt/cloud/iso
cd  /opt/cloud/iso

wget https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-DVD-2009.iso

#https://mirrors.aliyun.com/centos/7.9.2009/isos/x86_64/CentOS-7-x86_64-Minimal-2009.iso
#
#07b94e6b1a0b0260b94c83d6bb76b26bf7a310dc78d7a9c7432809fb9bc6194a  CentOS-7-x86_64-Minimal-2009.iso
#e33d7b1ea7a9e2f38c8f693215dd85254c3a4fe446f93f563279715b68d07987  CentOS-7-x86_64-DVD-2009.iso

mount -o loop /opt/cloud/iso/CentOS-7-x86_64-DVD-2009.iso /var/www/html/centos/

service httpd restart
curl http://192.168.122.1/ks/ks.cfg

#sudo pip install --upgrade urllib3
#setenforce 0
#service iptables stop
#service firewalld stop
#chmod 644 ks/ks.cfg
#find /var/www -type d -exec chmod 755 {} \;
#find /var/www -type f -exec chmod 644 {} \;
