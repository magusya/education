cd /etc/openssh
rm -rf sshd_config
cp /home/git/education/sshd_config /etc/openssh
adduser sshuser 
passwd sshuser
usermod -aG wheel sshuser
echo "sshuser ALL=(ALL) NOPASSWRD:ALL" >> /etc/sudoers
systemctl start sshd
su sshuser
ssh-keygen -t rsa
