cd /etc/openssh
rm -rf sshd_config
cp /home/git/education/sshd_config /etc/openssh
adduser sshuser 
passwd sshuser
usermod -aG wheel sshuser
echo "sshuser ALL=(ALL) NOPASSWRD:ALL" >> /etc/sudoers
systemctl start sshd
ssh-copy-id user@192.168.0.65 -p 2024
ssh-copy-id net_admin@192.168.0.62 -p 22
ssh-copy-id net_admin@192.168.3.30
ssh-copy-id user@192.168.0.1 -p 2024
