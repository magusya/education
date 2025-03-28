#!/bin/bash

apt-get update
apt-get install -y task-samba-dc
apt-get install -y nano
cd /etc
sed -i 's8//listen-on port 53{any;};/' named.conf
sed -i 's9//allow-query{any;};/' named.conf
sed -i 's10//dnssec-validation on;/' named.conf
sed -i 's11//key-gssari-keytab"/var/lib/samba/binddns/dbs.keytab/"/' named.conf
sed -i 's12//minimal-responses yes;/' named.conf
sed -i 's13//forwardes {192.168.0.1;};/' named.conf

rm -f /etc/samba/smb.conf
rm -rf /var/lib/samba
rm -rf /var/cache/samba
mkdir -p /var/lib/samba/sysvol
cd /etc/systemd/resolved.conf
sed -i 's/#DNSSubListener=yes/DNSStubListener=no/' resolved.conf
systemctl restart systemd-resolved
samba-tool domain provision --userfc2307 --interactive
echo"ip 192.168.0.1"
cd /etc/hostname
hostnamectl set-hostname br-srv.au-team.irpo
domainname br-srv.au-team.irpo
