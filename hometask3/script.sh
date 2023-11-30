#!/bin/bash 
sudo yum update -y 
sudo yum install mc vim git httpd cronie -y 
sudo service httpd start 
sudo systemctl enable httpd 
 
echo 'date >> /var/log/sysinfo 
w >> /var/log/sysinfo 
free -m >> /var/log/sysinfo 
df -h >> /var/log/sysinfo 
ss -tulpn >> /var/log/sysinfo 
ping -c1 -w1 ukr.net >> /var/log/sysinfo 
find / -type f -perm /4000 >> /var/log/sysinfo' >> /root/sysinfo.sh 
 
chmod -v +x /root/sysinfo.sh &>/tmp/chmod.log 
 
echo ' * * * * 1-5 root /root/sysinfo.sh' >> /etc/crontab 
 
sudo service crond restart