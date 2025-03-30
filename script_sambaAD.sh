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

