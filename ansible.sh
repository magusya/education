apt-get update
apt-get install nano
apt-get install ansible -y
cp /home/git/education/inv  /etc/ansible
ansible all -i /etc/ansible/inv -m ping
