apt-get update
apt-get install ufw
systemctl start ufw
systemctl start docker
ufw allow 53
docker run --name wiki -p 8080:80 -d mediawiki
