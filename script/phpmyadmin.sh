#!/usr/bin/env bash
# Author: Salman Kha

if type mysql >/dev/null 2>&1; then
  echo "Installing dependences"
  sudo apt install phpmyadmin php-mbstring php-zip php-gd php-json php-curl -y
  sudo phpenmod mbstring
  sudo systemctl restart apache2

  # If phpmyadmin not configured with apache2
  if [ ! -f /etc/apache2/conf-available/phpmyadmin.conf ]; then
    sudo cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
    sudo a2enconf phpmyadmin
    sudo systemctl restart apache2
  fi
else
  echo "MySql not found"
fi
