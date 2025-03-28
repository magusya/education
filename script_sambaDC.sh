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
cd /etc/systemd
sed -i 's/#DNSSubListener=yes/DNSStubListener=no/' resolved.conf
systemctl restart systemd-resolved
samba-tool domain provision 
echo "ip 192.168.0.1"
cd /etc
hostnamectl set-hostname br-srv.au-team.irpo
domainname br-srv.au-team.irpo
