#!/bin/bash

# -------------------------------------------------------
# Packages.
# -------------------------------------------------------

apt-get update
apt-get install -y wget zip unzip
apt-get install -y php5 php5-common libapache2-mod-php5 php5-cli

# -------------------------------------------------------
# Symlink.
# -------------------------------------------------------

mkdir /pxn && ln -sf /vagrant /pxn/presskit

# -------------------------------------------------------
# Presskit installation and configuration.
# -------------------------------------------------------

# Download presskit().
cd /tmp
wget http://dopresskit.com/dopresskit_install.zip
mkdir /var/www/presskit
unzip dopresskit_install.zip -d /var/www/presskit/
rm dopresskit_install.zip

# Install presskit().
cd /var/www/presskit/
php install.php

# Clean-up.
rm _data.xml
rm -rf images/
rm install.php

# Symlinks.
ln -sf /pxn/presskit/data.xml /var/www/presskit/
ln -sf /pxn/presskit/images/  /var/www/presskit/

# -------------------------------------------------------
# Apache
# -------------------------------------------------------

echo '<Directory /var/www/presskit>' >> /etc/apache2/apache2.conf
echo '  Options Indexes Multiviews FollowSymLinks' >> /etc/apache2/apache2.conf
echo '</Directory>' >> /etc/apache2/apache2.conf

chmod 755 /var/www/presskit/images
chmod 644 /var/www/presskit/images/*

sudo service apache2 stop
sudo service apache2 start

# -------------------------------------------------------
# Done. \o/
# -------------------------------------------------------

echo "\n\nDone!\n\n"
