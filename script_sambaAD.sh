#!/bin/bash

samba-tool user create user1.hq "P@ssw0rd" --home-directory=/home/AU-TEAM/user1.hq --uid=user1.hq
samba-tool user create user2.hq "P@ssw0rd" --home-directory=/home/AU-TEAM/user2.hq --uid=user2.hq
samba-tool user create user3.hq "P@ssw0rd" --home-directory=/home/AU-TEAM/user3.hq --uid=user3.hq
samba-tool user create user4.hq "P@ssw0rd" --home-directory=/home/AU-TEAM/user4.hq --uid=user4.hq
samba-tool user create user5.hq "P@ssw0rd" --home-directory=/home/AU-TEAM/user5.hq --uid=user5.hq
samba-tool group create hq
samba-tool group addmembers "hq" user1.hq,user2.hq,user3.hq,user4.hq,user5.hq
samba-tool group addmembers "Account Operators" user1.hq,user2.hq,user3.hq,user4.hq,user5.hq
samba-tool group addmembers "Allowed RODC Password Replication Group" user1.hq,user2.hq,user3.hq,user4.hq,user5.hq

chsh -s /bin/rbash user1.hq
chsh -s /bin/rbash user2.hq
chsh -s /bin/rbash user3.hq
chsh -s /bin/rbash user4.hq
chsh -s /bin/rbash user5.hq

sudo mkdir /home/<user1.hq>/bin
sudo chmod 755 /home/<user1.hq>/bin

sudo mkdir /home/<user2.hq>/bin
sudo chmod 755 /home/<user2.hq>/bin

sudo mkdir /home/<user3.hq>/bin
sudo chmod 755 /home/<user3.hq>/bin

sudo mkdir /home/<user4.hq>/bin
sudo chmod 755 /home/<user4.hq>/bin

sudo mkdir /home/<user5.hq>/bin
sudo chmod 755 /home/<user5.hq>/bin

echo "PATH=$HOME/bin" >> /home/user1.hq/.bashrc
echo "export PATH" >> /home/user1.hq/.bashrc

echo "PATH=$HOME/bin" >> /home/user2.hq/.bashrc
echo "export PATH" >> /home/user2.hq/.bashrc

echo "PATH=$HOME/bin" >> /home/user3.hq/.bashrc
echo "export PATH" >> /home/user3.hq/.bashrc

echo "PATH=$HOME/bin" >> /home/user4.hq/.bashrc
echo "export PATH" >> /home/user4.hq/.bashrc

echo "PATH=$HOME/bin" >> /home/user5.hq/.bashrc
echo "export PATH" >> /home/user5.hq/.bashrc

sudo ln -s /bin/cat /home/user1.hq/bin/cat
chattr +i /home/user1.hq/.bashrc

sudo ln -s /bin/cat /home/user2.hq/bin/cat
chattr +i /home/user2.hq/.bashrc

sudo ln -s /bin/cat /home/user3.hq/bin/cat
chattr +i /home/user3.hq/.bashrc

sudo ln -s /bin/cat /home/user4.hq/bin/cat
chattr +i /home/user4.hq/.bashrc

sudo ln -s /bin/cat /home/user5.hq/bin/cat
chattr +i /home/user5.hq/.bashrc
