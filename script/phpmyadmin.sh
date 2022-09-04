#!/usr/bin/env bash
# Author: Salman Kha

if type mysql >/dev/null 2>&1; then
  echo "Installing dependences"
  sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
  sudo phpenmod mbstring
  sudo systemctl restart apache2
else
  echo "MySql not found"
fi
