#!/usr/bin/env bash
# Author: Salman Kha

set -e

sudo apt update

read -p "Do you want to install apache?(y/n): " REPLY
[[ $REPLY =~ ^[Yy]$ ]] && source ./script/apache.sh

read -p "Do you want to install mysql?(y/n): " REPLY
[[ $REPLY =~ ^[Yy]$ ]] && source ./script/mysql.sh

read -p "Do you want to install phpmyadmin?(y/n): " REPLY
[[ $REPLY =~ ^[Yy]$ ]] && source ./script/phpmyadmin.sh

read -p "Do you want to create virtual host?(y/n): " REPLY
[[ $REPLY =~ ^[Yy]$ ]] && source ./script/create_vh.sh

read -p "Do you want to install rdp?(y/n): " REPLY
[[ $REPLY =~ ^[Yy]$ ]] && source ./script/rdp.sh

sudo systemctl restart apache2
echo "Done!"
