cd /etc/openssh
rm -rf sshd_config
cp /home/git/education/sshd_config /etc/openssh
systemctl start sshd
