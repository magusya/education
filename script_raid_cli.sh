apt-get update
apt-get install nfs-clients
systemctl enable --now nfs-client.target
mkdir /mnt/nfs
mount -t nfs 192.168.0.1:/raid5/nfs /mnt/nfs
systemctl restart nfs
echo "192.168.0.1:/raid5/nfs	/mnt/nfs	nfs	auto	0	0" >> /etc/fstab