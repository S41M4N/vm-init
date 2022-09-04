#!/usr/bin/env bash
# Author: Salman Kha

echo "Installing apache2 php nvm"
sudo apt install apache2 -y
sudo apt install php libapache2-mod-php php-mysql -y
sudo chown -R www-data:www-data /var/www/
sudo chmod -R g+w /var/www/
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
sudo systemctl restart apache2