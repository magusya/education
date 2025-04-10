rm -rf /etc/chrony.conf
cp /home/git/education/chronyclient.conf /etc/chrony.conf
systemctl restart chronyd.service
chrony sources
