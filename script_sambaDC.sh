#!/bin/bash

apt-get update
apt-get install -y task-samba-dc
apt-get install -y nano
cd /etc
rm -rf named.conf
mv /home/git/education/named.conf /etc
rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol
systemctl stop bind
systemctl disable bind
systemctl start samba
systemctl enable samba
cd /etc/systemd
sed -i 's/#DNSSubListener=yes/DNSStubListener=no/' resolved.conf
systemctl restart systemd-resolved
echo "
Realm:BR-SRV.AU-TEAM.IRPO
Domain:AU-TEAM.IRPO
DNS forwarder 192.168.0.1"
samba-tool domain provision 
cd /etc
hostnamectl set-hostname br-srv.au-team.irpo
domainname br-srv.au-team.irpo
nslookup br-srv.au-team.ipro
echo " если nslookup не работает, то пропиши systemctl reboot и попробуй еще раз"
