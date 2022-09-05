#!/usr/bin/env bash
# Author: Salman Kha

read -p "Enter mysql password: " MYSQL_PASSWORD

sudo apt install mysql-server -y
sudo systemctl start mysql.service

echo "Creating User..."

sudo mysql -u root -e "CREATE USER 'salman'@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
# GRANT PRIVILEGE ON database.table TO 'username'@'host';
sudo mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'salman'@'localhost' WITH GRANT OPTION;"
sudo mysql -u root -e "FLUSH PRIVILEGES;"

echo "Created user salman with password: '$MYSQL_PASSWORD'"
