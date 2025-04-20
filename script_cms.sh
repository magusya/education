apt-get update
apt-get update
apt-get install apache2
apt-get install php8.1
apt-get remove php8.0
apt-get install php8.1-mysqli php8.1-xml php8.1-intl php8.1-zip php8.1-curl php8.1-mbstring php8.1-soap php8.1-ldap php8.1-bcmath 
apt-get install apache2-mod_php8.1
systemctl enable –now httpd2
systemctl start mariadb
mysql_secure_installation
mysql -u root -p
create database moodledb character set utf8mb4 collate utf8mb4_unicode_ci;
create user ‘moodle’@’localhost’ identified by ‘password’;
grant all privileges on moodledb.* to ‘moodle’@’localhost’;
flush privileges;
exit;
git clone git://git.moodle.org/moodle.git (если выскакивает ошибка попробуйте еще несколько раз, должно заработать)
cd moodle
git branch -a
git branch --track MOODLE_405_STABLE origin/MOODLE_405_STABLE
git checkout MOODLE_405_STABLE
cd
cp -R moodle /var/www/html/
mkdir /var/moodledata
chmod 777 /var/moodledata
chown -R apache2:apache2 /var/www/html/moodle
chmod -R 755 /var/www/html/moodle
rm -rf /etc/httpd2/conf/sites-available/moodle.conf
cp /home/education/moodle.conf /etc/httpd2/conf/sites-available/moodle.conf
ln -s /etc/httpd2/conf/sites-available/moodle.conf /etc/httpd2/conf/sites-enabled/
apachectl configtest
echo "max_input_vars = 5000" >> /etc/php/8.1/apache2-mod_php/php.ini
systemctl restart httpd2