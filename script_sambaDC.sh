#!/bin/bash

apt-get update
apt-get install -y task-samba-dc
apt-get install -y nano
cd /etc
rm -rf named.conf
cd /systemd
rm -rf resolved.conf
mv /home/git/education/named.conf /etc
mv /home/git/education/resolved.conf /etc/systemd
rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol
systemctl stop bind
systemctl disable bind
systemctl restart systemd-resolved
echo "
Realm:BR-SRV.AU-TEAM.IRPO
Domain:AU-TEAM.IRPO
DNS forwarder 192.168.0.1"
samba-tool domain provision 
echo -e "BR-SRV.AU-TEAM.IRPO\AU-TEAM.IRPO\192.168.0.1" | /home/git/education/script_sambaDC.sh
cd /etc
hostnamectl set-hostname br-srv.au-team.irpo
domainname br-srv.au-team.irpo
nslookup br-srv.au-team.ipro
systemctl enable --now samba
cp /var/lib/samba/private/krb5.conf /etc/krb5.conf
systemctl restart network
echo "пропиши systemctl reboot для перезагрузки, а после smbclient -L br-srv.au-team.irpo -U Administrator"
