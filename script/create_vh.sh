#!/usr/bin/env bash
# Author: Salman Kha

function createVirtualHost() {
    read -p "Enter domain/subdomain: " DOMAIN
    echo "Given domain: '$DOMAIN'"

    read -p "Do you want to continue?(y/n): " REPLY
    [[ ! $REPLY =~ ^[Yy]$ ]] && exit

    # Virtual Host
    echo "Creating Virtual Host For $DOMAIN"
    echo "Creating Root Directory /var/www/$DOMAIN"
    sudo mkdir /var/www/$DOMAIN

    echo "Configuring Permissions"
    sudo chown -R $USER:$USER /var/www/$DOMAIN
    sudo chmod -R 755 /var/www/$DOMAIN

    echo "Creating /var/www/$DOMAIN/index.html"
    echo "Site: $DOMAIN" >/var/www/$DOMAIN/index.html

    echo "Creating Virtual Host /etc/apache2/sites-available/$DOMAIN.conf"

    echo $'<VirtualHost *:80>\nServerAdmin webmaster@localhost\nServerName '$DOMAIN$'\nDocumentRoot /var/www/'$DOMAIN$'\nErrorLog ${APACHE_LOG_DIR}/error.log\nCustomLog ${APACHE_LOG_DIR}/access.log combined\n</VirtualHost>\n' \
        >/etc/apache2/sites-available/$DOMAIN.conf

    echo "Enabling site $DOMAIN.conf"
    sudo a2dissite 000-default.conf
    sudo a2ensite $DOMAIN.conf
    sudo apache2ctl configtest

    sudo systemctl restart apache2

    read -p "Do you want to install ssl?(y/n): " REPLY
    [[ ! $REPLY =~ ^[Yy]$ ]] && exit

    sudo certbot --apache
}

createVirtualHost