# Droit d acces
chown -R www-data /var/www/*
chown -R 755 /var/www/*

mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=jode-vri/CN=localhost"

# NGINX Setup
mkdir -p /var/www/localhost
mv ./nginx-host-conf /etc/nginx/sites-available/.
ln -s /etc/nginx/sites-available/nginx-host-conf /etc/nginx/sites-enabled/

# MYSQL Setup
service mysql start
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress'@'localhost' IDENTIFIED BY 'pass';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# PHPMYADMIN Setup
mkdir -p /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xzf phpMyAdmin-4.9.7-all-languages.tar.gz --strip-components 1 -C /var/www/localhost/phpmyadmin
rm -f phpMyAdmin-4.9.7-all-languages.tar.gz
mv config.inc.php /var/www/localhost/phpmyadmin/

# WORDPRESS Setup
mkdir -p /var/www/localhost/wordpress
wget https://fr.wordpress.org/latest-fr_FR.tar.gz
tar xzf latest-fr_FR.tar.gz --strip-components 1 -C /var/www/localhost/wordpress
rm -f latest-fr_FR.tar.gz
mv wp-config.php /var/www/localhost/wordpress

# Start all services
service mysql restart
service nginx start
service php7.3-fpm start
bash
