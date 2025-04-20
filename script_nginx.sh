apt-get install nginx -y
systemctl enable --now nginx
systemctl stop ahttpd 
rm -rf /etc/nginx/nginx.conf 
cp /home/git/education/nginx.conf /etc/nginx/nginx.conf
systemctl restart nginx
